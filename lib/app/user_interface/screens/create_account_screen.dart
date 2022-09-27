import 'package:flutter/material.dart';
import 'package:notely/app/user_interface/widgets/notely_button.dart';
import 'package:notely/rsc/utils/margins/y_margin.dart';
import 'package:notely/app/user_interface/widgets/notely_form_field.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const YMargin(16),
              Expanded(
                child: Column(
                  children: const [
                    Center(
                      child: Text(
                        'Notely',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF403B36),
                          fontFamily: 'Titan One',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    YMargin(50),
                    Text(
                      'Create a free account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF403b36),
                      ),
                    ),
                    YMargin(5),
                    Text(
                      'Join Notely for free. Create and share unlimited '
                      'notes with your friends.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF595550),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    YMargin(30),
                    NotelyFormField(
                      label: 'Full Name',
                      hint: 'Olumide Olubosede',
                    ),
                    YMargin(21),
                    NotelyFormField(
                      label: 'Email Address',
                      hint: 'olumideolubosede@yahoo.com',
                    ),
                    YMargin(21),
                    NotelyFormField(
                      label: 'Password',
                      hint: '############',
                    ),
                    YMargin(21),
                  ],
                ),
              ),
              NotelyButton(
                text: 'Create Account',
                onPressed: () {},
              ),
              const YMargin(20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFD9614C),
                  ),
                ),
              ),
              const YMargin(25),
            ],
          ),
        ),
      ),
    );
  }
}
