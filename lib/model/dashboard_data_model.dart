// To parse this JSON data, do
//
//     final customerDataModel = customerDataModelFromJson(jsonString);

import 'dart:convert';

List<CustomerDataModel> custumerDataModelFromJson(String str) =>
    List<CustomerDataModel>.from(
        json.decode(str).map((x) => CustomerDataModel.fromJson(x)));

String customerDataModelToJson(List<CustomerDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerDataModel {
  int? id;
  String? bname;
  String? oname;
  String? bphone;
  String? ophone;
  String? blocation;
  String? bemail;
  String? oemail;
  String? jobStatus;
  String? annualSub;
  String? setupFee;
  String? renewalDate;
  String? renewalMonth;
  String? joinDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  CustomerDataModel({
    this.id,
    this.bname,
    this.oname,
    this.bphone,
    this.ophone,
    this.blocation,
    this.bemail,
    this.oemail,
    this.jobStatus,
    this.annualSub,
    this.setupFee,
    this.renewalDate,
    this.renewalMonth,
    this.joinDate,
    this.createdAt,
    this.updatedAt,
  });

  CustomerDataModel copyWith({
    int? id,
    String? bname,
    String? oname,
    String? bphone,
    String? ophone,
    String? blocation,
    String? bemail,
    String? oemail,
    String? jobStatus,
    String? annualSub,
    String? setupFee,
    String? renewalDate,
    String? renewalMonth,
    String? joinDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CustomerDataModel(
        id: id ?? this.id,
        bname: bname ?? this.bname,
        oname: oname ?? this.oname,
        bphone: bphone ?? this.bphone,
        ophone: ophone ?? this.ophone,
        blocation: blocation ?? this.blocation,
        bemail: bemail ?? this.bemail,
        oemail: oemail ?? this.oemail,
        jobStatus: jobStatus ?? this.jobStatus,
        annualSub: annualSub ?? this.annualSub,
        setupFee: setupFee ?? this.setupFee,
        renewalDate: renewalDate ?? this.renewalDate,
        renewalMonth: renewalMonth ?? this.renewalMonth,
        joinDate: joinDate ?? this.joinDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CustomerDataModel.fromJson(Map<String, dynamic> json) =>
      CustomerDataModel(
        id: json["id"],
        bname: json["bname"],
        oname: json["oname"],
        bphone: json["bphone"],
        ophone: json["ophone"],
        blocation: json["blocation"],
        bemail: json["bemail"],
        oemail: json["oemail"],
        jobStatus: json["job_status"],
        annualSub: json["annual_sub"],
        setupFee: json["setup_fee"],
        renewalDate: json["renewal_date"],
        renewalMonth: json["renewal_month"],
        joinDate: json["join_date"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bname": bname,
        "oname": oname,
        "bphone": bphone,
        "ophone": ophone,
        "blocation": blocation,
        "bemail": bemail,
        "oemail": oemail,
        "job_status": jobStatus,
        "annual_sub": annualSub,
        "setup_fee": setupFee,
        "renewal_date": renewalDate,
        "renewal_month": renewalMonth,
        "join_date": joinDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
