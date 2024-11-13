import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxlines;
  final TextOverflow? textOverflow;
  final EdgeInsets? padding;

  const TextWidget(
      {Key? key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.maxlines,
      this.textOverflow,
      this.padding})
      : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Text(widget.text ?? '',
          softWrap: true,
          overflow: widget.textOverflow ?? TextOverflow.ellipsis,
          maxLines: widget.maxlines ?? 4,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.color,
          ),
          textAlign: widget.textAlign),
    );
  }
}

class AppColor {
  static final Color primaryBlue = HexColor("#262D68");
  static final Color outlineBorderColor = HexColor("#999292");
  static final Color iconColor = HexColor("#78809A");
  static final Color inputTextColor = HexColor("#7D7D7D");
  static final Color shadowColor = HexColor("#2A306B80");
  static final Color titleColor = HexColor("#050505");
  static final Color titleBlack0000 = HexColor("#000000");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    final hexNum = int.parse(hexColor, radix: 16);

    if (hexNum == 0) {
      return 0xff000000;
    }

    return hexNum;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class ColorToHex extends Color {
  static int _convertColorTHex(Color color) {
    var hex = '${color.value}';
    return int.parse(
      hex,
    );
  }

  ColorToHex(final Color color) : super(_convertColorTHex(color));
}

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,
    this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onChange,
  });

  final String? hintText;
  final TextEditingController controller;
  void Function(String)? onChange;
  Widget? prefixIcon;
  Widget? suffixIcon;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextField(
          controller: widget.controller,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 10, color: AppColor.inputTextColor),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColor.inputTextColor, fontSize: 10),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 19, vertical: 0),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.outlineBorderColor, width: .5),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryBlue, width: .5),
                borderRadius: BorderRadius.circular(8)),
            suffixIcon: (widget.controller.text.isNotEmpty)
                ? IconButton(
                    onPressed: () {
                      widget.controller.clear();
                      setState(() {});
                    },
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    icon:
                        Icon(Icons.clear, color: AppColor.iconColor, size: 17))
                : const SizedBox.shrink(),
            prefixIcon: widget.prefixIcon,
          ),
          onChanged: widget.onChange ??
              (_) {
                setState(() {});
              }),
    );
  }
}

searchSelectButton(Widget child) {
  return Container(
    height: 30,
    width: 30,
    margin: const EdgeInsets.only(left: 4),
    decoration: BoxDecoration(
      color: AppColor.primaryBlue,
      boxShadow: [
        BoxShadow(
            color: AppColor.shadowColor.withOpacity(.5),
            blurRadius: 4,
            offset: const Offset(0, 2))
      ],
      borderRadius: BorderRadius.circular(8.0),
    ),
    alignment: Alignment.center,
    child: child,
  );
}
