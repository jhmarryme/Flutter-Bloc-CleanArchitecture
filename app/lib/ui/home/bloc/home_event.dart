import 'dart:async';

import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_event.freezed.dart';

abstract class HomeEvent extends BaseBlocEvent {
  const HomeEvent();
}

@freezed
class HomePageInitiated extends HomeEvent with _$HomePageInitiated {
  const factory HomePageInitiated() = _HomePageInitiated;
}

@freezed
class HomePageRefreshed extends HomeEvent with _$HomePageRefreshed {
  const factory HomePageRefreshed({
    required Completer<void> completer,
  }) = _HomePageRefreshed;
}

@freezed
class UserLoadMore extends HomeEvent with _$UserLoadMore {
  const factory UserLoadMore() = _UserLoadMore;
}
