// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../../shured/text_form_field.dart';
// import '../../../../../style and animation/text/text_animation.dart';
// import '../../../view/widgets/cards/withdrawal_request_card.dart';
// import '../screens/vf-cash-aligment/enter_the_palance_aligment.dart';
//
// class DrawalRequestBottomSheet extends StatelessWidget {
//   DrawalRequestBottomSheet({Key? key}) : super(key: key);
//   final PageController controller = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/black.webp"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child:PageView(
//         controller: controller,
//         children: [
//           DrawalRequestByVodafonCash(),
//           DrawalRequestByVodafonCash()
//         ],
//       ),
//     );
//   }
// }
// class DrawalRequestByVodafonCash extends StatelessWidget {
//    DrawalRequestByVodafonCash({Key? key}) : super(key: key);
//   TextEditingController pointNumberController = TextEditingController();
//   TextEditingController balanceNumberController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     return  Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
//       return Form(
//         key: _formKey,
//         child:  SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextAnimation(
//                     fontSize: 20,
//                     text: "  طلب السحب ",
//                   ),
//                   IconButton(
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           barrierDismissible: false,
//                           builder: (BuildContext context) {
//                             return const AlertDialPointsCost();
//                           },
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.data_usage,
//                         color: Colors.teal,
//                       ))
//                 ],
//               ),
//               EnterDataTextFormFiled(
//                 enabled: false,
//                 icon: Icons.equalizer,
//                 textInputType: TextInputType.number,
//                 labelText: 'المبلغ بالجنيه',
//                 validator: (val) {},
//                 controller: balanceNumberController,
//               ),
//               TextFormField(
//                 autofocus: true,
//                 //  enabled: true,
//                 onChanged: (val) {
//                   if (pointNumberController.text.isEmpty) {
//                     balanceNumberController.text = 0.toString();
//                   } else {
//                     if (pointNumberController.text.isEmpty) {
//                       balanceNumberController.text = 0.toString();
//                     } else {
//                       balanceNumberController.text =
//                           (int.parse(val) / 2).toString();
//                     }
//                   }
//                 },
//                 keyboardType: TextInputType.number,
//                 validator: (val) {
//                   if (pointNumberController.text.length != 0 &&
//                       int.parse(pointNumberController.text) <=
//                           ref.watch(todosProvider).currentPoint) {
//                     return null;
//                   } else {
//                     return "please right data ";
//                   }
//                 },
//                 textDirection: TextDirection.ltr,
//                 controller: pointNumberController,
//                 decoration: InputDecoration(
//                   labelStyle: const TextStyle(
//                       color: Colors.teal,
//                       fontSize: 20,
//                       fontFamily: "ReemKufi-VariableFont_wght"),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   prefixIcon: const Icon(
//                     Icons.monetization_on,
//                     color: Colors.amber,
//                   ),
//                   labelText: 'ادخل عدد النقاط',
//                 ),
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                     child: const Text(
//                       "الغاء",
//                       style: TextStyle(color: Colors.red),
//                     ),
//                     onPressed: () {
//                       pointNumberController.clear();
//                       balanceNumberController.clear();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   TextButton(
//                     child: const Text(
//                       "طلب السحب",
//                       style: TextStyle(color: Colors.teal),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         pointNumberController.clear();
//                         balanceNumberController.clear();
//                         Navigator.of(context).pop();
//                         showModalBottomSheet<void>(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return DrawalRequestBottomSheet();
//                           },
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       );
//     },);
//   }
// }
// // class EnterPointTextFormField extends StatefulWidget {
// //    EnterPointTextFormField({Key? key,required this.balanceNumberController ,required this.pointNumberController}) : super(key: key);
// //  late TextEditingController pointNumberController ;
// //  late TextEditingController balanceNumberController ;
// //
// //    bool _autofocus  = false ;
// //   @override
// //   State<EnterPointTextFormField> createState() => _EnterPointTextFormFieldState();
// // }
// //
// // class _EnterPointTextFormFieldState extends State<EnterPointTextFormField> {
// //   @override
// //
// //   Widget build(BuildContext context) {
// //     return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
// //       return TextFormField(
// //         autofocus: widget._autofocus,
// //         enabled: true,
// //         onTap: (){
// //
// //             setState((){
// //               widget._autofocus != widget._autofocus ;
// //             });
// //         },
// //         onChanged: (val) {
// //           if (widget.pointNumberController.text.isEmpty) {
// //             widget.balanceNumberController.text = 0.toString();
// //           } else {
// //             if (widget.pointNumberController.text.isEmpty) {
// //               widget.balanceNumberController.text = 0.toString();
// //             } else {
// //               widget.balanceNumberController.text =
// //                   (int.parse(val) / 2).toString();
// //             }
// //           }
// //         },
// //         keyboardType: TextInputType.number,
// //         validator: (val) {
// //           if (widget.pointNumberController.text.length != 0 &&
// //               int.parse(widget.pointNumberController.text) <=
// //                   ref.watch(todosProvider).currentPoint) {
// //             return null;
// //           } else {
// //             return "please right data ";
// //           }
// //         },
// //         textDirection: TextDirection.ltr,
// //         controller: widget.pointNumberController,
// //         decoration: InputDecoration(
// //           labelStyle: const TextStyle(
// //               color: Colors.teal,
// //               fontSize: 20,
// //               fontFamily: "ReemKufi-VariableFont_wght"),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           prefixIcon: const Icon(
// //             Icons.monetization_on,
// //             color: Colors.amber,
// //           ),
// //           labelText: 'ادخل عدد النقاط',
// //         ),
// //       ) ;
// //     },);
// //   }
// // }
