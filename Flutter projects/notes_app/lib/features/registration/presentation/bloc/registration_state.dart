part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final bool isLoading;
  final bool isSuccessFullyRegistered;
  final String email;
  final String password;
  final String? emailErrorText;
  final String? passwordErrorText;

  const RegistrationState({
    required this.isLoading,
    this.isSuccessFullyRegistered = false,
    this.email = '',
    this.password = '',
    this.emailErrorText,
    this.passwordErrorText,
  });

  RegistrationState copyWith({
    bool? isLoading,
    bool? isSuccessFullyRegistered,
    String? email,
    String? password,
    String? Function()? emailErrorText,
    String? Function()? passwordErrorText,
  }) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
      isSuccessFullyRegistered: isSuccessFullyRegistered ?? this.isSuccessFullyRegistered,
      email: email ?? this.email,
      password: password ?? this.password,
      emailErrorText: emailErrorText != null ? emailErrorText() : this.emailErrorText,
      passwordErrorText: passwordErrorText != null ? passwordErrorText() : this.passwordErrorText,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccessFullyRegistered,
        email,
        password,
        emailErrorText,
        passwordErrorText,
      ];
}
