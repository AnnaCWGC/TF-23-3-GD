import 'dart:convert';

IntraModel welcomeFromJson(String str) => IntraModel.fromJson(json.decode(str));

String welcomeToJson(IntraModel data) => json.encode(data.toJson());

class IntraModel {
  List<MetaData> metaData;
  List<TimeSeries5Min> timeSeries5Min; // Changed to List<TimeSeries5Min>

  IntraModel({
    required this.metaData,
    required this.timeSeries5Min,
  });

  factory IntraModel.fromJson(Map<String, dynamic> json) {
    return IntraModel(
       metaData: [MetaData.fromJson(json["Meta Data"])],
      timeSeries5Min: (json["Time Series (5min)"] as Map<String, dynamic>).entries.map((entry) {
        final dateTimeString = entry.key;
        final data = entry.value as Map<String, dynamic>;
        return TimeSeries5Min.fromJson(data, dateTimeString);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "Meta Data": metaData[0].toJson(),
    "Time Series (5min)": Map.fromEntries(timeSeries5Min.map((x) =>
        MapEntry(x.dateTimeString, x.toJson()))), // Updated to convert List to Map using Map.fromEntries
  };
}

class MetaData {
  String the1Information;
  String the2Symbol;
  DateTime the3LastRefreshed;
  String the4Interval;
  String the5OutputSize;
  String the6TimeZone;

  MetaData({
    required this.the1Information,
    required this.the2Symbol,
    required this.the3LastRefreshed,
    required this.the4Interval,
    required this.the5OutputSize,
    required this.the6TimeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    the1Information: json["1. Information"],
    the2Symbol: json["2. Symbol"],
    the3LastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
    the4Interval: json["4. Interval"],
    the5OutputSize: json["5. Output Size"],
    the6TimeZone: json["6. Time Zone"],
  );

  Map<String, dynamic> toJson() => {
    "1. Information": the1Information,
    "2. Symbol": the2Symbol,
    "3. Last Refreshed": the3LastRefreshed.toIso8601String(),
    "4. Interval": the4Interval,
    "5. Output Size": the5OutputSize,
    "6. Time Zone": the6TimeZone,
  };
}

class TimeSeries5Min {
  String the1Open;
  String the2High;
  String the3Low;
  String the4Close;
  String the5Volume;
  String dateTimeString; // Added dateTimeString property

  TimeSeries5Min({
    required this.the1Open,
    required this.the2High,
    required this.the3Low,
    required this.the4Close,
    required this.the5Volume,
    required this.dateTimeString, // Added dateTimeString property
  });

  factory TimeSeries5Min.fromJson(Map<String, dynamic> json, String dateTimeString) => TimeSeries5Min(
    the1Open: json["1. open"],
    the2High: json["2. high"],
    the3Low: json["3. low"],
    the4Close: json["4. close"],
    the5Volume: json["5. volume"],
    dateTimeString: dateTimeString, // Set the dateTimeString property
  );

  Map<String, dynamic> toJson() => {
    "1. open": the1Open,
    "2. high": the2High,
    "3. low": the3Low,
    "4. close": the4Close,
    "5. volume": the5Volume,
  };
}
