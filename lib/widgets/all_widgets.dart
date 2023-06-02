import 'package:flutter/material.dart';
import 'package:getxdemo/const/colors.dart';

OutlineInputBorder customOutlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.grey.shade400,
      width: 1.5,
    ),
  );
}

///text-Regular
Widget textRegular({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
  dynamic alignment,
}) {
  return Text(
    text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    textAlign: alignment ?? TextAlign.left,
  );
}

///text-Bold Style
Widget textBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Thin Style
Widget textThin({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    maxLines: 20,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Extra Light Style
Widget textExtraLight({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    maxLines: 1,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w200,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text- Light Style
Widget textLight({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Medium Style
Widget textMedium({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    // maxLines: 1,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
      fontFamily: "text",
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Black Style
Widget textBlack({
  String text = "",
  double size = 10,
  Color? color,
}) {
  return Text(
    text,
    maxLines: 1,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
    ),
  );
}

///text-Semi Bold Style
Widget textSemiBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
}) {
  return Text(
    text,
    maxLines: maxLine,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  );
}

///Navigate Push
goto(BuildContext context, Widget nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///Navigate Without Back
gotoWithoutBack(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///Navigate Untill Remove
gotoUtillBack(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ),
      (route) => false);
}

///Pop Navigate
goBack(BuildContext context) {
  Navigator.of(context).pop();
}

///SnackBar
showSnackbar(
  BuildContext context,
  String content,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: blue,
      content: textBold(
        text: content,
        size: 16,
        color: white,
      ),
    ),
  );
}

///Vertical Space
Widget vSpace(
  double h,
) {
  return SizedBox(
    height: h,
  );
}

///Horizontal Space
Widget hSpace(
  double w,
) {
  return SizedBox(
    width: w,
  );
}

///Custom Indicator
Widget progressIndicator(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(
        backgroundColor: white,
        color: red,
      ),
    ),
  );
}

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
