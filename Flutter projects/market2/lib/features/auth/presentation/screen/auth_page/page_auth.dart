import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../service/auth.dart';

class PageAuth extends StatelessWidget {
  PageAuth({super.key});

  final User? user = Auth().currentUser;

  Future<void> singOut() async {
    await Auth().singOut();
  }

  Widget _title() {
    return const Text('Auth');
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email');
  }

  Widget _singOutButton() {
    return ElevatedButton(
      onPressed: singOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userId(),
            _singOutButton(),
          ],
        ),
      ),
    );
  }
}
