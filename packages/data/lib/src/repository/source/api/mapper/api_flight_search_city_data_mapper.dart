import 'package:data/src/repository/source/api/model/api_flight_search_city_data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiFlightSearchCityDataMapper
    extends BaseDataMapper<ApiFlightSearchCityData, FlightSearchCity> {
  ApiFlightSearchCityDataMapper();

  @override
  FlightSearchCity mapToEntity(ApiFlightSearchCityData? data) {
    return FlightSearchCity(
      id: data?.id ?? FlightSearchCity.defaultId,
      code: data?.code ?? FlightSearchCity.defaultCode,
      region: data?.region ?? FlightSearchCity.defaultRegion,
      city: data?.city ?? FlightSearchCity.defaultCity,
      province: data?.province ?? FlightSearchCity.defaultProvince,
    );
  }
}
