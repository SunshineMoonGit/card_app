// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'dart:io';
// import 'package:image/image.dart' as img;

// // 이미지 파일을 인식하는 함수
// Future<void> detectCard(String imagePath) async {
//   final inputImage = InputImage.fromFilePath(imagePath);
//   final imageLabeler = GoogleMlKit.vision.imageLabeler();

//   final labels = await imageLabeler.processImage(inputImage);

//   for (ImageLabel label in labels) {
//     final text = label.label;
//     final confidence = label.confidence;
//     print('Detected: $text with confidence: $confidence');
//   }

//   imageLabeler.close();
// }

// Future<void> saveDetectedCard(String imagePath) async {
//   final imageFile = File(imagePath);
//   final image = img.decodeImage(imageFile.readAsBytesSync());

//   if (image == null) {
//     print('Could not decode image');
//     return;
//   }

  // 여기서 카드의 좌표를 얻는다고 가정합니다.
  // 예시 좌표 (x, y, width, height)
  // final cardRect = img.Rect.fromLTWH(100, 100, 200, 300);

  // final croppedImage = img.copyCrop(image, cardRect.left, cardRect.top, cardRect.width, cardRect.height);
  // final croppedFile = File('${imageFile.parent.path}/cropped_card.png')
  //   ..writeAsBytesSync(img.encodePng(croppedImage));

  // print('Cropped image saved: ${croppedFile.path}');
// }
