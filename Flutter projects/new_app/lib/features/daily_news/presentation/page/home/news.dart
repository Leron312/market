import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:new_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:new_app/features/daily_news/presentation/widget/article_title.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _BuildAppBar(),
      body: _BuldAppbar(),
    );
  }
}

_BuildAppBar() {
  return AppBar(
    title: const Text('Daily News',
      style: TextStyle(
        color: Colors.black,
      ),),
  );
}

_BuldAppbar() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState> (
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticaleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticaleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      }
  );
}