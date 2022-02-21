
import 'package:cleantrash_app/screens/camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetForTesting({Widget? child}){
    return MaterialApp(
      home: child,
    );
  }
  group('Camera Test', () {
    testWidgets('Open Camera', (WidgetTester tester) async {
      await tester.pumpWidget( createWidgetForTesting(child: CameraPage()));
      final cameraAvail = ImageSource.camera;
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pump();
      //expect(ImageSource.camera, ImageSource.camera); //This works but isn't the right way to test
      expect(cameraAvail, findsOneWidget); //Gives error of Null is not subtype of 'Finder' in type cast

    });
    //testWidgets('Display Picture', (WidgetTester tester) async {
    //  await tester.pumpWidget( createWidgetForTesting(child: new _displayPictureScreen()));
    //  await tester.tap(find.byIcon(Icons.check));
    //  await tester.pump();
    //  expect(find.Image.file(File(imagePath)), findsOneWidget);
    //});
  });
}