import 'package:flutter/material.dart';
import 'package:market2/features/auth/data/presentation/screen/auth_page/page_auth.dart';
import 'package:market2/features/auth/data/service/auth.dart';
import 'package:market2/features/login/presentation/screen/login_page.dart';

class PageWidgets extends StatefulWidget {
  const PageWidgets({super.key});

  @override
  State<PageWidgets> createState() => _PageWidgetsState();
}

class _PageWidgetsState extends State<PageWidgets> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageAuth();
          }else{
            return const LoginPage();
          }
        }
    );
  }
}
