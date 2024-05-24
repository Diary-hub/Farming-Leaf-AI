from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np
import tensorflow as tf
from PIL import Image
from io import BytesIO

# Initialize Flask app
app = Flask(__name__)
CORS(app)

# Load the pre-trained Keras model
model = tf.keras.models.load_model("model_epochs5.hdf5")

# Define allowed file extensions for image uploads
ALLOWED_EXTENSIONS = {"jpg"}


def allowed_file(filename):
    """Check if the filename has an allowed extension"""
    return "." in filename and filename.rsplit(".", 1)[1].lower() in ALLOWED_EXTENSIONS


def preprocess_image(image_file):
    HEIGHT = 128
    WIDTH = 128

    # Read the image directly from the FileStorage object
    image = Image.open(image_file.stream)  # Use PIL to open image streams
    image = image.resize((WIDTH, HEIGHT))  # Resize the image

    # Convert the image to a numpy array
    img_array = tf.keras.preprocessing.image.img_to_array(image)
    # Rescale the image by dividing by 255
    img_array /= 255.0
    # Expand dimensions to add batch dimension
    img_array = np.expand_dims(img_array, axis=0)

    # Print the shape of the preprocessed image
    print("Preprocessed image shape:", img_array.shape)
    return img_array


@app.route("/predict", methods=["POST"])
def predict():
    """Handle image upload and model prediction"""
    # Check if the post request has the file part
    if "file" not in request.files:
        return jsonify({"error": "No file part in the request"}), 400

    file = request.files["file"]

    if file.filename == "":
        return jsonify({"error": "No file selected for uploading"}), 400

    if file and allowed_file(file.filename):
        # Preprocess the image and predict
        image = preprocess_image(file)
        predictions = model.predict(image)
        predicted_class_index = np.argmax(predictions, axis=-1)[0]
        predicted_class_probability = np.max(predictions)

        # Define class labels based on your training data labels
        class_labels = {
            0: "complex",
            1: "frog_eye_leaf_spot",
            2: "frog_eye_leaf_spot complex",
            3: "healthy",
            4: "powdery_mildew",
            5: "powdery_mildew complex",
            6: "rust",
            7: "rust complex",
            8: "rust frog_eye_leaf_spot",
            9: "scab",
            10: "scab frog_eye_leaf_spot",
            11: "scab frog_eye_leaf_spot complex",
        }
        # Format the response
        response = {
            "predicted_label": class_labels[predicted_class_index],
            "prediction_accuracy": float(predicted_class_probability),
        }
        return jsonify(response)
    else:
        return jsonify({"error": "Allowed file type is jpg"}), 400


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
