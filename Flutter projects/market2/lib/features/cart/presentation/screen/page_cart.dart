import 'package:flutter/material.dart';

class PageCart extends StatelessWidget {
  const PageCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const _CartPage(),
    );
  }
}

class _CartPage extends StatelessWidget {
  const _CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    );
  }
}

