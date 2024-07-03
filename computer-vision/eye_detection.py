#!/usr/bin/env python3

# Eye Detection using Haar Cascades
# Haar Cascades are machine learning based classifiers that calculate different features like edges, lines, etc in the image.
# They are trained on a lot of positive and negative images to get a good classifier.
# The Haar Cascades are stored as XML files and can be found in the OpenCV data folder.

# to run this code, ./eye_detection.py
# press Esc to exit the program

import cv2
import numpy as np

# use face cascade then eye cascade to improve efficiency
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_alt.xml")
eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_eye.xml")

if face_cascade.empty():
    raise IOError("Unable to load face cascade classifier")

if eye_cascade.empty():
    raise IOError("Unable to load eye cascade classifier")

cap = cv2.VideoCapture(0)
ds_factor = 0.5

while True:
    ret, frame = cap.read()
    frame = cv2.resize(frame, None, fx= ds_factor, fy= ds_factor, interpolation= cv2.INTER_AREA)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)
    for (x, y, w, h) in faces:
        roi_gray = gray[y:y+h, x:x+w]
        roi_color = frame[y:y+h, x:x+w]
        eyes = eye_cascade.detectMultiScale(roi_gray)
        for (x_eye, y_eye, w_eye, h_eye) in eyes:
            center = (int(x_eye + 0.5 * w_eye), int(y_eye + 0.5 * h_eye))
            radius = int(0.3 * (w_eye + h_eye))
            color = (0, 255, 0)
            thickness = 3
            cv2.circle(roi_color, center, radius, color, thickness)
            
    cv2.imshow("Eye Detector", frame)
    
    # press Esc to exit the program
    c = cv2.waitKey(1)
    if c == 27:
        break

cap.release()
cv2.destroyAllWindows()
