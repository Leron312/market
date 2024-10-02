import 'package:notes_app/core/di/core_module.dart';
import 'package:notes_app/features/auth/di/auth_module.dart';
import 'package:notes_app/features/home/di/home_module.dart';
import 'package:notes_app/features/login/di/login_module.dart';
import 'package:notes_app/features/note/di/notes_module.dart';
import 'package:notes_app/features/notes_list/di/notes_list_module.dart';
import 'package:notes_app/features/registration/di/registration_module.dart';
import 'package:notes_app/features/reminder/di/reminders_module.dart';

import '../../features/profile/di/profile_module.dart';
import '../../features/reminder_details/di/reminder_details_module.dart';

void initDependencyInjection() {

  initCoreModule();
  initAuthModule();
  initHomeModule();
  initNotesListModule();
  initNotesModule();
  initLoginModule();
  initProfileModule();
  initRegistrationModule();
  initRemindersModule();
  initReminderDetailsModule();

}