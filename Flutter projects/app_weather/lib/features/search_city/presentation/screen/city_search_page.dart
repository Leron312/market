import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/di/main_module.dart';
import '../../../weather_details/weather_details/pressentation/screen/weather_second_screen.dart';
import '../bloc/city_search_bloc.dart';

class CitySearchPage extends StatelessWidget {
  const CitySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CitySearchBloc(getIt(), getIt()),
      child: const Scaffold(
        body: _Body(),
        floatingActionButton: _SearchButtonRow(),
      ),
    );
  }
}

class _SearchButtonRow extends StatelessWidget {
  const _SearchButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CitySearchBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: BlocBuilder<CitySearchBloc, CitySearchState>(
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: () async {
                  final data = state.model;
                  if (data == null) return;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      (WeatherSecondScreen(weatherModel: data)),
                    ),
                  ).then((value) => {
                    if(value is String) {
                      debugPrint(value)
                    }
                  });

                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      (WeatherSecondScreen(weatherModel: data)),
                    ),
                  );
                  if(result is String){
                    debugPrint(result);
                  }
                },
                child: const Icon(Icons.transit_enterexit_outlined),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: FloatingActionButton(
            heroTag: 'Search',
            onPressed: () => bloc.add(CitySearchDataFetched()),
            child: const Icon(Icons.search_rounded),
          ),
        ),
      ],
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CitySearchBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: bloc.searchController,
        decoration: const InputDecoration(
          labelText: 'Search',
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitySearchBloc, CitySearchState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/page/home_screen.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 96),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: _SearchTextField(),
                  ),
                  SizedBox(height: 80),
                  Expanded(
                    child: ListView(
                      children: [
                        _HumidityWidget(),
                        _CloudyWidget(),
                        _PressureWidget(),
                        _Feelslike(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HumidityWidget extends StatelessWidget {
  const _HumidityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitySearchBloc, CitySearchState>(
        builder: (context, state) {
          String text;
          if (state.model != null) {
            text = 'Влажность ${state.model?.current?.humidity.toString()} %';
          } else {
            text = 'N/A';
          }
          return WeatherWidget(
            text: text,
            picture: 'assets/img/outlineic_drop.svg',
          );
        });
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.text, required this.picture});

  final String text;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.3),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SvgPicture.asset(picture),
        ],
      ),
    );
  }
}

class _PressureWidget extends StatelessWidget {
  const _PressureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitySearchBloc, CitySearchState>(
        builder: (context, state) {
          String text;
          if (state.model != null) {
            text =
            'Давление ${state.model?.current?.pressureMd
                .toString()} мм рт. ст.';
          } else {
            text = 'N/A';
          }
          return WeatherWidget(
            text: text,
            picture: 'assets/img/temper.svg',
          );
        });
  }
}

class _CloudyWidget extends StatelessWidget {
  const _CloudyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitySearchBloc, CitySearchState>(
        builder: (context, state) {
          String text;
          if (state.model != null) {
            text = 'Температура ${state.model?.current?.tempC.toString()}°C';
          } else {
            text = 'N/A';
          }
          return WeatherWidget(
            text: text,
            picture: 'assets/img/outlinecloudy.svg',
          );
        });
  }
}

class _Feelslike extends StatelessWidget {
  const _Feelslike({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitySearchBloc, CitySearchState>(
        builder: (context, state) {
          String text;
          if (state.model != null) {
            text =
            'Ощущается как ${state.model?.current?.feelslikeC.toString()}°C';
          } else {
            text = 'N/A';
          }
          return WeatherWidget(
            text: text,
            picture: 'assets/img/outlinecloudy.svg',
          );
        });
  }
}
