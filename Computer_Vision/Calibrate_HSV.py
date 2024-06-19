import cv2
import numpy as np

def nothing(x):
    pass

# Initialize the webcam
cap = cv2.VideoCapture(0)

# Create a window
cv2.namedWindow('Webcam Feed')

# Create trackbars for color change
cv2.createTrackbar('HMin', 'Webcam Feed', 0, 179, nothing) # Hue is from 0-179 for OpenCV
cv2.createTrackbar('SMin', 'Webcam Feed', 0, 255, nothing)
cv2.createTrackbar('VMin', 'Webcam Feed', 0, 255, nothing)
cv2.createTrackbar('HMax', 'Webcam Feed', 0, 179, nothing)
cv2.createTrackbar('SMax', 'Webcam Feed', 0, 255, nothing)
cv2.createTrackbar('VMax', 'Webcam Feed', 0, 255, nothing)

# Set default value for Max HSV trackbars
cv2.setTrackbarPos('HMax', 'Webcam Feed', 179)
cv2.setTrackbarPos('SMax', 'Webcam Feed', 255)
cv2.setTrackbarPos('VMax', 'Webcam Feed', 255)

while True:
    # Capture frame-by-frame
    ret, frame = cap.read()
    
    if not ret:
        print("Failed to grab frame")
        break

    # Convert BGR to HSV
    hsv_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    # Get current positions of all trackbars
    hMin = cv2.getTrackbarPos('HMin', 'Webcam Feed')
    sMin = cv2.getTrackbarPos('SMin', 'Webcam Feed')
    vMin = cv2.getTrackbarPos('VMin', 'Webcam Feed')
    hMax = cv2.getTrackbarPos('HMax', 'Webcam Feed')
    sMax = cv2.getTrackbarPos('SMax', 'Webcam Feed')
    vMax = cv2.getTrackbarPos('VMax', 'Webcam Feed')

    # Set the lower and upper HSV range according to the values selected by the trackbars
    lower_bound = np.array([hMin, sMin, vMin])
    upper_bound = np.array([hMax, sMax, vMax])

    # Create a mask
    mask = cv2.inRange(hsv_frame, lower_bound, upper_bound)

    # Bitwise-AND mask and original image
    result = cv2.bitwise_and(frame, frame, mask=mask)

    # Display the resulting frame
    cv2.imshow('Webcam Feed', result)

    # Break the loop when 'q' is pressed
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the webcam and close all windows
cap.release()
cv2.destroyAllWindows()
