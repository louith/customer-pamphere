import 'package:customer/components/constants.dart';
import 'package:flutter/material.dart';

// class FormContainerWidget extends StatefulWidget {
//   final TextEditingController? controller;
//   final Key? fieldKey;
//   final bool? isPasswordField;
//   final String? hintText;
//   final String? labelText;
//   final String? helperText;
//   final FormFieldSetter<String>? onSaved;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String?>? onFieldSubmitted;
//   final TextInputType? inputType;

//   const FormContainerWidget(
//       {this.controller,
//       this.fieldKey,
//       this.isPasswordField,
//       this.hintText,
//       this.labelText,
//       this.helperText,
//       this.onSaved,
//       this.validator,
//       this.onFieldSubmitted,
//       this.inputType});

//       @override
//       _FormContainerWidgetState createState() =>
// }

class FormContainerWidget extends StatefulWidget {
  const FormContainerWidget({
    super.key,
    this.controller,
    this.fieldKey,
    this.isPasswordField,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.icon,
  });
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final TextInputType? inputType;
  final IconData? icon;
  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    IconData? icon;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(.35),
        borderRadius: BorderRadius.circular(90),
      ),
      child: TextFormField(
        style: TextStyle(
            color: kPrimaryColor,
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500),
        cursorColor: kPrimaryColor,
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: widget.hintText,
            // prefixIcon: Icon(icon),
            // prefixIconColor: kPrimaryColor,
            // prefixIcon: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            //     child: Icon(icon)),
            hintStyle: TextStyle(color: const Color.fromARGB(115, 83, 73, 73)),
            suffixIcon: new GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: widget.isPasswordField == true
                  ? Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText == false
                          ? kPrimaryColor
                          : kPrimaryLightColor,
                    )
                  : Text(""),
            )),
      ),
    );
  }
}
