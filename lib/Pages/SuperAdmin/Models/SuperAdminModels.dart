import 'dart:convert';

import 'UsersSuperAdminModel.dart';

SuperAdmin superAdminFromJson(String str) => SuperAdmin.fromJson(json.decode(str));

String superAdminToJson(SuperAdmin data) => json.encode(data.toJson());

class SuperAdmin {
    List<UsersSuperAdmin> row;

    SuperAdmin({
        required this.row,
    });

    factory SuperAdmin.fromJson(Map<String, dynamic> json) => SuperAdmin(
        row: List<UsersSuperAdmin>.from(json["row"].map((x) => UsersSuperAdmin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "row": List<dynamic>.from(row.map((x) => x.toJson())),
    };
}