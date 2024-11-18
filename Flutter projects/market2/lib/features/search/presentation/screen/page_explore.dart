import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market2/features/marketApi/data/models/market_info/market_categories_dto.dart';
import 'package:market2/features/search/presentation/bloc/search_product/search_product_bloc.dart';

import '../../../api/data/api/category_api.dart';
import '../bloc/search_category/search_bloc.dart';

class PageExplore extends StatelessWidget {
  const PageExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ExploreBloc(CategoryApi())
            ..add(CategoryAllDataLoad()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SearchProductBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
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
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _SearchBorder(),
            ),
            _Search(),
            _ProductsLove(),
            _Notification(),
          ],
        ),
        Divider(),
        _SearchResult(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 122);
}

class _SearchBorder extends StatelessWidget {
  const _SearchBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products = context.select((SearchProductBloc bloc) => bloc.state.products);
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 264,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Category'),
          );
        },
      ),
    );
  }
}

class _ProductsLove extends StatelessWidget {
  const _ProductsLove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Понравившиеся товары
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        'assets/icons/love.svg',
        width: 24,
        height: 24,
        color: Colors.black54,
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      // Поиск
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.search,
        color: Colors.grey,
      ),
    );
  }
}

class _Notification extends StatelessWidget {
  const _Notification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Уведомления
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
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        final list = state.categories;
        return GridView.builder(
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            return CategoryWidget(category: list[index]);
          },
        );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final MarketCategoriesDto category;

  @override
  Widget build(BuildContext context) {
    String imageCategory = category.image ?? '';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            SizedBox(
              width: 140,
              height: 120,
              child: Image.network(
                imageCategory,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/icons/placeholder.png');
                },
              ),
            ),
            Text(
              category.name ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
