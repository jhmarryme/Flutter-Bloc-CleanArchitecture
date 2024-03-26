import 'dart:async';

import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_widget_external/widgets.dart';

import 'bloc/otp.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.username});

  final String username;

  @override
  State<StatefulWidget> createState() {
    return _OtpPageState();
  }
}

class _OtpPageState extends BasePageState<OtpPage, OtpBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(OtpPageInitiated(username: widget.username));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: OtpComponent(
        username: widget.username,
        onVerify: (String code) {
          final completer = Completer<bool>();
          bloc.add(OtpVerify(
              username: 'fake-user-1', code: code, completer: completer));
          return completer.future;
        },
        onSuccessCallback: () => bloc.add(const OtpVerifySucceed()),
      ),
    );
  }
}
