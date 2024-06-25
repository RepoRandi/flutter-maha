import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<User> users;

  const UsersLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UserCreated extends UserState {
  final Map<String, dynamic> response;

  const UserCreated({required this.response});

  @override
  List<Object> get props => [response];
}

class UserError extends UserState {
  final String message;

  const UserError({required this.message});

  @override
  List<Object> get props => [message];
}
