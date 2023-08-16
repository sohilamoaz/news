import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news_daily/domain/entities/article.dart';
import 'package:news/features/news_daily/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news/features/news_daily/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news/features/news_daily/presentation/pages/home/saved_article.dart';
import 'package:news/features/news_daily/presentation/widgets/article_title.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffC70039),
      title: const Text(
        'News',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: IconButton(
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () {
              _onShowSavedArticles(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SavedArticles()));
            },

            //Icons.bookmark, color: Colors.black
          ),
        )
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticlesError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
                onArticlePressed: (article) =>
                    _onArticlePressed(context, article),
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticles(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
