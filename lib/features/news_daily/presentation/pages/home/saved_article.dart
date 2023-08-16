import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news/features/injection_contanier.dart';
import 'package:news/features/news_daily/domain/entities/article.dart';
import 'package:news/features/news_daily/presentation/bloc/local/local_article_bloc.dart';
import 'package:news/features/news_daily/presentation/bloc/local/local_article_event_bloc.dart';
import 'package:news/features/news_daily/presentation/bloc/local/local_article_state.dart';

import '../../widgets/article_title.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(const GetSavedArticle()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    backgroundColor: Color(0xffC70039),
    leading: Builder(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onBackButtonTapped(context),
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    ),
    title: const Text('Saved Articles', style: TextStyle(color: Colors.white)),
  );
}

Widget _buildBody() {
  return BlocBuilder<LocalArticleBloc, LocalArticleState>(
    builder: (context, state) {
      if (state is LocalArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (state is LocalArticleDone) {
        return _buildArticlesList(state.article!);
      }
      return Container();
    },
  );
}

Widget _buildArticlesList(List<ArticleEntity> article) {
  if (article.isEmpty) {
    return const Center(
        child: Text(
      'NO SAVED ARTICLES',
      style: TextStyle(color: Colors.black),
    ));
  }
  return ListView.builder(
    itemCount: article.length,
    itemBuilder: (context, index) {
      return ArticleWidget(
        article: article[index],
        isRemovable: true,
        onRemove: (article) => _onRemoveArticle(context, article),
        onArticlePressed: (article) => _onArticlePressed(context, article),
      );
    },
  );
}

void _onBackButtonTapped(BuildContext context) {
  Navigator.pop(context);
}

void _onRemoveArticle(BuildContext context, ArticleEntity article) {
  BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticle(article));
}

void _onArticlePressed(BuildContext context, ArticleEntity article) {
  Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
}
