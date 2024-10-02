part of 'profile_bloc.dart';

class ProfileState extends Equatable {

  final User? user;
  final bool isLoading;

  const ProfileState({required this.isLoading, this.user});

  ProfileState copyWith({
    User? Function()? user,
    bool? isLoading,
}) {
    return ProfileState(
      user: user != null ? user() : this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [user, isLoading];
}
