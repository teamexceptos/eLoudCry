import 'package:eloudcry/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MkInputField extends StatelessWidget {
  const MkInputField(
      {@required this.controller,
        @required this.currentNode,
        this.label,
        this.hint,
        this.nextNode,
        this.isPassword = false,
        this.autoValidate = false,
        this.errorText,
        this.onChanged,
        this.validator,
        this.borderColor,
        this.onsaved,
        this.keyboard,
        this.initialValue,
        this.copy = false,
        this.isEnabled = true,
        this.onFieldSubmitted,
        this.textInputAction,
        this.maxLines = 1,
        this.showHint = true,
        this.isForgottenOption = false,
        this.inputFormatters,
      })
      : assert(controller != null && label != null);

  final String label;
  final String hint;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final String errorText;
  final bool isPassword;
  final Function(String) onChanged;
  final Function(String) validator;
  final Function(String) onsaved;
  final TextInputType keyboard;
  final bool isEnabled;
  final bool copy;
  final bool autoValidate;
  final String initialValue;
  final TextInputAction textInputAction;
  final dynamic onFieldSubmitted;
  final int maxLines;
  final bool showHint;
  final TextEditingController controller;
  final bool isForgottenOption;
  final List<TextInputFormatter> inputFormatters;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: isEnabled,
      initialValue: initialValue,
      keyboardType: keyboard,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      focusNode: currentNode,
      inputFormatters: inputFormatters,
      onSaved: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onsaved(value);
      },
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onFieldSubmitted(value);
      },
      textInputAction: textInputAction,
      autovalidate: autoValidate,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label ?? " ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: XColors.mainColor().withOpacity(0.4)),
        ),
        fillColor: XColors.mainColor().withOpacity(0.03),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
      ),
    );
  }
}

class MkInputField2 extends StatelessWidget {
  const MkInputField2(
      {@required this.controller,
        @required this.label,
        @required this.currentNode,
        this.hint,
        this.nextNode,
        this.isPassword = false,
        this.autoValidate = false,
        this.errorText,
        this.onChanged,
        this.validator,
        this.borderColor,
        this.onsaved,
        this.keyboard,
        this.initialValue,
        this.copy = false,
        this.isEnabled = true,
        this.onFieldSubmitted,
        this.textInputAction,
        this.maxLines = 1,
        this.showHint = true,
        this.isForgottenOption = false,
        this.inputFormatters})
      : assert(controller != null && label != null);

  final String label;
  final String hint;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final String errorText;
  final bool isPassword;
  final Function(String) onChanged;
  final Function(String) validator;
  final Function(String) onsaved;
  final TextInputType keyboard;
  final bool isEnabled;
  final bool copy;
  final bool autoValidate;
  final String initialValue;
  final TextInputAction textInputAction;
  final dynamic onFieldSubmitted;
  final int maxLines;
  final bool showHint;
  final TextEditingController controller;
  final bool isForgottenOption;
  final List<TextInputFormatter> inputFormatters;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: isEnabled,
      initialValue: initialValue,
      keyboardType: keyboard,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      focusNode: currentNode,
      inputFormatters: inputFormatters,
      onSaved: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onsaved(value);
      },
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onFieldSubmitted(value);
      },
      textInputAction: textInputAction,
      autovalidate: autoValidate,
      decoration: new InputDecoration(
        fillColor: XColors.mainColor().withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(11.0)),
          borderSide: BorderSide(
            color: XColors.textColor().withOpacity(0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(11.0)),
          borderSide: BorderSide(
            color: XColors.primaryColor().withOpacity(0.1),
            width: 1
          ),
        ),
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: XColors.primaryColor())),
        filled: true,
        contentPadding: EdgeInsets.only(bottom: 17, left: 10.0, right: 10.0, top: 17),
        labelText: label,
        labelStyle: TextStyle(color: XColors.textGrey(), fontWeight: FontWeight.w400),
      ),
      style: TextStyle(color: XColors.textColor(), fontWeight: FontWeight.w400, fontSize: 16),
    );
  }
}

class MkUnderlineInputField extends StatelessWidget {
  const MkUnderlineInputField(
      {@required this.controller,
        this.currentNode,
        this.hint,
        this.nextNode,
        this.isPassword = false,
        this.autoValidate = false,
        this.errorText,
        this.onChanged,
        this.validator,
        this.borderColor,
        this.onsaved,
        this.keyboard,
        this.initialValue,
        this.copy = false,
        this.isEnabled = true,
        this.onFieldSubmitted,
        this.textInputAction,
        this.maxLines = 1,
        this.showHint = true,
        this.isForgottenOption = false,
        this.inputFormatters,
        this.suffixIcon
      });

  final String hint;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final String errorText;
  final bool isPassword;
  final Function(String) onChanged;
  final Function(String) validator;
  final Function(String) onsaved;
  final TextInputType keyboard;
  final bool isEnabled;
  final bool copy;
  final bool autoValidate;
  final String initialValue;
  final TextInputAction textInputAction;
  final dynamic onFieldSubmitted;
  final int maxLines;
  final bool showHint;
  final TextEditingController controller;
  final bool isForgottenOption;
  final List<TextInputFormatter> inputFormatters;
  final Color borderColor;
  final Icon suffixIcon;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: isEnabled,
      initialValue: initialValue,
      keyboardType: keyboard,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      focusNode: currentNode,
      inputFormatters: inputFormatters,
      onSaved: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onsaved(value);
      },
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onFieldSubmitted(value);
      },
      textInputAction: textInputAction,
      autovalidate: autoValidate,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hint,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(color: XColors.primaryColor().withOpacity(0.4)),
        ),
        fillColor: XColors.mainColor().withOpacity(0.02),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      style: TextStyle(color: XColors.textColor(), fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class PasswordValiditor {
  static String validate(String val) {
    Pattern pattern = r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    RegExp regex = RegExp(pattern);
    print(val);
    if (val.isEmpty) {
      return "Enter a password";
    } else if (val.length < 6 || (!regex.hasMatch(val))) {
      return "Password not strong enough";
    } else {
      return null;
    }
  }
}

class EmailValiditor {
  static String validate(String val) {
    print(val);
    if (!val.contains("@") || !val.contains(".")) {
      return "Enter a valid Email address";
    } else if (val.isEmpty) {
      return "Enter your Email address";
    } else {
      return null;
    }
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) { assert(mask != null); assert (separator != null); }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.length > 0) {
      if(newValue.text.length > oldValue.text.length) {
        if(newValue.text.length > mask.length) return oldValue;
        if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
