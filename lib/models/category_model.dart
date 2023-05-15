import 'package:partner/models/case_model.dart';

class CategoryModel {
  int id;
  String name;
  List<CaseModel>? cases;

  CategoryModel({
    required this.id,
    required this.name,
    this.cases,
  });
}
