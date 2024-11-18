import 'package:flutter/material.dart';

class PagePerson extends StatelessWidget {
  const PagePerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: _User(),
    );
  }
}

class _User extends StatelessWidget {
  const _User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

