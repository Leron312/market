import 'package:market/feachers/auth/data/servise/firebase_auth_service.dart';

void initAuthModule(){
  getIt.registerLasySingleton(() => FirebaseAuthService());

}