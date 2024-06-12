import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'list_flight_search_city_use_case.freezed.dart';

@Injectable()
class ListFlightSearchCityUseCase
    extends BaseFutureUseCase<ListFlightSearchCityInput, ListFlightSearchCityOutput> {
  const ListFlightSearchCityUseCase(this._mockRepository);

  final MockRepository _mockRepository;

  @protected
  @override
  Future<ListFlightSearchCityOutput> buildUseCase(ListFlightSearchCityInput input) async {
    final result = await _mockRepository.pageFlightSearchCity(
      keyword: input.keyword,
    );

    return ListFlightSearchCityOutput(cities: result);
  }
}

@freezed
class ListFlightSearchCityInput extends BaseInput with _$ListFlightSearchCityInput {
  const factory ListFlightSearchCityInput({
    required String keyword,
  }) = _ListFlightSearchCityInput;
}

@freezed
class ListFlightSearchCityOutput extends BaseOutput with _$ListFlightSearchCityOutput {
  const ListFlightSearchCityOutput._();

  const factory ListFlightSearchCityOutput({
    List<FlightSearchCity>? cities,
  }) = _ListFlightSearchCity;
}
