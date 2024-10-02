part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String? emailErrorText;
  final String? passwordErrorText;

  const LoginState({
    this.email = '',
    this.password = '',
    this.emailErrorText = '',
    this.passwordErrorText = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? Function()? emailErrorText,
    String? Function()? passwordErrorText,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailErrorText: emailErrorText != null ? emailErrorText() : this.emailErrorText,
      passwordErrorText: passwordErrorText != null ? passwordErrorText() : this.passwordErrorText,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    email,
    password,
    emailErrorText,
    passwordErrorText,
  ];
}
