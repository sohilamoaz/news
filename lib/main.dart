import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/injection_contanier.dart';
import 'package:news/features/news_daily/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news/features/news_daily/presentation/pages/home/daily_news.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_theme.dart';
import 'features/news_daily/presentation/bloc/article/remote/remote_article_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily News',
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews(),
      ),
    );
  }
}
