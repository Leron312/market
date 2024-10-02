import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/navigation/routes/profile_list_route.dart';
import 'package:notes_app/core/ui/text_field/login_text_fields.dart';
import 'package:notes_app/features/registration/presentation/bloc/registration_bloc.dart';

import '../../../../core/di/core_module.dart';
import '../../../../generated/l10n.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  void popUntilPath(BuildContext context, String routerPath){
    final router = GoRouter.of(context);
    String currentRoute = router.routerDelegate.currentConfiguration.matches.last.matchedLocation;
    while (currentRoute != routerPath){
      if(!context.canPop()){
        return;
      }
      context.pop();
      currentRoute = router.routerDelegate.currentConfiguration.fullPath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegistrationBloc>(),
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listenWhen: (previous, current) =>
            previous.isSuccessFullyRegistered != current.isSuccessFullyRegistered,
        listener: (context, state) {
          if (state.isSuccessFullyRegistered) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(S.of(context).successfully_registered),
                actions: [
                  TextButton(
                    onPressed: () {
                      popUntilPath(context, ProfileListRoute.name);
                      // Navigator.of(context).popUntil(
                      //   (route) => route.settings.name == ProfileListRoute.name,
                      // );
                    },
                    child: Text(S.of(context).ok),
                  )
                ],
              ),
            );
          }
          // if(state.needPop) {
          //   context.pop();
          // }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('REGISTRATION'),
          ),
          body: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    context.read<RegistrationBloc>();
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _EmailField(),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: _PasswordField(),
            ),
            SizedBox(height: 100),
            _RegisterButton(),
          ],
        );
      },
    );
  }
}

// class _PasswordField extends StatelessWidget {
//   const _PasswordField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<RegistrationBloc>();
//
//     return BlocBuilder<RegistrationBloc, RegistrationState>(
//       buildWhen: (previous, current) => previous.password != current.password,
//       builder: (context, state) {
//         return TextFormField(
//           validator: (value) {
//             if (value == null) return null;
//             return value.length < 8 ? S.of(context).password_error_text : null;
//           },
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           decoration: InputDecoration(
//             labelText: S.of(context).password,
//             border: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey),
//             ),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey),
//             ),
//             labelStyle: TextStyle(color: Colors.grey),
//             focusColor: Colors.grey,
//           ),
//           obscureText: true,
//           onChanged: (value) => bloc.add(RegistrationPasswordChanged(password: value)),
//         );
//       },
//     );
//   }
// }
class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegistrationBloc>();

    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
            errorText: state.passwordErrorText,
            labelText: S.of(context).password,
          onChanged: (value) => bloc.add(RegistrationPasswordChanged(password: value)),
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
    final bloc = context.read<RegistrationBloc>();

    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.email != current.email || previous.emailErrorText != current.emailErrorText,
      builder: (context, state) {
        return CustomTextField(labelText: S.of(context).email,
        errorText: state.emailErrorText,
          onChanged: (value) => bloc.add(RegistrationEmailChanged(email: value)),
        );
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: (value) => value.isValidEmail() ? null : "Check your email",
          // controller: TextEditingController(text: state.password),
          // decoration: InputDecoration(labelText: S.of(context).password),

      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegistrationBloc>();

    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (prev, curr) =>
          prev.email != curr.email ||
          prev.password != curr.password ||
          prev.emailErrorText != curr.emailErrorText ||
          prev.passwordErrorText != curr.passwordErrorText,
      builder: (context, state) {
        final isEmailEmpty = state.email.isEmpty;
        final isPasswordEmpty = state.password.isEmpty;
        final hasError = state.emailErrorText != null || state.passwordErrorText != null;
        return TextButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.yellowAccent),
            ),
            onPressed: isEmailEmpty || isPasswordEmpty || hasError
                ? null
                : () {
                    bloc.add(const RegistrationRegisterButtonClicked());
                  },
            child: Text(S.of(context).register));
      },
    );
  }
}
