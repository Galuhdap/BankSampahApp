import 'dart:convert';

import 'RowSampahModel.dart';

SetorSampahModel setorSampahModelFromJson(String str) => SetorSampahModel.fromJson(json.decode(str));

 //String setorSampahModelToJson(SetorSampahModel data) => json.encode(data.toJson());

class SetorSampahModel {
    List<RowSampahModel> row;

    SetorSampahModel({
        required this.row,
    });

    factory SetorSampahModel.fromJson(Map<String, dynamic> json) => SetorSampahModel(
        row: List<RowSampahModel>.from(json["row"].map((x) => RowSampahModel.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "row": List<dynamic>.from(row.map((x) => x.toJson())),
    // };
}