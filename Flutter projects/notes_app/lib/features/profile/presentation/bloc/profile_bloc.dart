import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/features/auth/domain/auth_interactor.dart';

import '../../../note/domain/notes_interactor.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required AuthInteractor authInteractor,
    required NotesInteractor notesInteractor,
  })  : _authInteractor = authInteractor,
  _notesInteractor = notesInteractor,
        super(const ProfileState(isLoading: true)) {
    on<ProfileUserSubscribed>(_onProfileUserSubsribed);
    on<ProfileUserChanged>(_onProfileUserChanged);
    on<ProfileCurrentUserLoaded>(_onProfileCurrentUserLoaded);
    on<ProfileLogOutButtonClicked>(_onProfileLogOutButtonClicked);
  }

  final AuthInteractor _authInteractor;
  final NotesInteractor _notesInteractor;

  void _onProfileUserSubsribed(
    ProfileUserSubscribed event,
    Emitter<ProfileState> emit,
  ) {
    _authInteractor.observeLocalUser().listen(
      (user) {
        add(ProfileUserChanged(user: user));
        emit(state.copyWith(user: () => user));

        debugPrint('Profile_Bloc $user');
      },
    );
  }

  void _onProfileCurrentUserLoaded(
    ProfileCurrentUserLoaded event,
    Emitter<ProfileState> emit,
  ) {
    final user = _authInteractor.getUser();
    emit(
      state.copyWith(user: () => user, isLoading: false),
    );
  }

  void _onProfileLogOutButtonClicked(
    ProfileLogOutButtonClicked event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await _notesInteractor.deleteAllLocalNotes();
    await _authInteractor.logOut();
    emit(state.copyWith(isLoading: false));
  }

  void _onProfileUserChanged(
    ProfileUserChanged event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(user:() => event.user));
  }


}
