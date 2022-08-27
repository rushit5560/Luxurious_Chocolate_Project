// To parse this JSON data, do
//
//     final categoriesListModel = categoriesListModelFromJson(jsonString);

import 'dart:convert';

CategoriesListModel categoriesListModelFromJson(String str) =>
    CategoriesListModel.fromJson(json.decode(str));

String categoriesListModelToJson(CategoriesListModel data) =>
    json.encode(data.toJson());

class CategoriesListModel {
  CategoriesListModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<CategoryData> data;

  factory CategoriesListModel.fromJson(Map<String, dynamic> json) =>
      CategoriesListModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: List<CategoryData>.from(
            json["data"].map((x) => CategoryData.fromJson(x ?? ""))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryData {
  CategoryData({
    required this.categoryId,
    required this.categoryName,
    required this.categoryMetaTitle,
    required this.categoryMetaDescrtiption,
    required this.categoryMetaKeyword,
    required this.categoryImage,
    this.parent,
    required this.sortOrder,
    required this.isActive,
    required this.createdDate,
    required this.updatedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  int categoryId;
  String categoryName;
  String categoryMetaTitle;
  String categoryMetaDescrtiption;
  String categoryMetaKeyword;
  String categoryImage;
  dynamic parent;
  String sortOrder;
  int isActive;
  DateTime createdDate;
  DateTime updatedDate;
  int createdBy;
  int modifiedBy;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        categoryId: json["categoryID"] ?? 0,
        categoryName: json["categoryName"] ?? "",
        categoryMetaTitle: json["categoryMetaTitle"] ?? "",
        categoryMetaDescrtiption: json["categoryMetaDescrtiption"] ?? "",
        categoryMetaKeyword: json["categoryMetaKeyword"] ?? "",
        categoryImage: json["categoryImage"] ?? "",
        parent: json["parent"] ?? "",
        sortOrder: json["sort_order"] ?? "",
        isActive: json["is_active"] ?? 0,
        createdDate: DateTime.parse(json["created_date"] ?? ""),
        updatedDate: DateTime.parse(json["updated_date"] ?? ""),
        createdBy: json["created_by"] ?? "",
        modifiedBy: json["modified_by"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "categoryID": categoryId,
        "categoryName": categoryName,
        "categoryMetaTitle": categoryMetaTitle,
        "categoryMetaDescrtiption": categoryMetaDescrtiption,
        "categoryMetaKeyword": categoryMetaKeyword,
        "categoryImage": categoryImage,
        "parent": parent,
        "sort_order": sortOrder,
        "is_active": isActive,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "created_by": createdBy,
        "modified_by": modifiedBy,
      };
}
