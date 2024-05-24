import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image? _image;

  final picker = ImagePicker();
  XFile? pickedFile = null;
  String classfication = '';
  double accuracy = 0.0;

  Future getImage() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (kIsWeb) {
          _image = Image.network(
            pickedFile!.path,
            scale: 7,
          );
        } else {
          _image = Image.file(
            File(pickedFile!.path),
            scale: 7,
          );
        }
      } else {
        print('هیچ وێنەیەک نییە');
      }
    });
  }

  // Function to call API and send image file
  Future<void> callAPIAndPrintResponse(XFile imageFile) async {
    try {
      final String apiUrl = 'http://127.0.0.1:5000/predict';

      // Read the image file as bytes
      List<int> imageBytes = await imageFile.readAsBytes();

      // Create FormData
      var formData = http.MultipartRequest('POST', Uri.parse(apiUrl));
      formData.files.add(http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: 'image.jpg',
      ));

      // Send the request
      var response = await formData.send();

      // Get response
      var responseBody = await response.stream.bytesToString();

      // Print response
      print('Response: ${jsonDecode(responseBody)}');

      setState(() {
        classfication = jsonDecode(responseBody)['predicted_label'];
        accuracy = jsonDecode(responseBody)['prediction_accuracy'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff368983),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Column(
                    children: [
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Icons8_flat_add_image.svg/1024px-Icons8_flat_add_image.svg.png",
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        'هیچ وێنەیەک نییە  ',
                      ),
                    ],
                  )
                : Image(
                    image: _image!.image,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImage,
              child: Text(' وێنەیەک دیاری بکە'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => callAPIAndPrintResponse(pickedFile!),
              child: Text('ناردن بۆ سێرفەر'),
            ),
            Text(
                'Predicted Classification: $classfication\nPrediction Accuracy: ${accuracy.toStringAsFixed(3)}'),
          ],
        ),
      ),
    );
  }
}
