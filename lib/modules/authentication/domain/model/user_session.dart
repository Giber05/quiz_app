import 'package:equatable/equatable.dart';

class UserSession extends Equatable {
  final String token;
  const UserSession({required this.token});

  @override
  List<Object?> get props => [token];
}
