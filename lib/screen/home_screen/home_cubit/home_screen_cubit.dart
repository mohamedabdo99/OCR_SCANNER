import 'dart:developer';
import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_scanner/screen/home_screen/home_cubit/home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  String result = '';
  File? image;
  ImagePicker? imagePicker;

  Future<void> pickImageFromGaller() async {
    emit(HomeScreenLoadingGetImageFromGallery());
    try {
      PickedFile? pickedFile =
          await imagePicker!.getImage(source: ImageSource.gallery);

      image = File(pickedFile!.path);
      formImageLabeling();
      emit(HomeScreenGetImageFromGallerySuccess());
    } catch (error) {
      emit(HomeScreenGetImageFromGalleryError());
      log('pickImageFromGaller' + error.toString());
    }
  }

  // get image from camera

  Future<void> pickImageFromCamera() async {
    emit(HomeScreenLoadingGetImageFromGallery());
    try {
      PickedFile? pickedFile =
          await imagePicker!.getImage(source: ImageSource.camera);

      image = File(pickedFile!.path);
      formImageLabeling();
      emit(HomeScreenGetImageFromGallerySuccess());
    } catch (error) {
      emit(HomeScreenGetImageFromGalleryError());
      log('pickImageFromGaller' + error.toString());
    }
  }

  // image labeling

  Future<void> formImageLabeling() async {
    final FirebaseVisionImage firebaseVisionImage =
        FirebaseVisionImage.fromFile(image!);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await recognizer.processImage(firebaseVisionImage);
    for (TextBlock block in visionText.blocks) {
      final String txt = block.text!;
      for (TextLine textLine in block.lines) {
        for (TextElement textElement in textLine.elements) {
          result += textElement.text! + " ";
        }
      }
      result += "\n\n";
    }
    emit(HomeScreenFormImageLabeling());
  }
}
