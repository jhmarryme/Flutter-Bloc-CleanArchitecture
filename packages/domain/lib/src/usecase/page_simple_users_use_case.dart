import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';


@Injectable()
class PageSimpleUsersUseCase
    extends BasePagingUseCase<PagingInput, SimpleUser> {
  PageSimpleUsersUseCase(this._mockRepository) : super();

  final MockRepository _mockRepository;

  @protected
  @override
  Future<PagingList<SimpleUser>> buildUseCase(PagingInput input) {
    final keyword = input.keyword;
    return _mockRepository.pageUser(
      page: input.current,
      size: PagingConstants.itemsPerPage,
    );
  }
}
