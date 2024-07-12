import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/entities/user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc(this.getUser) : super(UserInitial()) {
    on<GetUserEvent>(_onGetUserEvent);
  }

  void _onGetUserEvent(GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await getUser(event.id);
      emit(UserLoaded(user: user));
    } catch (_) {
      emit(UserError());
    }
  }
}
