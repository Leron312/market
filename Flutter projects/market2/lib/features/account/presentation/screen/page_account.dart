import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market2/features/account/presentation/screen/rout_account/screen/address_page.dart';
import 'package:market2/features/account/presentation/screen/rout_account/screen/page_person.dart';

import '../../../cart/presentation/screen/page_cart.dart';
// Import additional pages if needed for navigation (e.g., PageOrder, PageAddress, etc.)

class PageAccount extends StatelessWidget {
  const PageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: const _BodyAccount(),
    );
  }
}

class _BodyAccount extends StatelessWidget {
  const _BodyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Divider(),
        _Person(),
        SizedBox(height: 10),
        _Order(),
        SizedBox(height: 10),
        _Address(),
        SizedBox(height: 10),
        _Payment(),
      ],
    );
  }
}

class _Person extends StatelessWidget {
  const _Person({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/User.svg',
              height: 24,
              width: 24,
            ),
          ),
          const Text(
            'Person',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PagePerson(),
          ),
        );
      },
    );
  }
}

class _Order extends StatelessWidget {
  const _Order({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/Group.svg',
              height: 24,
              width: 24,
            ),
          ),
          const Text(
            'Order',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onPressed: () {
        // Replace PageOrder() with the actual page you want to navigate to
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PagePerson(), // Example page (use the correct one here)
          ),
        );
      },
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.black),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/Location.svg',
              height: 24,
              width: 24,
            ),
          ),
          const Text(
            'Address',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onPressed: () {
        const PageAddress();
      },
    );
  }
}

class _Payment extends StatelessWidget {
  const _Payment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/CCart.svg',
              height: 24,
              width: 24,
            ),
          ),
          const Text(
            'Payment',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onPressed: () {
        const PageCart();
      },
    );
  }
}
