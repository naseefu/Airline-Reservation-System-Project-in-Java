import cv2
import numpy as np
from keras.models import load_model
from flask import Flask, render_template, request, jsonify
import base64

app = Flask(__name__)
model = load_model('model.h5')
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

def detect_emotion(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, 1.1, 4)

    for (x, y, w, h) in faces:
        face_img = gray[y:y+h, x:x+w]
        resized_img = cv2.resize(face_img, (48, 48))
        normalized_img = resized_img / 255.0
        reshaped_img = np.reshape(normalized_img, (1, 48, 48, 1))
        result = model.predict(reshaped_img)

        emotion_label = np.argmax(result)
        emotion = get_emotion_label(emotion_label)

        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
        cv2.putText(frame, emotion, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)

    return frame, emotion

def get_emotion_label(emotion_index):
    labels = ["angry","disgust","fear","disgust","fear","sad","surprise"]
    return labels[emotion_index]

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/capture', methods=['POST'])
def capture():
 
    image_data = request.form['imageData']
    image_data = image_data.split(",")[1]
    img_data = base64.b64decode(image_data)
    nparr = np.frombuffer(img_data, np.uint8)
    img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)


    processed_frame, emotion = detect_emotion(img)


    _, processed_frame_data = cv2.imencode('.png', processed_frame)
    processed_frame_base64 = base64.b64encode(processed_frame_data).decode('utf-8')

    return jsonify({'status': 'success', 'emotion': emotion, 'processedFrame': processed_frame_base64})

if __name__ == '__main__':
    app.run()
