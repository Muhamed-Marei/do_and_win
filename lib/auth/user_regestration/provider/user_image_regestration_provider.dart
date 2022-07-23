import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../google_auth/google_auth.dart';
import '../model/user_regestration_model.dart';

StateProvider<String> userImageLinkProvuder = StateProvider<String>((ref) {
  String imageLink = ref.watch(currentUserDataProvider.state).state.imageUrl ==
          null
      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOc9VDs02ZrmIC7pS3WzBTvXl8UrI3jwAOVQ&usqp=CAU"
      : ref.watch(currentUserDataProvider.state).state.imageUrl;
  return imageLink;
});

StateProvider CurrentImageFileProvuder = StateProvider((ref) {
  return "null";
});

StateProvider<ImageProvider> userImageViewProvider =
    StateProvider<ImageProvider>((ref) {
  return viewImage(
      imageLink: ref.watch(userImageLinkProvuder.state).state,
      cheekUplodedFile: false);
});

ImageProvider viewImage(
    {XFile? photoFile, String? imageLink, required bool cheekUplodedFile}) {
  late File imageFile;
  if (photoFile != null) {
    imageFile = File(photoFile.path);
  }
  if (cheekUplodedFile != false) {
    if (kIsWeb) {
      if (cheekUplodedFile) {
        return NetworkImage(imageFile.path);
      } else {
        return NetworkImage(imageLink!);
      }
    } else {
      if (cheekUplodedFile) {
        return FileImage(
          File(imageFile.path),
        );
      } else {
        return NetworkImage(imageLink!);
      }
    }
  } else {
    return NetworkImage(imageLink!);
  }
}

StateProvider<UserRegestrationModel> currentUserDataProvider =
    StateProvider<UserRegestrationModel>((ref) => UserRegestrationModel(
          email: '',
          phone: '',
          uId: '',
          name: '',
          imageUrl: '',
          currentPoint: 0,
          totalPoint: 0,
          chargingPoints: 0,
          givenPoint: 0,
          inviteUsersPoint: 0,
          taskPoint: 0,
          watchVideoPoint: 0,
          block: false,
        ));
