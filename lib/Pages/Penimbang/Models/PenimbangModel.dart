import 'SampahModel.dart';
import 'UsersModel.dart';
import 'dart:convert';

Penimbang penimbangFromJson(String str) => Penimbang.fromJson(json.decode(str));

String penimbangToJson(Penimbang data) => json.encode(data.toJson());

class Penimbang {
  List<UsersModel> row;
  List<Sampah> sampah;

  Penimbang({
    required this.row,
    required this.sampah,
  });

  factory Penimbang.fromJson(Map<String, dynamic> json) => Penimbang(
        row: List<UsersModel>.from(
            json["row"].map((x) => UsersModel.fromJson(x))),
        sampah:
            List<Sampah>.from(json["sampah"].map((x) => Sampah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UsersModel": List<dynamic>.from(row.map((x) => x.toJson())),
        "sampah": List<dynamic>.from(sampah.map((x) => x.toJson())),
      };
}
