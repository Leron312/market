import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/auth/domain/auth_interactor.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthInteractor authInteractor})
      : _authInteractor = authInteractor,
        super(const AuthState(isLoading: true)) {
    on<AuthUserSubscribed>(_onAuthUserSubscribed);
    on<AuthUserChanged>(_onAuthUserChanged);
  }

  final AuthInteractor _authInteractor;

  void _onAuthUserSubscribed(
    AuthUserSubscribed event,
    Emitter<AuthState> emit,
  ) {
    _authInteractor.observeRemoteUser().listen((user) {
      // emit(state.copyWith(user: user));
      add(AuthUserChanged(user: user));
      if (user != null) {
        _authInteractor.saveUser(user);
      }


      // if (snapshot.data?.displayName?.isEmpty ?? true) {
      //   return BlocProvider(
      //     create: (context) => AuthBloc(),
      //     child: DisplayNamePage(user: snapshot.data),
      //   );
      // }
      //   return const HomePage();
      // } else {
      //   return const LoginPage();


    });
  }

  void _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(user: event.user, isLoading: false));
  }
}
