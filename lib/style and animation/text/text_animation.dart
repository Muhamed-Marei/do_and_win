import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ScaleTextAnimation extends StatelessWidget {
  // late List<String> wordList ;

  late double fontSize;
  ScaleTextAnimation({Key? key, required this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black26,
            fontSize: fontSize,
            fontFamily: 'Canterbury',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText('Do'),
              ScaleAnimatedText('&'),
              ScaleAnimatedText('Win'),
            ],
          ),
        ),
      ),
    );
  }
}

class TextAnimation extends StatelessWidget {
  late List<MaterialColor> colorizeColors = [
    Colors.yellow,
    Colors.amber,
    Colors.deepOrange,
    Colors.purple,
    Colors.yellow,
    Colors.amber,
    Colors.yellow,
  ];
  late double fontSize;
  late String text;
  TextAnimation({Key? key, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          text,
          textStyle: TextStyle(
            fontSize: fontSize,
            fontFamily: "Rakkas",
          ),
          colors: colorizeColors,
        ),
      ],
      isRepeatingAnimation: true,
    );
  }
}
