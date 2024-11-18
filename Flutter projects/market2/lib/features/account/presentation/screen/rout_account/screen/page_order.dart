import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: const _BodyOrder(),
    );
  }
}

class _BodyOrder extends StatelessWidget {
  const _BodyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

