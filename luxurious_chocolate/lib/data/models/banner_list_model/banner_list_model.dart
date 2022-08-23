// To parse this JSON data, do
//
//     final bannerListModel = bannerListModelFromJson(jsonString);

import 'dart:convert';

BannerListModel bannerListModelFromJson(String str) =>
    BannerListModel.fromJson(json.decode(str));

String bannerListModelToJson(BannerListModel data) =>
    json.encode(data.toJson());

class BannerListModel {
  BannerListModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      BannerListModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data:
            List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? ""))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.bannerId,
    required this.title,
    this.sortOrder,
    this.url,
    this.bannerGroupId,
    this.containerName,
    required this.viewPageCount,
    this.bannerGroupBannerGroupId,
    required this.link,
    required this.image,
    required this.imagePath,
    required this.content,
    required this.position,
    required this.isActive,
    required this.createdDate,
    this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
  });

  int bannerId;
  String title;
  dynamic sortOrder;
  dynamic url;
  dynamic bannerGroupId;
  dynamic containerName;
  int viewPageCount;
  dynamic bannerGroupBannerGroupId;
  String link;
  String image;
  String imagePath;
  String content;
  int position;
  int isActive;
  DateTime createdDate;
  dynamic modifiedDate;
  int createdBy;
  dynamic modifiedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bannerId: json["banner_id"] ?? 0,
        title: json["title"] ?? "",
        sortOrder: json["sort_order"] ?? "",
        url: json["url"] ?? "",
        bannerGroupId: json["banner_group_id"] ?? "",
        containerName: json["container_name"] ?? "",
        viewPageCount: json["view_page_count"] ?? 0,
        bannerGroupBannerGroupId: json["banner_group_banner_group_id"] ?? "",
        link: json["link"] ?? "",
        image: json["image"] ?? "",
        imagePath: json["image_path"] ?? "",
        content: json["content"] ?? "",
        position: json["position"] ?? 0,
        isActive: json["is_active"] ?? 0,
        createdDate: DateTime.parse(json["created_date"] ?? ""),
        modifiedDate: json["modified_date"] ?? "",
        createdBy: json["created_by"] ?? 0,
        modifiedBy: json["modified_by"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "title": title,
        "sort_order": sortOrder,
        "url": url,
        "banner_group_id": bannerGroupId,
        "container_name": containerName,
        "view_page_count": viewPageCount,
        "banner_group_banner_group_id": bannerGroupBannerGroupId,
        "link": link,
        "image": image,
        "image_path": imagePath,
        "content": content,
        "position": position,
        "is_active": isActive,
        "created_date": createdDate.toIso8601String(),
        "modified_date": modifiedDate,
        "created_by": createdBy,
        "modified_by": modifiedBy,
      };
}
