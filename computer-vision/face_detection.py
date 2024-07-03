#!/usr/bin/env python3

# Face Detection using Haar Cascades
# Haar Cascades are machine learning based classifiers that calculate different features like edges, lines, etc in the image.
# They are trained on a lot of positive and negative images to get a good classifier.
# The Haar Cascades are stored as XML files and can be found in the OpenCV data folder.

# to run this code, ./face_detection.py
# press Esc to exit the program

import cv2
import numpy as np

face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_alt.xml")

cap = cv2.VideoCapture(0)
scaling_factor = 0.5

while True:
    ret, frame = cap.read()
    frame = cv2.resize(frame, None, fx= scaling_factor, fy= scaling_factor, interpolation= cv2.INTER_AREA)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    
    face_rects = face_cascade.detectMultiScale(gray, 1.3, 5)
    for (x, y, w, h) in face_rects:
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 3)
        
    cv2.imshow("Face Detector", frame)
    
    # press Esc to exit the program
    c = cv2.waitKey(1)
    if c == 27:
        break

cap.release()
cv2.destroyAllWindows()
