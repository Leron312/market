part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final String email;
  final String password;
  final String? emailErrorText;
  final String? passwordErrorText;
  final bool isSuccessfullySignedIn;
  final bool isNotesListEmpty;

  const LoginState({
    this.isSuccessfullySignedIn = false,
    this.isNotesListEmpty = false,
    this.email = '',
    this.password = '',
    this.emailErrorText = '',
    this.passwordErrorText = '',
    required this.isLoading,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccessfullySignedIn,
    bool? isNotesListEmpty,
    String? email,
    String? password,
    String? Function()? emailErrorText,
    String? Function()? passwordErrorText,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccessfullySignedIn: isSuccessfullySignedIn ?? this.isSuccessfullySignedIn,
      isNotesListEmpty: isNotesListEmpty ?? this.isNotesListEmpty,
      email: email ?? this.email,
      emailErrorText: emailErrorText != null ? emailErrorText() : this.emailErrorText,
      passwordErrorText: passwordErrorText != null ? passwordErrorText() : this.passwordErrorText,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        email,
        isSuccessfullySignedIn,
        isNotesListEmpty,
        password,
        emailErrorText,
        passwordErrorText,
      ];
}
