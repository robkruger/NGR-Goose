import cv2
import numpy as np


HSV_LOWER = np.array([100, 100, 135])
HSV_UPPER = np.array([145, 210, 255])

def initialise_detector():
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

    # print(params.filterByArea)
    # print(params.filterByCircularity)
    # print(params.filterByConvexity)
    # print(params.filterByInertia)
    # print(params.filterByColor)

    detector = cv2.SimpleBlobDetector_create(params)
    return detector

def preprocess(image):
    # Convert BGR to HSV
    hsv_image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

    # Apply Gaussian Blur
    blurred_image = cv2.GaussianBlur(hsv_image, (9, 9), 0)

    return blurred_image



def main():
    # Open a connection to the webcam (0 is usually the built-in webcam)
    cap = cv2.VideoCapture(0)

    # initialise a detector
    detector = initialise_detector()
    
    if not cap.isOpened():
        print("Error: Could not open webcam.")
        return

    while True:
        # Capture frame-by-frame
        success, frame = cap.read()

        if not success:
            print("Error: Could not read frame.")
            break


        # preprocess the image
        frame_p = preprocess(frame)

        # generate the mask
        mask = cv2.inRange(frame_p, HSV_LOWER, HSV_UPPER)

        # morphological transformations to clean up mask
        kernel = np.ones((5, 5), np.uint8)
        mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel)

        key_points = detector.detect(mask)

        # cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS ensures the size of the circle corresponds to the size of blob
        im_with_keypoints = cv2.drawKeypoints(mask, key_points, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

        # Bitwise-AND mask and original image
        result = cv2.bitwise_and(frame, frame, mask=mask)

        # Display the resulting frame
        cv2.imshow('Webcam', im_with_keypoints)

        # Break the loop on 'q' key press
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # When everything is done, release the capture and close windows
    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()