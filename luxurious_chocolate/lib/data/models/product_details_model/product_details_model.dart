// To parse this JSON data, do
//
//     final ProductDetailsModel = ProductDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel ProductDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String ProductDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<ProductsListItem> data;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        success: json["success"],
        message: json["message"],
        data: List<ProductsListItem>.from(
            json["data"].map((x) => ProductsListItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductsListItem {
  ProductsListItem({
    required this.id,
    required this.productname,
    required this.sku,
    required this.productslug,
    required this.fullText,
    required this.category,
    required this.upc,
    required this.quantity,
    required this.outofStockStatus,
    required this.dateavailable,
    required this.sortorder,
    required this.brandId,
    required this.variantsValues,
    required this.metaTagKeyword,
    required this.metaTagDescription,
    required this.showimg,
    required this.metaTagTitle,
    required this.productcost,
    required this.tax,
    required this.taxvalue,
    required this.totalcost,
    required this.requiredshipping,
    required this.width,
    required this.height,
    required this.length,
    required this.weight,
    required this.minimumkg,
    required this.isActive,
    required this.images,
    required this.feature,
    required this.todaydeals,
    required this.relatedProducts,
    required this.topProduct,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
    required this.variyant,
  });

  int id;
  String productname;
  String sku;
  String productslug;
  String fullText;
  String category;
  String upc;
  int quantity;
  String outofStockStatus;
  String dateavailable;
  String sortorder;
  String brandId;
  String variantsValues;
  String metaTagKeyword;
  String metaTagDescription;
  String showimg;
  String metaTagTitle;
  String productcost;
  String tax;
  String taxvalue;
  String totalcost;
  String requiredshipping;
  String width;
  String height;
  String length;
  String weight;
  int minimumkg;
  String isActive;
  List<String> images;
  int feature;
  int todaydeals;
  String relatedProducts;
  String topProduct;
  String createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;
  List<List<dynamic>> variyant;

  factory ProductsListItem.fromJson(Map<String, dynamic> json) =>
      ProductsListItem(
        id: json["id"] ?? 0,
        productname: json["productname"] ?? "",
        sku: json["sku"] ?? "",
        productslug: json["productslug"] ?? "",
        fullText: json["full_text"] ?? "",
        category: json["category"] ?? "",
        upc: json["upc"] ?? "",
        quantity: json["quantity"] ?? 0,
        outofStockStatus: json["OutofStockStatus"] ?? "",
        dateavailable: json["dateavailable"] ?? "",
        sortorder: json["sortorder"] ?? "",
        brandId: json["brand_id"] ?? "",
        variantsValues: json["variants_values"] ?? "",
        metaTagKeyword: json["meta_tag_Keyword"] ?? "",
        metaTagDescription: json["meta_tag_description"] ?? "",
        showimg: json["showimg"] ?? "",
        metaTagTitle: json["meta_tag_title"] ?? "",
        productcost: json["productcost"] ?? "",
        tax: json["tax"] ?? "",
        taxvalue: json["taxvalue"] ?? "",
        totalcost: json["totalcost"] ?? "",
        requiredshipping: json["requiredshipping"] ?? "",
        width: json["Width"] ?? "",
        height: json["Height"] ?? "",
        length: json["Length"] ?? "",
        weight: json["Weight"] ?? "",
        minimumkg: json["minimumkg"] ?? 0,
        isActive: json["is_active"] ?? "",
        images: List<String>.from((json["images"] ?? []).map((x) => x)),
        feature: json["feature"] ?? 0,
        todaydeals: json["todaydeals"] ?? 0,
        relatedProducts: json["related_products"] ?? "",
        topProduct: json["top_product"] ?? "",
        createdBy: json["created_by"] ?? "",
        modifiedBy: json["modified_by"] ?? "",
        createdDate: json["created_date"] ?? "",
        modifiedDate: json["modified_date"] ?? "",
        variyant: List<List<dynamic>>.from((json["variyant"] ?? [])
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productname": productname,
        "sku": sku,
        "productslug": productslug,
        "full_text": fullText,
        "category": category,
        "upc": upc,
        "quantity": quantity,
        "OutofStockStatus": outofStockStatus,
        "dateavailable": dateavailable,
        "sortorder": sortorder,
        "brand_id": brandId,
        "variants_values": variantsValues,
        "meta_tag_Keyword": metaTagKeyword,
        "meta_tag_description": metaTagDescription,
        "showimg": showimg,
        "meta_tag_title": metaTagTitle,
        "productcost": productcost,
        "tax": tax,
        "taxvalue": taxvalue,
        "totalcost": totalcost,
        "requiredshipping": requiredshipping,
        "Width": width,
        "Height": height,
        "Length": length,
        "Weight": weight,
        "minimumkg": minimumkg,
        "is_active": isActive,
        "images": List<dynamic>.from(images.map((x) => x)),
        "feature": feature,
        "todaydeals": todaydeals,
        "related_products": relatedProducts,
        "top_product": topProduct,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_date": createdDate,
        "modified_date": modifiedDate,
        "variyant": List<dynamic>.from(
            variyant.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
