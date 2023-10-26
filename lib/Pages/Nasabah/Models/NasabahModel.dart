import 'dart:convert';

import 'UserNasabahModel.dart';

NasabahModel nasabahFromJson(String str) => NasabahModel.fromJson(json.decode(str));

String nasabahToJson(NasabahModel data) => json.encode(data.toJson());

class NasabahModel {
    List<NasbahRowModel> row;

    NasabahModel({
        required this.row,
    });

    factory NasabahModel.fromJson(Map<String, dynamic> json) => NasabahModel(
        row: List<NasbahRowModel>.from(json["row"].map((x) => NasbahRowModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "row": List<dynamic>.from(row.map((x) => x.toJson())),
    };
}