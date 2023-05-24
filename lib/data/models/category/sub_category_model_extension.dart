part of 'sub_category_model.dart';

extension SubCategoryModelExtension on SubCategoryModel {
  nameTranslate(BuildContext context) {
    return Translate.of(context).isRussian ? nameRu : nameTk;
  }
}
