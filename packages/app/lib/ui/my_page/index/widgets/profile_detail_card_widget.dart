import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';

class ProfileDetailCardWidget extends StatelessWidget {
  const ProfileDetailCardWidget(
      {super.key, required this.children, required this.title});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.s18wBoldGrey()),
        SizedBox(height: Dimens.d10.responsive()),
        Card(
          elevation: 0.5,
          margin: EdgeInsets.symmetric(
              vertical: Dimens.d5.responsive(), horizontal: 0),
          child: Column(
            children: children.separatedWithWidget(DividerStyle.divider1Half),
          ),
        )
      ],
    );
  }
}
