// To parse this JSON data, do
//
//     final recipesResponse = recipesResponseFromJson(jsonString);

import 'dart:convert';

RecipesResponse recipesResponseFromJson(String str) =>
    RecipesResponse.fromJson(json.decode(str));

String recipesResponseToJson(RecipesResponse data) =>
    json.encode(data.toJson());

class RecipesResponse {
  RecipesResponse({
    required this.method,
    required this.status,
    required this.results,
  });

  String method;
  bool status;
  List<Result> results;

  factory RecipesResponse.fromJson(Map<String, dynamic> json) =>
      RecipesResponse(
        method: json["method"],
        status: json["status"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "status": status,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.title,
    required this.thumb,
    required this.key,
    required this.times,
    required this.serving,
    required this.difficulty,
  });

  String title;
  String thumb;
  String key;
  String times;
  String serving;
  String difficulty;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        thumb: json["thumb"],
        key: json["key"],
        times: json["times"],
        serving: json["serving"],
        difficulty: json["difficulty"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "key": key,
        "times": times,
        "serving": serving,
        "difficulty": difficulty,
      };
}
