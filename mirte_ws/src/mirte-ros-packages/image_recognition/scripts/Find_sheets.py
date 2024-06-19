import cv2
import numpy as np


class SheetDetector:
    HSV_LOWER = np.array([100, 100, 135])
    HSV_UPPER = np.array([145, 210, 255])

    def __init__(self, hsv_lower=HSV_LOWER, hsv_upper=HSV_UPPER):
        self._hsv_lower = hsv_lower
        self._hsv_upper = hsv_upper
        self._detector = self._init_detector()

    def _init_detector(self):
        # set parameters for detector
        params = cv2.SimpleBlobDetector_Params()
        
        params.filterByColor = False
        params.filterByCircularity = False
        params.filterByConvexity = False

        params.filterByArea = True
        params.minArea = 150
        params.maxArea = 5000

        params.filterByInertia = True
        params.minInertiaRatio = 0.01

        detector = cv2.SimpleBlobDetector_create(params)
        return detector
    
    @staticmethod
    def _preprocess(image):
        # Convert BGR to HSV
        hsv_image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

        # Apply Gaussian Blur
        blurred_image = cv2.GaussianBlur(hsv_image, (9, 9), 0)

        return blurred_image
    
    def detect_sheets(self, image):
        # TODO: check if image is opencv type

        # preprocess the image
        image_p = self._preprocess(image)

        # generate the mask
        mask = cv2.inRange(image_p, self._hsv_lower, self._hsv_upper)

        # morphological transformations to clean up mask
        kernel = np.ones((5, 5), np.uint8)
        mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel)
        
        # detect
        key_points = self._detector.detect(mask)

        # Draw keypoints on mask to visualise
        # cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS ensures the size of the circle corresponds to the size of blob
        im_with_keypoints = cv2.drawKeypoints(mask, key_points, np.array([]), (0,0,255), 
                                              cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
        return im_with_keypoints
        


if __name__ == "__main__":

    cap = cv2.VideoCapture(0)
    detector = SheetDetector()

    while True:
        # Capture frame-by-frame
        success, frame = cap.read()
        
        if not success:
            print("Failed to grab frame")
            break

        result = detector.detect_sheets(frame)

        cv2.imshow('Webcam Feed', result)

        # Break the loop when 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # Release the webcam and close all windows
    cap.release()
    cv2.destroyAllWindows()