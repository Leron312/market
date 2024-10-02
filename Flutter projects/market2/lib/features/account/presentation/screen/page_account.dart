import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market2/features/auth/data/presentation/screen/auth_page/page_widgets.dart';

class PageAccount extends StatelessWidget {
  const PageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: _BodyAccount(),
    );
  }
}

class _BodyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        ElevatedButton(
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
              const Text('Person'),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageWidgets(),
              ),
            );
          },
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/Group.svg',
                height: 24,
                width: 24,
              ),
            ),
            Text('Order'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/Location.svg',
                height: 24,
                width: 24,
              ),
            ),
            Text('Address'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/CCart.svg',
                height: 24,
                width: 24,
              ),
            ),
            Text('Payment'),
          ],
        )
      ],
    );
  }
}
