import 'package:partner/models/article_model.dart';
import 'package:partner/models/case_model.dart';

class CategoryModel {
  int id;
  String name;
  List<CaseModel>? cases;
  List<ArticleModel>? articles;

  CategoryModel({
    required this.id,
    required this.name,
    this.cases,
    this.articles,
  });
}
