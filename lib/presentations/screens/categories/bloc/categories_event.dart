part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoriesEvent {}

class RefreshCategories extends CategoriesEvent {}
