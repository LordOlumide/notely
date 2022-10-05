import 'package:flutter/material.dart';

class NotelyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;

  const NotelyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(12),
          ),
          elevation: 0,
          backgroundColor: theme.colorScheme.secondary,
        ),
        child: loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFfffbfa),
                ),
              ),
      ),
    );
  }
}
