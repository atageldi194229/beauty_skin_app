part of 'product_model.dart';

extension ProductModelExtension on ProductModel {
  String nameTranslate(context) {
    return Translate.of(context).isRussian ? nameRu : nameTk;
  }

  String contentTranslate(context) {
    return Translate.of(context).isRussian ? contentRu : contentTk;
  }

  List<String> get images {
    List<String> a = [];

    if (img1 != null) a.add(img1!);
    if (img2 != null) a.add(img2!);
    if (img3 != null) a.add(img3!);
    if (img4 != null) a.add(img4!);

    return a;
  }

  DateTime get createdAtTime => DateTime.parse(createdAt);

  double get discountPrice => price - (skidka * price / 100);
}
