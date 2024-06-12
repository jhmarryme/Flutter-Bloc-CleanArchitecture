import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_flight_search_city_data.freezed.dart';
part 'api_flight_search_city_data.g.dart';

@freezed
class ApiFlightSearchCityData with _$ApiFlightSearchCityData {
  const ApiFlightSearchCityData._();

  const factory ApiFlightSearchCityData({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'province') String? province,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'region') String? region,
  }) = _ApiFlightSearchCityData;

  factory ApiFlightSearchCityData.fromJson(Map<String, dynamic> json) =>
      _$ApiFlightSearchCityDataFromJson(json);
}
