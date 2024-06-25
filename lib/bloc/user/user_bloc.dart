import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maha/bloc/user/user_event.dart';
import 'package:maha/bloc/user/user_state.dart';
import 'package:maha/data/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UsersLoading()) {
    on<FetchUsers>(_onFetchUsers);
    on<CreateUser>(_onCreateUser);
  }

  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UsersLoading());
    try {
      final users = await userRepository.getUsers();
      emit(UsersLoaded(users: users));
    } catch (e) {
      emit(const UserError(message: 'Failed to fetch users'));
    }
  }

  void _onCreateUser(CreateUser event, Emitter<UserState> emit) async {
    emit(UsersLoading());
    try {
      final response = await userRepository.createUser(event.name, event.job);
      final users = await userRepository.getUsers();
      emit(UserCreated(response: response));
      emit(UsersLoaded(users: users));
    } catch (e) {
      emit(const UserError(message: 'Failed to create user'));
    }
  }
}
