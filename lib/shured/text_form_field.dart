import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EnterDataTextFormFiled extends StatelessWidget {
  late TextEditingController controller;
  late IconData icon;
  late String labelText;
  late TextInputType textInputType;
  late FormFieldValidator<String> validator;
  late bool enabled ;

  EnterDataTextFormFiled({
    Key? key,
    required this.enabled,
    required this.labelText,
    required this.controller,
    required this.icon,
    required this.textInputType,
    required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
            enabled: enabled,
           // readOnly: true,
            keyboardType: textInputType,
            validator: validator,
            textDirection: TextDirection.ltr,
            controller: controller,
            decoration: InputDecoration(
              labelStyle:  TextStyle(color: Colors.teal,fontSize: 20,fontFamily: "ReemKufi-VariableFont_wght"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(icon),
              labelText: labelText,
            ),
          ),
        ),
      ),
    );
  }
}

// mobile validate
String? validateMobile(value) {
  String patttern = r'(^(?:[0]1)?[0-9]{11}$)';
  RegExp regExp = RegExp(patttern);
  if (value.length == 0) {
    return 'من فضلك ادخل رقم الهاتف';
  } else if (!regExp.hasMatch(value)) {
    return 'ادخل رقم هاتف صحيح';
  }
  return null;
}

// name validate
String? validateName(val) {
  if (val.length < 3) {
    return "name should be more than 3 character ";
  } else {
    return null;
  }
}
String? validateAddress(val) {
  if (val.length < 3) {
    return "please add all address ";
  } else {
    return null;
  }
}
String? validateAge(val) {
  if (val.isEmpty) {
    return "please enter an age ";
  }
  if (double.parse(val) <= 100 && double.parse(val) >= 20) {
    return null;
  } else {
    return "please enter age from 20 to 100";
  }
}


String? validateEmail(val) {

  if (EmailValidator.validate(val)) {
    return null;
  }else{
    return  "please enter a validate email " ;
  }

}