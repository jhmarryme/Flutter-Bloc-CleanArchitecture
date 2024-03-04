
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';

import '../../app.dart';
import 'bloc/item_detail.dart';


class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({
    required this.user,
    required this.userId,
    required this.email,
    super.key,
  });

  final User user;
  final String userId;
  final String email;

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailPageState();
  }
}

class _ItemDetailPageState extends BasePageState<ItemDetailPage, ItemDetailBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.user.toString(),
          style: AppTextStyles.s14w400Primary(),
        ),
      ),
    );
  }
}
