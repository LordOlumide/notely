import 'package:flutter/material.dart';
import 'package:notely/rsc/utils/margins/y_margin.dart';

class NotelyFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String hint;

  const NotelyFormField({
    Key? key,
    this.controller,
    required this.label,
    required this.hint,
  }) : super(key: key);

  @override
  State<NotelyFormField> createState() => _NotelyFormFieldState();
}

final _border = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Color(0xFFf2e5d5),
    width: 1,
  ),
  borderRadius: BorderRadius.circular(12),
);

class _NotelyFormFieldState extends State<NotelyFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF403b36),
          ),
        ),
        const YMargin(8),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFfffdfa),
            hintText: widget.hint,
            enabledBorder: _border,
            errorBorder: _border,
            disabledBorder: _border,
            border: _border,
            focusedBorder: _border,
          ),
        ),
      ],
    );
  }
}
