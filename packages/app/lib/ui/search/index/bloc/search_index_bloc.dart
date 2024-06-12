import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:flutter_clearmind_widget_external/widgets.dart';
import 'package:injectable/injectable.dart';

import 'search_index.dart';

@Injectable()
class SearchIndexBloc extends BaseBloc<SearchIndexEvent, SearchIndexState> {
  SearchIndexBloc(
    this._listFlightSearchCityUseCase,
  ) : super(const SearchIndexState()) {
    on<SearchIndexPageInitiated>(
      _onSearchPageInitiated,
      transformer: log(),
    );
    on<SearchButtonPressed>(
      _onSearchButtonPressed,
      transformer: log(),
    );
    on<SearchCityTrigger>(
      _onSearchCityTrigger,
      transformer: log(),
    );
  }

  final ListFlightSearchCityUseCase _listFlightSearchCityUseCase;

  FutureOr<void> _onSearchPageInitiated(
    SearchIndexPageInitiated event,
    Emitter<SearchIndexState> emit,
  ) {}

  FutureOr<void> _onSearchButtonPressed(
    SearchButtonPressed event,
    Emitter<SearchIndexState> emit,
  ) async {

  }

  FutureOr<void> _onSearchCityTrigger(
    SearchCityTrigger event,
    Emitter<SearchIndexState> emit,
  ) async {
    await runAsyncCatching(
      action: () async {
        final output = await _listFlightSearchCityUseCase.execute(
          ListFlightSearchCityInput(keyword: ''),
        );
        if (!event.completer.isCompleted) {
          event.completer.complete(output.cities);
        }
      },
    );
  }
}
