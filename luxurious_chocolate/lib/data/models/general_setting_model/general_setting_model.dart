// To parse this JSON data, do
//
//     final generalSettingModel = generalSettingModelFromJson(jsonString);

import 'dart:convert';

GeneralSettingModel generalSettingModelFromJson(String str) =>
    GeneralSettingModel.fromJson(json.decode(str));

String generalSettingModelToJson(GeneralSettingModel data) =>
    json.encode(data.toJson());

class GeneralSettingModel {
  GeneralSettingModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory GeneralSettingModel.fromJson(Map<String, dynamic> json) =>
      GeneralSettingModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: Data.fromJson(json["data"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.gsId,
    required this.gsName,
    required this.gsOwner,
    required this.gsAddress,
    required this.gsEmail,
    required this.gsMobile,
    required this.gsLogo,
    required this.gsInvlogo,
    required this.gsEmaillogo,
    required this.gsCountryId,
    required this.gsZoneId,
    required this.gsLangId,
    required this.gsCurrId,
    required this.gsMaintainMode,
    required this.contactusImage,
    required this.contactusStorehours,
    required this.contactusMap,
    required this.homeSubscribeTitle,
    required this.homeSubscribeContent,
    required this.homeSubscribeImg,
    required this.homeTitle,
    required this.homeContent,
    required this.homeImgRight,
    required this.homeImgLeft,
    required this.aboutusTitle,
    required this.aboutusContent,
    required this.aboutusOne,
    required this.aboutusTwo,
    required this.testimonialtitle,
    required this.testimonialoffer,
    required this.testimoniallink,
    required this.testinialImg,
    required this.offericon,
    required this.offercontent,
    required this.offerprice,
    required this.offerimg,
    required this.subscribeicon,
    required this.subscribetitle,
    required this.subscribecontent,
    required this.subscribeimg,
    required this.homeMetaTitle,
    required this.homeMetaDec,
    required this.homeMetaKeyword,
    required this.metaContectusTitle,
    required this.metaContectusDescription,
    required this.metaContectusKeyword,
    required this.createdDate,
    required this.updatedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  int gsId;
  String gsName;
  String gsOwner;
  String gsAddress;
  String gsEmail;
  String gsMobile;
  String gsLogo;
  String gsInvlogo;
  String gsEmaillogo;
  int gsCountryId;
  int gsZoneId;
  int gsLangId;
  int gsCurrId;
  int gsMaintainMode;
  String contactusImage;
  String contactusStorehours;
  String contactusMap;
  String homeSubscribeTitle;
  String homeSubscribeContent;
  String homeSubscribeImg;
  String homeTitle;
  String homeContent;
  String homeImgRight;
  String homeImgLeft;
  String aboutusTitle;
  String aboutusContent;
  String aboutusOne;
  String aboutusTwo;
  String testimonialtitle;
  String testimonialoffer;
  String testimoniallink;
  String testinialImg;
  String offericon;
  String offercontent;
  String offerprice;
  String offerimg;
  String subscribeicon;
  String subscribetitle;
  String subscribecontent;
  String subscribeimg;
  String homeMetaTitle;
  String homeMetaDec;
  String homeMetaKeyword;
  String metaContectusTitle;
  String metaContectusDescription;
  String metaContectusKeyword;
  DateTime createdDate;
  DateTime updatedDate;
  int createdBy;
  int modifiedBy;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gsId: json["gsID"] ?? 0,
        gsName: json["gsName"] ?? "",
        gsOwner: json["gsOwner"] ?? "",
        gsAddress: json["gsAddress"] ?? "",
        gsEmail: json["gsEmail"] ?? "",
        gsMobile: json["gsMobile"] ?? "",
        gsLogo: json["gsLogo"] ?? "",
        gsInvlogo: json["gsInvlogo"],
        gsEmaillogo: json["gsEmaillogo"],
        gsCountryId: json["gsCountryId"] ?? 0,
        gsZoneId: json["gsZoneId"] ?? 0,
        gsLangId: json["gsLangId"] ?? 0,
        gsCurrId: json["gsCurrId"] ?? 0,
        gsMaintainMode: json["gsMaintainMode"] ?? 0,
        contactusImage: json["contactus_image"] ?? "",
        contactusStorehours: json["contactus_storehours"] ?? "",
        contactusMap: json["contactus_map"] ?? "",
        homeSubscribeTitle: json["home_subscribe_title"] ?? "",
        homeSubscribeContent: json["home_subscribe_content"] ?? "",
        homeSubscribeImg: json["home_subscribe_img"] ?? "",
        homeTitle: json["home_title"] ?? "",
        homeContent: json["home_content"] ?? "",
        homeImgRight: json["home_img_right"] ?? "",
        homeImgLeft: json["home_img_left"] ?? "",
        aboutusTitle: json["aboutus_title"] ?? "",
        aboutusContent: json["aboutus_content"] ?? "",
        aboutusOne: json["aboutus_one"] ?? "",
        aboutusTwo: json["aboutus_two"] ?? "",
        testimonialtitle: json["testimonialtitle"] ?? "",
        testimonialoffer: json["testimonialoffer"] ?? "",
        testimoniallink: json["testimoniallink"] ?? "",
        testinialImg: json["testinial_img"] ?? "",
        offericon: json["offericon"] ?? "",
        offercontent: json["offercontent"] ?? "",
        offerprice: json["offerprice"] ?? "",
        offerimg: json["offerimg"] ?? "",
        subscribeicon: json["subscribeicon"] ?? "",
        subscribetitle: json["subscribetitle"] ?? "",
        subscribecontent: json["subscribecontent"] ?? "",
        subscribeimg: json["subscribeimg"] ?? "",
        homeMetaTitle: json["home_meta_title"] ?? "",
        homeMetaDec: json["home_meta_dec"] ?? "",
        homeMetaKeyword: json["home_meta_keyword"] ?? "",
        metaContectusTitle: json["meta_contectus_title"] ?? "",
        metaContectusDescription: json["meta_contectus_description"] ?? "",
        metaContectusKeyword: json["meta_contectus_keyword"] ?? "",
        createdDate: DateTime.parse(json["created_date"] ?? ""),
        updatedDate: DateTime.parse(json["updated_date"] ?? ""),
        createdBy: json["created_by"] ?? 0,
        modifiedBy: json["modified_by"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "gsID": gsId,
        "gsName": gsName,
        "gsOwner": gsOwner,
        "gsAddress": gsAddress,
        "gsEmail": gsEmail,
        "gsMobile": gsMobile,
        "gsLogo": gsLogo,
        "gsInvlogo": gsInvlogo,
        "gsEmaillogo": gsEmaillogo,
        "gsCountryId": gsCountryId,
        "gsZoneId": gsZoneId,
        "gsLangId": gsLangId,
        "gsCurrId": gsCurrId,
        "gsMaintainMode": gsMaintainMode,
        "contactus_image": contactusImage,
        "contactus_storehours": contactusStorehours,
        "contactus_map": contactusMap,
        "home_subscribe_title": homeSubscribeTitle,
        "home_subscribe_content": homeSubscribeContent,
        "home_subscribe_img": homeSubscribeImg,
        "home_title": homeTitle,
        "home_content": homeContent,
        "home_img_right": homeImgRight,
        "home_img_left": homeImgLeft,
        "aboutus_title": aboutusTitle,
        "aboutus_content": aboutusContent,
        "aboutus_one": aboutusOne,
        "aboutus_two": aboutusTwo,
        "testimonialtitle": testimonialtitle,
        "testimonialoffer": testimonialoffer,
        "testimoniallink": testimoniallink,
        "testinial_img": testinialImg,
        "offericon": offericon,
        "offercontent": offercontent,
        "offerprice": offerprice,
        "offerimg": offerimg,
        "subscribeicon": subscribeicon,
        "subscribetitle": subscribetitle,
        "subscribecontent": subscribecontent,
        "subscribeimg": subscribeimg,
        "home_meta_title": homeMetaTitle,
        "home_meta_dec": homeMetaDec,
        "home_meta_keyword": homeMetaKeyword,
        "meta_contectus_title": metaContectusTitle,
        "meta_contectus_description": metaContectusDescription,
        "meta_contectus_keyword": metaContectusKeyword,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "created_by": createdBy,
        "modified_by": modifiedBy,
      };
}
