import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserEvent {}

class CreateUser extends UserEvent {
  final String name;
  final String job;

  const CreateUser({required this.name, required this.job});

  @override
  List<Object> get props => [name, job];
}
