import 'dart:async';

import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_widget_external/widgets.dart';

import 'bloc/otp.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OtpPageState();
  }
}

class _OtpPageState extends BasePageState<OtpPage, OtpBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: OtpComponent(
        username: '1313',
        onVerify: (String code) async {
          final completer = Completer<bool>();
          bloc.add(OtpVerify(username: 'fake-user-1', code: code));
          return completer.future;
        },
        onSuccessCallback: (bool success) {
          logD('message');
        },
      ),
    );
  }
}
