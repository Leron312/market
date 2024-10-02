import 'package:app_weather/features/search_city/presentation/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherSecondScreen extends StatelessWidget {
  const WeatherSecondScreen({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          weatherModel.location.localtime,
          style: const TextStyle(fontSize: 20),
        ),
        bottom: const _BottomWidget(
        ),
      ),
      body: _Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(weatherModel.location.country);
        },
        child: const Icon(Icons.abc_outlined),
      ),
    );
  }

  Container _Body() {
    return Container(
      height: 100,
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16),
    );
  }
}

class _BottomWidget extends StatelessWidget implements PreferredSizeWidget {
  const _BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 2,
      color: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 2);
}

class _DayOne extends StatelessWidget {
  const _DayOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.red,
    );

  }
}



