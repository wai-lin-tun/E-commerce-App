import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier{
  File? pickImage;
  File? imageTemp;
  ImagePicker picker = ImagePicker();
  imageFromGallery (context)async{
  try{
   var imageFromGallery = await picker.pickImage(source:ImageSource.gallery);
   if(imageFromGallery == null)return imageFromGallery;
   imageTemp = File(imageFromGallery.path);
   print("image $imageTemp");
   equableImage();
    Navigator.pop(context);
  }on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  imageFromCamera (context)async{
  try{
   var imageFromCamera = await picker.pickImage(source:ImageSource.camera);
   if(imageFromCamera == null)return imageFromCamera;
   imageTemp = File(imageFromCamera.path);
   equableImage();
   Navigator.pop(context);
  }on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  equableImage(){
    pickImage = imageTemp ;
    notifyListeners();
  }
}