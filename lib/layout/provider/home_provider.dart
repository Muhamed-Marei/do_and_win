import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../initiate_app/splash_screen/splash_screen.dart';

StateProvider<Widget> mainHomeScreenProvider =
StateProvider<Widget>((ref) => SplashScreen());
late WidgetRef mainWidgetRef;
