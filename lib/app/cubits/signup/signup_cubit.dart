import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/user.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signup(User? userParams) async {
    emit(SignupLoading());
    try {
      final userCredentialResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userParams?.email ?? '',
        password: userParams?.password ?? '',
      );
      final userCredential = userCredentialResult.user;
      if (userCredential != null) {
        log('successfully signed up');
        final user = userParams?.copyWith(id: userCredential.uid);
        _createUser(user!);
      } else {
        emit(const SignupError('An Error occurred'));
      }
    } on FirebaseAuthException catch (error) {
      log('${error.message}');
      emit(SignupError(error.message ?? 'An error occurred'));
    } catch (error) {
      log(error.toString());
      emit(SignupError(error.toString()));
    }
  }

  Future<void> _createUser(User user) async {
    final firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('user').doc(user.id).set(user.toMap());
      emit(SignupLoaded(user: user));
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }
}
