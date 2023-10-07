import 'dart:convert';

import 'package:banksampah_application/Pages/Admin/Models/UserAdminModel.dart';

Admin adminFromJson(String str) => Admin.fromJson(json.decode(str));

String adminToJson(Admin data) => json.encode(data.toJson());

class Admin {
    List<UserAdminModel> row;

    Admin({
        required this.row,
    });

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        row: List<UserAdminModel>.from(json["row"].map((x) => UserAdminModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "row": List<dynamic>.from(row.map((x) => x.toJson())),
    };
}