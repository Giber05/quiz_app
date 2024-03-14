import 'package:bloc/bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/usecases/register_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

@injectable
class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final RegisterUser _registerUser;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey formKey = GlobalKey();

  RegisterUserBloc(this._registerUser) : super(RegisterUserInitial()) {
    on<RegisterUserRequested>(_onRegisterUserRequested);
  }

  Future<void> _onRegisterUserRequested(RegisterUserRequested event, Emitter<RegisterUserState> emit) async {
    emit(RegisterUserLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
    final result = await _registerUser(RegisterParams(email: event.email, password: event.password));
    switch (result) {
      case Success(data: UserSessionModel data):
        emit(RegisterUserSuccess(session: data));
      case Error():
        emit(RegisterUserFailed(message: result.exception.message));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
