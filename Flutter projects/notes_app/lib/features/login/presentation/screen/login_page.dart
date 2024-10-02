import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/core_module.dart';
import '../../../../core/navigation/routes/registration_route.dart';
import '../../../../core/ui/text_field/login_text_fields.dart';
import '../../../../generated/l10n.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child:const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
      previous.isSuccessfullySignedIn != current.isSuccessfullySignedIn ||
          previous.isNotesListEmpty != current.isNotesListEmpty,
      listener: (context, state) {
        if (state.isSuccessfullySignedIn) {
          if (state.isNotesListEmpty) {
            context.pop();
          } else {
            showDialog(context: context, builder: (context) => _SaveLocalDataDialog(bloc: bloc));
            // context.pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: const _Body(),
      ),
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: _EmailField(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: _PasswordField(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SignInButton(),
                _RegisterButton(),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _GoogleIcon(),
                _AppleButton(),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return IconButton(
      onPressed: () {
        bloc.add(LoginGoogleIconClicked());
      },
      icon: SvgPicture.asset('assets/icons/Google_logo.svg'),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.go(RegistrationRoute.navigateRoute);
        },
        child: Text(S.of(context).register));
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          errorText: state.passwordErrorText,
          labelText: S.of(context).password,
          onChanged: (value) => bloc.add(LoginPasswordChanged(password: value)),
          needObscureText: true,
        );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.email != current.email || previous.emailErrorText != current.emailErrorText,
        builder: (context, state) {
          return CustomTextField(
            labelText: S.of(context).email,
            errorText: state.emailErrorText,
            onChanged: (value) => bloc.add(
              LoginEmailChanged(email: value),
            ),
          );
        });
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (prev, curr) =>
            prev.email != curr.email ||
            prev.password != curr.password ||
            prev.emailErrorText != curr.emailErrorText ||
            prev.passwordErrorText != curr.passwordErrorText,
        builder: (context, state) {
          final isEmailEmpty = state.email.isEmpty;
          final isPasswordEmpty = state.password.isEmpty;
          final hasError = state.emailErrorText != null || state.passwordErrorText != null;
          return ElevatedButton(
            onPressed: isEmailEmpty || isPasswordEmpty || hasError
                ? null
                : () {
                    bloc.add(LoginSignInButtonClicked());
                  },
            child: Text(S.of(context).sing_in),
          );
        });
  }
}

class _AppleButton extends StatelessWidget {
  const _AppleButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    if (!Platform.isIOS) return const SizedBox();
    return IconButton(
      onPressed: () async {
        bloc.add(LoginAppleIconClicked());
      },
      icon: const Icon(Icons.apple),
    );
  }
}

class _SaveLocalDataDialog extends StatelessWidget {
  const _SaveLocalDataDialog({super. key, required this.bloc});

  final LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).save_local_data_title),
      content: Text(S.of(context).save_local_data_descreption),
      actions: [
        TextButton(
          child: Text(S.of(context).button_yes),
          onPressed: () {
            context.pop();
            bloc.add(LoginSaveLocalDataYesButtonClicked());
          },
        ),
        TextButton(
          child: Text(S.of(context).button_no),
          onPressed: () {
            context.pop();
            context.pop();
          },
        ),
      ],
    );
  }
}
