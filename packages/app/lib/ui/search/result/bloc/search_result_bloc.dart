// import 'dart:async';
//
// import 'package:domain/domain.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_clearmind_archetype_app/app.dart';
// import 'package:flutter_clearmind_archetype_domain/domain.dart';
// import 'package:flutter_clearmind_archetype_shared/shared.dart';
// import 'package:flutter_clearmind_widget_external/widgets.dart';
// import 'package:injectable/injectable.dart';
//
// import 'search_result.dart';
//
// @Injectable()
// class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
//   SearchBloc(
//     this._pageSimpleUsersUseCase,
//   ) : super(const SearchState()) {
//     on<SearchPageInitiated>(
//       _onSearchPageInitiated,
//       transformer: log(),
//     );
//     on<SearchButtonPressed>(
//       _onSearchButtonPressed,
//       transformer: log(),
//     );
//   }
//   final PageSimpleUsersUseCase _pageSimpleUsersUseCase;
//
//   FutureOr<void> _onSearchPageInitiated(
//     SearchPageInitiated event,
//     Emitter<SearchState> emit,
//   ) {}
//
//   FutureOr<void> _onSearchButtonPressed(
//     SearchButtonPressed event,
//     Emitter<SearchState> emit,
//   ) async {
//     await runAsyncCatching(
//       action: () async {
//         final output = await _pageSimpleUsersUseCase.execute(
//           PagingInput(current: event.page, size: 30),
//           false,
//         );
//         PagingDataEntity<SimpleUser> pagingDataEntity = PagingDataEntity(
//           output.current,
//           output.size,
//           output.total,
//           output.maxLimit,
//           output.records,
//         );
//         if (!event.completer.isCompleted) {
//           event.completer.complete(pagingDataEntity);
//         }
//       },
//     );
//   }
// }
