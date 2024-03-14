part of 'register_user_bloc.dart';

sealed class RegisterUserEvent extends Equatable {
  const RegisterUserEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserRequested extends RegisterUserEvent {
  final String email;
  final String password;

  const RegisterUserRequested({required this.email, required this.password});
}
