part of 'category_model.dart';

extension CategoryModelExtension on CategoryModel {
  nameTranslate(BuildContext context) {
    return Translate.of(context).isRussian ? nameRu : nameTk;
  }
}
