// To parse this JSON data, do
//
//     final dashBoardDataModel = dashBoardDataModelFromJson(jsonString);

import 'dart:convert';

List<CustomerDataModel> dashBoardDataModelFromJson(String str) =>
    List<CustomerDataModel>.from(
        json.decode(str).map((x) => CustomerDataModel.fromJson(x)));

String dashBoardDataModelToJson(List<CustomerDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerDataModel {
  int? id;
  String? bname;
  String? oname;
  DateTime? updatedAt;

  CustomerDataModel({
    this.id,
    this.bname,
    this.oname,
    this.updatedAt,
  });

  CustomerDataModel copyWith({
    int? id,
    String? bname,
    String? oname,
    DateTime? updatedAt,
  }) =>
      CustomerDataModel(
        id: id ?? this.id,
        bname: bname ?? this.bname,
        oname: oname ?? this.oname,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CustomerDataModel.fromJson(Map<String, dynamic> json) =>
      CustomerDataModel(
        id: json["id"],
        bname: json["bname"],
        oname: json["oname"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bname": bname,
        "oname": oname,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
