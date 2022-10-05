import 'package:equatable/equatable.dart';
import 'package:notely/app/model/user.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupLoaded extends SignupState {
  final User user;

  const SignupLoaded({required this.user});

  @override
  List<Object?> get props => [];
}

class SignupError extends SignupState {
  final String message;
  const SignupError(this.message);

  @override
  List<Object?> get props => [];
}
