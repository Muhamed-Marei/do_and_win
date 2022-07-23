import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/user_profile/provider/user_provider.dart';
import '../../provider/user_image_regestration_provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:image_picker/image_picker.dart';

class userRegestrationImageWidget extends StatelessWidget {
  userRegestrationImageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: IntrinsicHeight(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: ref
                      .watch(userImageViewProvider.state)
                      .state, // NetworkImage(currentUserData.photoURL!),
                ),
                ref.watch(enabledProvider.state).state
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.teal,
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              imgFromGallery()
                                  .whenComplete(() => null)
                                  .then((value) {
                                if (value == null) {

                                } else {
                                  ref
                                      .watch(CurrentImageFileProvuder.state)
                                      .state = value;
                                  ref.watch(userImageViewProvider.state).state =
                                      viewImage(
                                          photoFile: value,
                                          cheekUplodedFile: true);
                                }
                              });
                            },
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              ref.watch(enabledProvider.state).state = true;
                            },
                          ),
                        ),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}

Future<XFile?> imgFromGallery() async {
  final XFile? imageFile =
      await ImagePicker().pickImage(source: ImageSource.camera);
  if (imageFile != null) {
    return imageFile;
  } else {
    return null;
  }
}

Future<String> uploadFile({required XFile imageFile}) async {
  File photoFile = File(imageFile.path);
  final path = "UsersImage/${imageFile.name}";
  final file = photoFile;
  final ref = FirebaseStorage.instance.ref().child(path);
  UploadTask uploadTask = ref.putFile(file);
  final snapshot = await uploadTask.whenComplete(() {});
  final urlDownload = await snapshot.ref.getDownloadURL();
  print('Download Link: $urlDownload');
  return urlDownload;
}
