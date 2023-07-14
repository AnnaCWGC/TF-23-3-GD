import 'package:hcp_test/modules/home/models/daily_model.dart';
import 'package:hcp_test/modules/home/models/intra_model.dart';
import 'package:hcp_test/services/models/generic_error_model.dart';

import '../providers/home_provider.dart';

class HomeRepository {
  final HomeProvider _provider;

  HomeRepository(this._provider);

  Future<dynamic> daily() async {
    final response = await this._provider.daily();
    if (response!.statusCode != 200) {
      return GenericErrorModel.fromJson(response.data);
    } else {
      return DailyModel.fromJson(response.data);
    }
  }

  Future<dynamic> intra() async {
    final response = await this._provider.intra();
    if (response!.statusCode != 200) {
      return GenericErrorModel.fromJson(response.data);
    } else {
      return IntraModel.fromJson(response.data);
    }
  }
}
