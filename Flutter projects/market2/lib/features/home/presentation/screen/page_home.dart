import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:market2/features/marketApi/data/models/market_info/market_products_dto.dart';

import '../../../api/data/api/home_api.dart';
import '../bloc/home_bloc.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeApi())..add(HomeAllDataLoad()),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: const _Bottom(),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Bottom extends StatelessWidget implements PreferredSizeWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    context.go('');
                  },
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 264,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('');
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/love.svg',
                  width: 24,
                  height: 24,
                  color: Colors.black54,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Notification.svg',
                      width: 24,
                      height: 24,
                      color: Colors.black54,
                    ),
                    SvgPicture.asset(
                      'assets/icons/Ellipse.svg',
                      width: 8,
                      height: 8,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 122);
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
          padding: EdgeInsets.all(6.0),
          child: _Sale(),
    );
  }
}

class _Sale extends StatelessWidget {
  const _Sale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final list = state.producs;
        return GridView.builder( //подгружает сам
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            return ProductWidget(model: list[index]);
          },
        );
      },
    );
    // );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.model,
  });

  final MarketProductsDto model;

  @override
  Widget build(BuildContext context) {
    final images = model.images ?? [];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 140,
            height: 120,
            child: ListView.builder(
                itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                  String image = images[index];
                  print(image[0]);
                  image = image.replaceAll("[", "");
                  image = image.replaceAll("]", "");
                  image = image.replaceAll("\"", "");
                  print(image);
                  if (image[0] == "\"" && image[image.length - 1] == "\"") {
                    image = image.substring(1, image.length - 1);
                  }
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Image.network(
                       image,
                     errorBuilder: (context, e, stackTrace) {
                         return Image.asset('assets/icons/placeholder.png');
                     },
                   ),
                 );
              },
          ),
          ),
          Text(
            model.title ?? '',
            maxLines: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "Price: ${model.price?.toString() ?? ''} \$",
              style:
              TextStyle(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
            ),
          ),
          Text(
            model.title ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
