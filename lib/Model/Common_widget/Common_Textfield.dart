import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatefulWidget {
  final String data;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Color? color;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final bool obscureText;
  final int ?maxLength;
  final String ?Function(String?)? validator;

  const CommonTextField(
      {super.key,
      required this.data,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.color,
      this.focusNode, required this.obscureText, this.validator,  this.maxLength, this.suffixIcon,});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late FocusNode _focusNode;
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.data,style:GoogleFonts.exo(
          fontSize: 14,
          fontWeight:FontWeight.w600,
          color: Color(0xff3B757F),
        ),),
        Container(
          padding: EdgeInsets.symmetric(horizontal:3, vertical: 3),
          decoration: BoxDecoration(
            color: _focusNode.hasFocus ? Color(0xffBFE0E2) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            validator:widget.validator,
            obscuringCharacter:'●',
            maxLength: widget.maxLength,
            decoration: InputDecoration(
             hintText:widget.hintText ,
              counterText: "",
              suffixIcon: widget.suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder:OutlineInputBorder(
                borderSide:BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff438E96)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );

  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// widget.data,
// style: const TextStyle(fontSize: 18),
// ),
// const SizedBox(
// height: 5,
// ),
// Container(
// padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
// decoration: BoxDecoration(
// //color:widget.color, //textfiled.hasFocus ? Colors.red : Color(0xffBFE0E2),
// borderRadius: BorderRadius.circular(12),
// ),
// child: TextField(
// keyboardType: widget.keyboardType,
// focusNode: widget.focusNode,
// controller: widget.controller,
// decoration: InputDecoration(
// hintText: widget.hintText,
// enabledBorder: OutlineInputBorder(
// borderSide: const BorderSide(color: Colors.grey),
// borderRadius: BorderRadius.circular(12),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: const BorderSide(color: Color(0xff438E96)),
// borderRadius: BorderRadius.circular(12),
// ),
// ),
// ),
// ),
// ],
// );