import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:injectable/injectable.dart';
import 'profile_index.dart';

@Injectable()
class ProfileIndexBloc extends BaseBloc<ProfileIndexEvent, ProfileIndexState> {
  ProfileIndexBloc() : super(const ProfileIndexState()) {
    on<ProfileIndexInitiated>(
      onIndexInitiated,
      transformer: log(),
    );
  }

  FutureOr<void> onIndexInitiated(
    ProfileIndexInitiated event,
    Emitter<ProfileIndexState> emit,
  ) async {
    // TODO: implement event handler
  }
}
