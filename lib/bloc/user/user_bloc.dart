import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_app/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // UserBloc(super.initialState);
  // es lo mismo a lo de abajo ??

  UserBloc() : super(const UserInitialState()) {
    // Eventos
    on<ActivateUserEvent>((event, emit) => emit(UserSetState(event.user)));
    on<DeleteUserEvent>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState( state.user!.copyWith(edad: event.age)));
    });


    on<AddProfessionEvent>((event, emit) {
      if (!state.existUser) return;
      final professions = [...state.user!.profesiones , event.profession];
      emit(UserSetState( state.user!.copyWith(profesiones: professions)));
    });
  }
}
