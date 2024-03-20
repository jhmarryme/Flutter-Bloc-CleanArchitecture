import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:injectable/injectable.dart';
import 'index.dart';

@Injectable()
class IndexBloc extends BaseBloc<IndexEvent, IndexState> {
  IndexBloc() : super(const IndexState()) {
    on<IndexInitiated>(
      onIndexInitiated,
      transformer: log(),
    );
  }

  FutureOr<void> onIndexInitiated(
    IndexInitiated event,
    Emitter<IndexState> emit,
  ) async {
    // TODO: implement event handler
  }
}
