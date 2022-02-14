import 'package:cleantrash_app/screens/camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

//get mockAvailableCameras => [
//  CameraDescription(
//      name: 'camBack',
//      lensDirection: CameraLensDirection.back,),
//  CameraDescription(
//      name: 'camFront',
//      lensDirection: CameraLensDirection.front,),
//];

//oid main(){
// test('Camera available', () async {
//   var camList = await CameraPage();

//   expect(camList, CameraPage());
// });


//
//void main() {
//  testWidgets('Given user in home page When floating action button is pressed Camera opens', (WidgetTester tester) async {
//    // ASSEMBLE
//    await tester.pumpWidget(CameraPage());
//
//    final button = find.byType(FloatingActionButton);
//
//    // ACT
//    await tester.tap(button);
//    await tester.pump();
//
//    // ASSERT
//    final camera = CameraPage();
//    //camera.pickImage();
//    final text = find.text("No Images Selected");
//    expect(text, findsOneWidget);
//  });
//}