import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_search_city.freezed.dart';
part 'flight_search_city.g.dart';

@freezed
class FlightSearchCity with _$FlightSearchCity {
  factory FlightSearchCity({
    @Default(FlightSearchCity.defaultId) String id,
    @Default(FlightSearchCity.defaultCode) String code,
    @Default(FlightSearchCity.defaultRegion) String region,
    @Default(FlightSearchCity.defaultCity) String city,
    @Default(FlightSearchCity.defaultProvince) String province,
  }) = _FlightSearchCity;

  static const defaultId = '';
  static const defaultCode = '';
  static const defaultRegion = '';
  static const defaultCity = '';
  static const defaultProvince = '';
  factory FlightSearchCity.fromJson(Map<String, dynamic> json) => _$FlightSearchCityFromJson(json);
}
