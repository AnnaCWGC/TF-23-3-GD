import 'package:dio/dio.dart';

import '../../../services/common/api_base/api_base.dart';

class HomeProvider extends ApiBase {
  Future<Response?> daily() async {
    return get(
        '/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=demo');
  }

  Future<Response?> intra() async {
    return get(
        '/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo');
  }
}
