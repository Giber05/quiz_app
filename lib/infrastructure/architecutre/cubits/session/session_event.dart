import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

abstract class SessionEvent {}

class SetCurrentUserEvent extends SessionEvent {
  final UserSession? user;

  SetCurrentUserEvent(this.user);
}

class LogoutEvent extends SessionEvent {
  final UserSession? user;

  LogoutEvent(this.user);
}
