#!/usr/bin/env python3

# program opens the webcam and displays the video feed
# run program by ./open_webcam.py
# press Esc to exit the program

import cv2

cap = cv2.VideoCapture(0)

# check if the wwebcam is open correctly
if not cap.isOpened():
    raise IOError("cannot open webcam")

while True:
    ret, frame = cap.read() # ret is a boolean value returned by read() indication whether the frame was captured successfully
    frame = cv2.resize(frame, None, fx = 0.5, fy = 0.5,
                       interpolation = cv2.INTER_AREA)
    cv2.imshow("input", frame)
    
    c = cv2.waitKey(1)
    
    # press Esc to exit the program
    if c == 27: # ASCII value of Esc
        break
    
cap.release()   # gracefully closes the webcam
cv2.destroyAllWindows()
