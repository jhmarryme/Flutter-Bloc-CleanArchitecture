import 'package:domain/domain.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';

abstract class MockRepository {
  Future<PagingList<SimpleUser>> pageUser({
    required int page,
    required int size,
  });
}
