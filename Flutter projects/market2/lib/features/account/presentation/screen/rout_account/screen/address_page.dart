import 'package:flutter/material.dart';

class PageAddress extends StatelessWidget {
  const PageAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Address'),
      ),
      body: const _RecordinAnAddress(),
    );
  }
}

class _RecordinAnAddress extends StatelessWidget {
  const _RecordinAnAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ZipCode(),
        _Country(),
        _City(),
        _StreetAndNumberHome(),
        _PhoneNumber(),
        _UserName(),
        Row(
          children: [
            _ButtonSave(),
            _Remove(),
          ],
        ),
      ],
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(
            'My Sity',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8), // Space between the label and text field

          // The input field for the zip code
          const TextField(
            decoration: InputDecoration(
              hintText: 'City',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1, // Adjust the width if needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(
            'My phone number',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8), // Space between the label and text field

          // The input field for the zip code
          const TextField(
            decoration: InputDecoration(
              hintText: 'Phone number',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1, // Adjust the width if needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StreetAndNumberHome extends StatelessWidget {
  const _StreetAndNumberHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(
            'My street and number home',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8), // Space between the label and text field

          // The input field for the zip code
          const TextField(
            decoration: InputDecoration(
              hintText: 'Street and number home',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1, // Adjust the width if needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _City extends StatelessWidget {
  const _City({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(
            'My city',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8), // Space between the label and text field

          // The input field for the zip code
          const TextField(
            decoration: InputDecoration(
              hintText: 'City',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1, // Adjust the width if needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Country extends StatelessWidget {
  const _Country({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(
            'My country',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8), // Space between the label and text field

          // The input field for the zip code
          const TextField(
            decoration: InputDecoration(
              hintText: 'Country',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1, // Adjust the width if needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ZipCode extends StatelessWidget {
  const _ZipCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(
            'My country zip code',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8), // Space between the label and text field

          // The input field for the zip code
          const TextField(
            decoration: InputDecoration(
              hintText: 'Country zip code',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1, // Adjust the width if needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonSave extends StatelessWidget {
  const _ButtonSave({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'SAVE',
        style: TextStyle(backgroundColor: Colors.blue, color: Colors.white),
      ),
    );
  }
}

class _Remove extends StatelessWidget {
  const _Remove({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'REMOVE',
        style: TextStyle(backgroundColor: Colors.orange, color: Colors.white),
      ),
    );
  }
}
