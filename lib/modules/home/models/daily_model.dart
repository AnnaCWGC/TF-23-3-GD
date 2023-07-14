// To parse this JSON data, do
//
//     final daily = dailyFromJson(jsonString);

import 'dart:convert';

DailyModel dailyFromJson(String str) => DailyModel.fromJson(json.decode(str));

String dailyToJson(DailyModel data) => json.encode(data.toJson());

class DailyModel {
  List<MetaData> metaData;
  List<TimeSeriesDaily> timeSeriesDaily; // Changed to List<TimeSeriesDaily>

  DailyModel({
    required this.metaData,
    required this.timeSeriesDaily,
  });

  factory DailyModel.fromJson(Map<String, dynamic> json) {
    return DailyModel(
      metaData: [MetaData.fromJson(json["Meta Data"])],
      timeSeriesDaily: (json["Time Series (Daily)"] as Map<String, dynamic>).entries.map((entry) {
        final dateString = entry.key;
        final data = entry.value as Map<String, dynamic>;
        return TimeSeriesDaily.fromJson(data, dateString);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "Meta Data": metaData[0].toJson(),
    "Time Series (Daily)": timeSeriesDaily.map((x) => x.toJson()).toList(), // Updated to convert List to List of JSON objects
  };
}


class MetaData {
  String the1Information;
  String the2Symbol;
  DateTime the3LastRefreshed;
  String the4OutputSize;
  String the5TimeZone;

  MetaData({
    required this.the1Information,
    required this.the2Symbol,
    required this.the3LastRefreshed,
    required this.the4OutputSize,
    required this.the5TimeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    the1Information: json["1. Information"],
    the2Symbol: json["2. Symbol"],
    the3LastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
    the4OutputSize: json["4. Output Size"],
    the5TimeZone: json["5. Time Zone"],
  );

  Map<String, dynamic> toJson() => {
    "1. Information": the1Information,
    "2. Symbol": the2Symbol,
    "3. Last Refreshed": "${the3LastRefreshed.year.toString().padLeft(4, '0')}-${the3LastRefreshed.month.toString().padLeft(2, '0')}-${the3LastRefreshed.day.toString().padLeft(2, '0')}",
    "4. Output Size": the4OutputSize,
    "5. Time Zone": the5TimeZone,
  };
}

class TimeSeriesDaily {
  String the1Open;
  String the2High;
  String the3Low;
  String the4Close;
  String the5AdjustedClose;
  String the6Volume;
  String the7DividendAmount;
  String the8SplitCoefficient;
  String date; // Added date property

  TimeSeriesDaily({
    required this.the1Open,
    required this.the2High,
    required this.the3Low,
    required this.the4Close,
    required this.the5AdjustedClose,
    required this.the6Volume,
    required this.the7DividendAmount,
    required this.the8SplitCoefficient,
    required this.date, // Added date property
  });

  factory TimeSeriesDaily.fromJson(Map<String, dynamic> json, String date) => TimeSeriesDaily(
    the1Open: json["1. open"],
    the2High: json["2. high"],
    the3Low: json["3. low"],
    the4Close: json["4. close"],
    the5AdjustedClose: json["5. adjusted close"],
    the6Volume: json["6. volume"],
    the7DividendAmount: json["7. dividend amount"],
    the8SplitCoefficient: json["8. split coefficient"],
    date: date, // Set the date property
  );

  Map<String, dynamic> toJson() => {
    "1. open": the1Open,
    "2. high": the2High,
    "3. low": the3Low,
    "4. close": the4Close,
    "5. adjusted close": the5AdjustedClose,
    "6. volume": the6Volume,
    "7. dividend amount": the7DividendAmount,
    "8. split coefficient": the8SplitCoefficient,
    "9. date": date,
  };
}
