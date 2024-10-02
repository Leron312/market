import 'package:notes_app/core/navigation/routes/profile_list_route.dart';

import 'login_route.dart';

class RegistrationRoute {
  static const String name = 'registration';

  static String get navigateRoute => '${ProfileListRoute.name}/${LoginRoute.name}/$name';
}