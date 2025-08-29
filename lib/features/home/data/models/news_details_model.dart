import 'dart:convert';

NewsDetailsModel newsDetailsModelFromJson(String str) =>
    NewsDetailsModel.fromJson(json.decode(str));

String newsDetailsModelToJson(NewsDetailsModel data) =>
    json.encode(data.toJson());

class NewsDetailsModel {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  DateTime birthday;
  dynamic deathday;
  int gender;
  dynamic homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  NewsDetailsModel({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) =>
      NewsDetailsModel(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: "https://image.tmdb.org/t/p/w500${json['profile_path']}",
      );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "also_known_as": List<dynamic>.from(alsoKnownAs.map((x) => x)),
    "biography": biography,
    "birthday":
        "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "deathday": deathday,
    "gender": gender,
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "known_for_department": knownForDepartment,
    "name": name,
    "place_of_birth": placeOfBirth,
    "popularity": popularity,
    "profile_path": profilePath,
  };
}
