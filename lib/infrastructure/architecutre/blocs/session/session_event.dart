import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

sealed class SessionEvent {}

class SetCurrentUserEvent extends SessionEvent {
  final UserSessionModel? user;

  SetCurrentUserEvent(this.user);
}

class LogoutEvent extends SessionEvent {
  final UserSessionModel? user;

  LogoutEvent(this.user);
}
