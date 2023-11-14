part of 'brand_model.dart';

extension ProductModelExtension on BrandModel {
  String? nameTranslate(context) {
    return Translate.of(context).isRussian ? nameRu : nameTk;
  }
}
