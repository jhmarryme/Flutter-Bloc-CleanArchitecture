import 'package:data/data.dart';
import 'package:data/src/repository/source/api/clearmind_api_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter_clearmind_archetype_domain/src/entity/base/paging_list.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MockRepository)
class MockRepositoryImpl implements MockRepository {
  MockRepositoryImpl(this._clearmindApiService, this._simpleUserDataMapper, this._flightSearchCityDataMapper);

  final ClearmindApiService _clearmindApiService;

  final ApiSimpleUserDataMapper _simpleUserDataMapper;

  final ApiFlightSearchCityDataMapper _flightSearchCityDataMapper;

  @override
  Future<PagingList<SimpleUser>> pageUser({
    required int page,
    required int size,
  }) async {
    final response = await _clearmindApiService.pageUser(
      page: page,
      size: size,
    );
    final data = response?.data;
    return PagingList(
      records: _simpleUserDataMapper.mapToListEntity(data?.records),
      size: data?.size,
      total: data?.total,
      current: data?.current,
      maxLimit: data?.maxLimit,
    );
  }

  @override
  Future<List<FlightSearchCity>> pageFlightSearchCity({
    required String keyword
  }) async {
    final response = await _clearmindApiService.pageFlightSearchCity(
      keyword: keyword,
    );
    return _flightSearchCityDataMapper.mapToListEntity(response?.data);
  }
}
