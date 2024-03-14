import 'package:equatable/equatable.dart';

class UserSessionModel extends Equatable {
  final String token;
  const UserSessionModel({required this.token});

  @override
  List<Object?> get props => [token];
}
