import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/validation_utils/validation_utils.dart';
import 'package:notes_app/features/auth/domain/auth_interactor.dart';

import '../../../../generated/l10n.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({
    required AuthInteractor authInteractor,
  })  : _authInteractor = authInteractor,
        super(
          const RegistrationState(
            isLoading: false,
          ),
        ) {
    on<RegistrationEmailChanged>(_onEmailCanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationRegisterButtonClicked>(_onRegisterButtonClicked);
  }

  final AuthInteractor _authInteractor;

  void _onEmailCanged(
    RegistrationEmailChanged event,
    Emitter<RegistrationState> emit,
  ) {
    debugPrint('email: ${event.email}');
    final errorText = ValidationUtils.isValidEmail(event.email) ? null : S.current.email_error_text;
    debugPrint('errorText: ${errorText}');

    emit(state.copyWith(email: event.email, emailErrorText: () => errorText));
    // emit(state.copyWith(emailErrorText: errorText));
  }

  void _onPasswordChanged(
    RegistrationPasswordChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final errorText =
        ValidationUtils.isValidPassword(event.password) ? null : S.current.password_error_text;
    emit(state.copyWith(password: event.password, passwordErrorText: () => errorText));
  }

  void _onRegisterButtonClicked(
    RegistrationRegisterButtonClicked event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final userCredential = await _authInteractor.registerUser(state.email, state.password);
    if (userCredential != null) {
      emit(state.copyWith(isLoading: false, isSuccessFullyRegistered: true));
    }
  }
}