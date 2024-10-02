import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/features/auth/domain/auth_interactor.dart';
import 'package:notes_app/features/note/domain/notes_interactor.dart';

import '../../../../core/utils/validation_utils/validation_utils.dart';
import '../../../../generated/l10n.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthInteractor authInteractor,
    required NotesInteractor notesInteractor,
  })  : _authInteractor = authInteractor,
        _notesInteractor = notesInteractor,
        super(const LoginState(isLoading: false)) {
    on<LoginGoogleIconClicked>(_onLoginGoogleIconClicked);
    on<LoginAppleIconClicked>(_onLoginAppleIconClicked);
    on<LoginEmailChanged>(_onEmailCanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSignInButtonClicked>(_onSingInButtonClicked);
    on<LoginSaveLocalDataYesButtonClicked>(_onSavaLocalDataYesButtonClicked);
  }

  final AuthInteractor _authInteractor;
  final NotesInteractor _notesInteractor;

  void _onLoginGoogleIconClicked(
    LoginGoogleIconClicked event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final credential = await _authInteractor.getGoogleCredential();
      final userCredential = await _authInteractor.signInWithCredential(credential);
      final notes = await _notesInteractor.getNotes();
      emit(state.copyWith(isSuccessfullySignedIn: true, isNotesListEmpty: notes.isEmpty));
      debugPrint('userCredential: ${userCredential.user?.email}');
    } catch (e) {
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onLoginAppleIconClicked(
    LoginAppleIconClicked event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final credential = await _authInteractor.getAppleCredential();
      final userCredential = await _authInteractor.signInWithCredential(credential);
      emit(state.copyWith(isSuccessfullySignedIn: true));
      debugPrint('userCredential: ${userCredential.user?.email}');
    } catch (e) {
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onEmailCanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final errorText = ValidationUtils.isValidEmail(event.email) ? null : S.current.email_error_text;
    emit(state.copyWith(email: event.email, emailErrorText: () => errorText));
    // emit(state.copyWith(emailErrorText: errorText));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final errorText =
        ValidationUtils.isValidPassword(event.password) ? null : S.current.password_error_text;
    emit(state.copyWith(password: event.password, passwordErrorText: () => errorText));
  }

  void _onSingInButtonClicked(
    LoginSignInButtonClicked event,
    Emitter<LoginState> emit,
  ) async {
    print('onSignInClicked => ${state.email}, password: ${state.password}');
    emit(state.copyWith(isLoading: true));
    final userCredential =
        await _authInteractor.signInWith(email: state.email, password: state.password);
    if (userCredential != null) {
      emit(state.copyWith(isLoading: false, isSuccessfullySignedIn: true));
    }
    print('USER CREDENTIAL =>>>> $userCredential');
  }

  void _onSavaLocalDataYesButtonClicked(
    LoginSaveLocalDataYesButtonClicked event,
    Emitter<LoginState> emit,
  ) async {
    print('onSignInClicked => ${state.email}, password: ${state.password}');
    emit(state.copyWith(isLoading: true, isSuccessfullySignedIn: false));
    await _notesInteractor.saveLocalNotesToRemote();
    await _authInteractor.signInWith(email: state.email, password: state.password);
    emit(state.copyWith(isLoading: false, isSuccessfullySignedIn: true, isNotesListEmpty: true));

  }
}
