import 'package:calibrum/constants/constant.dart';
import 'package:calibrum/helper/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextArea extends StatelessWidget {
  final Widget prefix;
  final FormFieldValidator<String> validator;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final String hintText;
  final String titleText;
  final TextEditingController fieldController;
  final List<TextInputFormatter> textInputFormatter;
  final TextInputType keyboardType;
  final bool readOnly;
  final bool isSecureTextField;
  final String errorText;
  final String initialValue;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;
  CustomTextArea(
      {this.fieldController,
      this.prefix,
      this.hintText,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.textInputFormatter,
      this.keyboardType,
      this.readOnly,
      this.validator,
      this.errorText,
      this.isSecureTextField,
      this.textInputAction,
      this.initialValue,
      this.onFieldSubmitted,
      this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Responsive.isDesktop(context) ? defaultPadding : padding_10,
          right: Responsive.isDesktop(context) ? defaultPadding : padding_10,
          top: 20),
      child: TextFormField(
        maxLength: maxLength,
        minLines: minLines,
        initialValue: initialValue,
        keyboardType: keyboardType,
        readOnly: readOnly == null ? false : readOnly,
        obscureText: isSecureTextField == null ? false : isSecureTextField,
        inputFormatters: textInputFormatter,
        controller: fieldController,
        textInputAction: textInputAction,
        validator: validator,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(),
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          focusedBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          focusColor: primaryColor,
          labelText: titleText,
          hintText: hintText,
          prefixIcon: prefix,
        ),
        onFieldSubmitted: onFieldSubmitted,
        maxLines: isSecureTextField == true ? 1 : maxLines,
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final double width;
  final Function callBack;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  CustomElevatedButton(
      {Key key,
      this.callBack,
      this.title,
      this.width,
      this.backgroundColor,
      this.height,
      this.fontSize,
      this.textColor,
      this.icon,
      this.iconColor,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height == null ? 40 : height,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: () {
                callBack();
              },
              icon: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
              label: Text(
                title,
                style: TextStyle(color: textColor),
              ),
              style: ElevatedButton.styleFrom(
                primary: backgroundColor,
              ),
            )
          : ElevatedButton(
              onPressed: () {
                callBack();
              },
              child: Text(
                title,
                style: TextStyle(color: textColor),
              ),
              style: ElevatedButton.styleFrom(
                primary: backgroundColor,
              ),
            ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() press;
  final Function onHoverCallBack;
  final Color iconColor;
  const CustomIconButton(
      {Key key, this.icon, this.press, this.iconColor, this.onHoverCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: press,
        onHover: (isHover) {},
        child: Icon(
          icon,
          color: iconColor != null ? iconColor : Colors.white,
        ),
      ),
    );
  }
}

Widget headerWithIcon(IconData _icon, String _title, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        _icon,
        size: 18.0,
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        _title,
        style: TextStyle(
            fontSize: Responsive.isMobile(context) ? 14.0 : 18.0,
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget iconWithText(String label, IconData icon, String value) {
  return Wrap(
    children: [
      Icon(icon),
      SizedBox(width: 15.0),
      Text(label),
    ],
  );
}

Widget copyRight() {
  return Container(
    color: dashboardBG,
    child: Padding(
      padding: EdgeInsets.only(bottom: defaultPadding, top: defaultPadding),
      child: Text(
        " Powered by Calibrum - copyright 2021 Calibrum - All Rights Reserved.",
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(fontSize: 14.0),
            color: Colors.black,
            letterSpacing: 0.5),
      ),
    ),
  );
}
