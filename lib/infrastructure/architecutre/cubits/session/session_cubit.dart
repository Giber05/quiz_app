import 'package:bloc/bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/cubits/session/session_event.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/usecases/logout.dart';

part 'session_state.dart';

@lazySingleton
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final Logout _logout;

  SessionBloc(this._logout) : super(const SessionIdle(null)) {
    on<SetCurrentUserEvent>(_setCurrentUser);
    on<LogoutEvent>(_logoutUser);
  }

  void _setCurrentUser(SetCurrentUserEvent event, Emitter<SessionState> emit) {
    emit(SessionIdle(event.user));
  }

  void _logoutUser(LogoutEvent event, Emitter<SessionState> emit) async {
    print("Logout");
    await _logout();
    emit(SessionLogout(event.user));
  }
}

