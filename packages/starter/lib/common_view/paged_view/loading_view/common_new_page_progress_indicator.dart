import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';

import '../../../app.dart';

class CommonNewPageProgressIndicator extends StatelessWidget {
  const CommonNewPageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimens.d8.responsive()),
        child: const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
