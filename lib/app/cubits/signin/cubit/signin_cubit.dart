import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : 