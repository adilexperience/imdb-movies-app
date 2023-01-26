import 'dart:convert';

KeyValueModel keyValueModelFromJson(String str) =>
    KeyValueModel.fromJson(json.decode(str));

String keyValueModelToJson(KeyValueModel data) => json.encode(data.toJson());

class KeyValueModel {
  KeyValueModel({
    required this.key,
    required this.value,
  });

  final String key;
  final String value;

  factory KeyValueModel.fromJson(Map<String, dynamic> json) => KeyValueModel(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
