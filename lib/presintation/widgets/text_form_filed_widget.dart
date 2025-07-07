import 'package:flutter/material.dart';

import '../../core/colors/colors_manager.dart';

class TextFormFiledWidget extends StatefulWidget {
  TextEditingController controller;
  String hintTxt;
  TextInputType keyType;
  Widget ?suffIcon ;
   TextFormFiledWidget({super.key,required this.controller,required this.hintTxt, required this.keyType, this.suffIcon});

  @override
  State<TextFormFiledWidget> createState() => _TextFormFiledWidgetState();
}

class _TextFormFiledWidgetState extends State<TextFormFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(

        onTap: () {},
        controller: widget.controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManager.marron,
          border: InputBorder.none,
          hintText: widget.hintTxt,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          suffixIcon: widget.suffIcon,
        ),
        keyboardType: widget.keyType,
      ),
    );
  }
}
