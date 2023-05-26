import 'dart:async';

import 'package:beauty_skin/data/api/product/product_api.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/data/repositories/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final _productRepo = ProductRepository();

  SearchBloc() : super(Searching()) {
    on<QueryChanged>(
      _mapQueryChangedToState,
      transformer: debounceSequential(const Duration(milliseconds: 500)),
    );
  }

  FutureOr<void> _mapQueryChangedToState(
    QueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(Searching());
    try {
      final products = await _productRepo.fetchProducts(
        ProductQueryParameters(
          page: event.page,
          search: event.search,
        ),
      );

      emit(ResultsLoaded(products));
    } catch (e) {
      debugPrint(e.toString());
      emit(SearchFailure(e.toString()));
    }
  }
}
