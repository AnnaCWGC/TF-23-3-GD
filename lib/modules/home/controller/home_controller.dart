import 'package:get/get.dart';
import 'package:hcp_test/modules/home/models/daily_model.dart';
import 'package:hcp_test/modules/home/models/intra_model.dart';
import 'package:hcp_test/modules/home/repositories/home_repository.dart';
import 'package:hcp_test/services/common/storage_local.dart';
import 'package:hcp_test/services/models/generic_error_model.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  /// The constructor takes a `HomeRepository` object. This would be typically provided by Dependency Injection.
  HomeController(this._homeRepository);

  /// `_dailyActive` holds an observable instance of `DailyModel` with initial metadata and timeseries data.
  final Rx<DailyModel> _dailyActive = DailyModel(
    metaData: [],
    timeSeriesDaily: [],
  ).obs;

  /// `_intraActive` holds an observable instance of `IntraModel` with initial metadata and timeseries data.
  final Rx<IntraModel> _intraActive =
      IntraModel(metaData: [], timeSeries5Min: []).obs;

  /// `_sortList` is a list of sorting options for the display of data.
  final List<String> _sortList = <String>[
    'Default',
    'High crescente',
    'High decrescente',
    'Low crescente',
    'Low decrescente'
  ];

  /// `_listaFavoritosDaily` is an observable list that holds favorite daily timeseries data.
  final RxList<TimeSeriesDaily> _listaFavoritosDaily = <TimeSeriesDaily>[].obs;

  /// `_listaFavoritos5min` is an observable list that holds favorite 5-minute interval intra timeseries data.
  final RxList<TimeSeries5Min> _listaFavoritos5min = <TimeSeries5Min>[].obs;

  /// `_selectedSort` holds the currently selected sorting method as an observable string.
  final RxString _selectedSort = ''.obs;

  /// `_visibility` is an observable boolean that controls visibility of certain elements in the UI.
  final RxBool _visibility = true.obs;

