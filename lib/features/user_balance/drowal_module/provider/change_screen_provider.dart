import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view/screens/sellect_drawal_type.dart';

StateProvider<List<Widget>> DrowalTypeSelectedList =
    StateProvider<List<Widget>>((ref) => [
      SelectDrawalType(),
    ]);
StateProvider<PageController> pageControllerProvider =
    StateProvider<PageController>((ref) => PageController());
