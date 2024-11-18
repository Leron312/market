// class AuthLocalRepositoryImpl implements AuthLocalRepository {
//
//   User? _user;
//
//   final _controller = StreamController<User?>.broadcast();
//
//   @override
//   Stream<User?> get userStream => _controller.stream;
//
//   @override
//   User? getUser() {
//     return _user;
//   }
//
//   @override
//   void saveUser(User user) {
//     _user = user;
//     _addToStream(user);
//     debugPrint('SAVE_USEr => user: $user');
//   }
//
//   void _addToStream(User? user) => _controller.sink.add(user);
//
//   @override
//   void logOut() {
//     _user = null;
//     _addToStream(null);
//   }
// }