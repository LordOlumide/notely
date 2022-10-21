import 'package:flutter/material.dart';
import 'package:notely/rsc/utils/margins/y_margin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/app/cubits/auth/auth_cubit.dart';
import 'package:notely/app/cubits/signup/signup_cubit.dart';
import 'package:notely/app/cubits/signup/signup_state.dart';
import 'package:notely/app/model/user.dart';
import '../widgets/notely_button.dart';
import '../widgets/notely_form_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is SignupLoaded) {
            context.read<AuthCubit>().checkAuth();
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const YMargin(16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Center(
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
                        const YMargin(50),
                        const Text(
                          'Create a free account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF403b36),
                          ),
                        ),
                        const YMargin(5),
                        const Text(
                          'Join Notely for free. Create and share unlimited '
                          'notes with your friends.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF595550),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const YMargin(30),
                        NotelyFormField(
                          controller: _fullNameController,
                          label: 'Full Name',
                          hint: 'Olumide Olubosede',
                        ),
                        const YMargin(21),
                        NotelyFormField(
                          controller: _emailController,
                          label: 'Email Address',
                          hint: 'olumideolubosede@yahoo.com',
                        ),
                        const YMargin(21),
                        NotelyFormField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: '############',
                        ),
                        const YMargin(21),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    return NotelyButton(
                      text: 'Create Account',
                      loading: state is SignupLoading,
                      onPressed: () {
                        context.read<SignupCubit>().signup(
                              User(
                                email: _emailController.text,
                                fullName: _fullNameController.text,
                                password: _passwordController.text,
                              ),
                            );
                      },
                    );
                  },
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
      ),
    );
  }
}
