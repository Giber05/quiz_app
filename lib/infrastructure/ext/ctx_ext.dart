import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/blocs/session/session_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/blocs/session/session_bloc.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

extension CtxExt on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
  UserSession get userSession => read<SessionBloc>().state.session!;
  void logout() => read<SessionBloc>().add(LogoutEvent(userSession));
}
