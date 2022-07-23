//
// import 'dart:io';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
//
// Future<XFile?> imgFromGallery() async {
//   final XFile? imageFile =
//   await ImagePicker().pickImage(source: ImageSource.camera);
//   if (imageFile != null) {
//     return imageFile;
//   } else {
//     return null;
//   }
// }
//
//
// Future<String> uploadFile({required XFile imageFile}) async {
//   File photoFile = File(imageFile.path);
//   final path = "gs://do-and-win.appspot.com/${imageFile.name}" ;
//   final file = photoFile;
//   final ref = FirebaseStorage.instance.ref().child(path);
//   UploadTask uploadTask = ref.putFile(file);
//   final snapshot = await uploadTask.whenComplete(() {});
//   final urlDownload = await snapshot.ref.getDownloadURL ();
//   print('Download Link: $urlDownload');
//   return urlDownload;
// }