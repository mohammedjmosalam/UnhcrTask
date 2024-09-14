import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/extension/num_extension.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.fontSize = 9,
    this.colorText,
    this.fontFamily,
    this.isBold = false,
    this.isRemoved = false,
    this.textDirection,
    this.maxLine,
    this.stringAsFixed,
    this.isNeedFormateNumber = true,
    this.textAlign = TextAlign.start,
  }) : onTap = null;
  const AppText.button({
    super.key,
    required this.text,
    required Function() this.onTap,
    this.fontSize = 9,
    this.colorText,
    this.fontFamily,
    this.isBold = false,
    this.isRemoved = false,
    this.maxLine,
    this.textDirection,
    this.stringAsFixed,
    this.textAlign = TextAlign.start,
    this.isNeedFormateNumber = true,
  });
  final String text;
  final double fontSize;
  final Color? colorText;
  final String? fontFamily;
  final bool isBold;
  final Function()? onTap;
  final int? maxLine;
  final bool isRemoved;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final bool isNeedFormateNumber;
  final int? stringAsFixed;
  // * get text direction
  TextDirection get getTextDirection =>
      intl.Bidi.isRtlLanguage(text) ? TextDirection.rtl : TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: onTap != null ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
        child: Text(
          text,
          softWrap: maxLine == null,
          maxLines: maxLine,
          textAlign: textAlign,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
          textDirection: textDirection ?? getTextDirection,
          style: TextStyle(
            decoration: isRemoved ? TextDecoration.lineThrough : null,
            color: colorText ?? context.theme.textAndIconColor,
            fontSize: fontSize.fontSizeApp,
            fontWeight: isBold ? FontWeight.bold : null,
            fontFamily: fontFamily ?? fontFamily ?? context.fontBaseOnLang,
          ),
        ),
      ),
    );
  }
}
