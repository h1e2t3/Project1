import 'package:flutter/material.dart';

class ComnDropdwn extends StatefulWidget {
   ComnDropdwn({super.key, this.items, this.onChanged, this.validator});
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<ComnDropdwn> createState() => _ComnDropdwnState();
}

class _ComnDropdwnState extends State<ComnDropdwn> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
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
      items: widget.items,
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
