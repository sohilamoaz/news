
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news/features/news_daily/data/datasource/local/dao/article_dao.dart';
import 'package:news/features/news_daily/data/models/article_model.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDataBase extends FloorDatabase{
ArticleDao get articleDAO;
 

}