// Getter methods for variables above

  DailyModel get dailyActive => this._dailyActive.value;
  IntraModel get intraActive => this._intraActive.value;
  String get selectedSort => this._selectedSort.value;
  List<String> get sortList => this._sortList;

  RxList<TimeSeriesDaily> get listaFavoritosDaily => this._listaFavoritosDaily;
  RxList<TimeSeries5Min> get listaFavoritos5min => this._listaFavoritos5min;

  RxBool get visibility => this._visibility;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchDailyActive(false, "");
    await fetchIntraActive(false, "");
  }

  /// Fetches daily active data from the `HomeRepository` when initialising this controller.
  /// If refresh parameter is true, it will also sort the data according to the provided method.
  Future<void> fetchDailyActive(bool refresh, String? method) async {
    final data = await this._homeRepository.daily();
    if (data.runtimeType == GenericErrorModel) {
      throw Exception('An error occurred');
    } else {
      this._dailyActive.value = data;

      this._selectedSort.value = this.sortList[0];
      if (refresh) {
        sortDailyBy(method);
      }
    }
  }

  /// Sorts the daily active data by several modes depending on the method parameter.
  /// - High crescente: sorts time series data in ascending order by the2High value.
  /// - High decrescente: sorts time series data in descending order by the2High value.
  /// - Low crescente: sorts time series data in ascending order by the3Low value.
  /// - Low decrescente: sorts time series data in descending order by the3Low value.
  /// - Default: No sort operation is performed; Data is re-fetched from the repository.
  Future<void> sortDailyBy(method) async {
    switch (method) {
      case 'High crescente':
        this
            ._dailyActive
            .value
            .timeSeriesDaily
            .sort((a, b) => a.the2High.compareTo(b.the2High));
        this._selectedSort.value = this.sortList[1];
        break;
      case 'High decrescente':
        this
            ._dailyActive
            .value
            .timeSeriesDaily
            .sort((a, b) => b.the2High.compareTo(a.the2High));
        this._selectedSort.value = this.sortList[2];
        break;
      case 'Low crescente':
        this
            ._dailyActive
            .value
            .timeSeriesDaily
            .sort((a, b) => a.the3Low.compareTo(b.the3Low));
        this._selectedSort.value = this.sortList[3];
        break;
      case 'Low decrescente':
        this
            ._dailyActive
            .value
            .timeSeriesDaily
            .sort((a, b) => b.the3Low.compareTo(a.the3Low));
        this._selectedSort.value = this.sortList[4];
        break;
      default:
        final data = await this._homeRepository.daily();
        this._dailyActive.value = data;
        this._selectedSort.value = this.sortList[0];
    }
  }

  /// Fetches intra active data from the `HomeRepository` asynchronously.
  /// If refresh parameter is true, it will also sort the data according to the provided method.
  /// Returns an instance of `IntraModel`.
  Future<IntraModel> fetchIntraActive(bool refresh, String? method) async {
    final data = await this._homeRepository.intra();
    if (data.runtimeType == GenericErrorModel) {
      throw Exception('An error occurred');
    } else {
      this._intraActive.value = data;

      this._selectedSort.value = this.sortList[0];
      if (refresh) {
        sortIntraBy(method);
      }
      return data!;
    }
  }

  /// Sorts the intra active data by several modes depending on the method parameter.
  /// The list of time series with 5min intervals is sorted in different modes.
  Future<void> sortIntraBy(method) async {
    switch (method) {
      case 'High crescente':
        this
            ._intraActive
            .value
            .timeSeries5Min
            .sort((a, b) => a.the2High.compareTo(b.the2High));
        this._selectedSort.value = this.sortList[1];
        break;
      case 'High decrescente':
        this
            ._intraActive
            .value
            .timeSeries5Min
            .sort((a, b) => b.the2High.compareTo(a.the2High));
        this._selectedSort.value = this.sortList[2];
        break;
      case 'Low crescente':
        this
            ._intraActive
            .value
            .timeSeries5Min
            .sort((a, b) => a.the3Low.compareTo(b.the3Low));
        this._selectedSort.value = this.sortList[3];
        break;
      case 'Low decrescente':
        this
            ._intraActive
            .value
            .timeSeries5Min
            .sort((a, b) => b.the3Low.compareTo(a.the3Low));
        this._selectedSort.value = this.sortList[4];
        break;
      default:
        final data = await this._homeRepository.intra();
        this._intraActive.value = data;
        this._selectedSort.value = this.sortList[0];
    }
  }

  /// Determines whether the given component exists in the favorite list, based on type.
  bool checkFavorite(component, type) {
    if (type == 0) {
      return this._listaFavoritosDaily.contains(component);
    } else {
      return this._listaFavoritos5min.contains(component);
    }
  }

  /// Adds or removes a favorite item from the appropriate list based on type and whether it's already a favorite.
  Future<void> addFavorite(component, type) async {
    final bool isFavorite = await this.checkFavorite(component, type);

    if (!isFavorite) {
      if (type == 0) {
        this._listaFavoritosDaily.add(component);
      } else {
        this._listaFavoritos5min.add(component);
      }
    } else {
      if (type == 0) {
        this._listaFavoritosDaily.remove(component);
      } else {
        this._listaFavoritos5min.remove(component);
      }
    }
  }

  /// Checks visibility base on type.
  /// Visibility is false if `_visibility` is not true and the `component` is not in the favorites list.
  bool checkVisible(component, type) {
    if (type == 0 &&
        this._visibility != true &&
        !this._listaFavoritosDaily.contains(component)) {
      return false;
    } else if (type == 1 &&
        this._visibility != true &&
        !this._listaFavoritos5min.contains(component)) {
      return false;
    }
    return true;
  }

  /// Toggles the value of `_visibility`.
  void changeVisibility() {
    if (this._visibility.value) {
      this._visibility.value = false;
    } else {
      this._visibility.value = true;
    }
  }
}
