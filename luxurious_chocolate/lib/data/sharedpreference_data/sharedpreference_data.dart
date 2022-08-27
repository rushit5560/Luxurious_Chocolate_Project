import '../constants/user_details.dart';

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/user_details.dart';

class SharedPreferenceData {
  String isUserLoggedInKey = "isUserLoggedInKey";
  // String apiTokenKey = "apiTokenKey";

  String userIdKey = "userIdKey";
  String apiTokenKey = "apiTokenKey";
  String uniqueIdKey = "uniqueIdKey";
  String tableWiseIdKey = "tableWiseIdKey";
  String userNameKey = "userNameKey";
  String emailKey = "emailKey";
  String phoneNoKey = "phoneNoKey";
  String dobKey = "dobKey";
  String roleNameKey = "roleNameKey";
  String genderKey = "genderKey";

  String userImagekey = "userImagekey";

  String createdAtKey = "createdAtKey";
  String updatedAtKey = "updatedAtKey";
  String businessNameKey = "businessNameKey";
  String addressKey = "addressKey";
  String streetKey = "streetKey";
  String stateKey = "stateKey";
  String countryKey = "countryKey";
  String subUrbKey = "subUrbKey";
  String postCodeKey = "postCodeKey";
  //String slotDurationKey = "slotDurationKey";
  String businessIdKey = "businessIdKey";
  String serviceSlotKey = "serviceSlotKey";
  String stripeIdKey = "stripeIdKey";

  // String businessNameKey = "businessNameKey";
  // String addressKey = "addressKey";
  // String streetKey = "streetKey";
  // String stateKey = "stateKey";
  // String countryKey = "countryKey";
  // String subUrbKey = "subUrbKey";
  // String postCodeKey = "postCodeKey";
  // //String slotDurationKey = "slotDurationKey";
  // String businessIdKey = "businessIdKey";
  // String serviceSlotKey = "serviceSlotKey";
  // String stripeIdKey = "stripeIdKey";
  String latitudeKey = "latitudeKey";
  String longitudeKey = "longitudeKey";

  // String latitudeKey = "latitudeKey";
  // String longitudeKey = "longitudeKey";
  String vendorVerificationKey = "vendorVerification";
  String isSubscriptionKey = "isSubscription";

  // String vendorVerificationKey = "vendorVerification";
  // String isSubscriptionKey = "isSubscription";
  String isUserFirstTimeKey = "isUserFirstTimeKey";

  // String isUserFirstTimeKey = "isUserFirstTimeKey";

  // String financialInstitutionNameKey = "financialInstitutionNameKey";
  // String accountNameKey = "accountNameKey";
  // String accountNumberKey = "accountNumberKey";
  // String ifscCodeKey = "ifscCodeKey";
  // String isPriceDisplayKey = "isPriceDisplayKey";
  String financialInstitutionNameKey = "financialInstitutionNameKey";
  String accountNameKey = "accountNameKey";
  String accountNumberKey = "accountNumberKey";
  String ifscCodeKey = "ifscCodeKey";
  String isPriceDisplayKey = "isPriceDisplayKey";

  /// This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({
    required String userId,
    required String userName,
    required String email,
    required String userImage,
    required String createdAt,
    required String updatedAt,
    // required String gender,
    // required String businessName,
    // required String address,
    // required String street,
    // required String state,
    // required String country,
    // required String subUrb,
    // required String postCode,
    // String? stripeId,
    // bool? isSubscription,
    // required bool vendorVerification,
    // required String businessId,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.setBool(isUserLoggedInKey, false);

    prefs.remove(userIdKey);

    prefs.remove(userNameKey);
    prefs.remove(emailKey);
    prefs.remove(userImagekey);
    prefs.remove(createdAtKey);
    prefs.remove(updatedAtKey);
    // prefs.remove(genderKey);
    // prefs.remove(businessNameKey);
    // prefs.remove(addressKey);
    // prefs.remove(streetKey);
    // prefs.remove(stateKey);
    // prefs.remove(countryKey);
    // prefs.remove(subUrbKey);
    // prefs.remove(postCodeKey);
    // prefs.remove(stripeIdKey);
    // prefs.remove(isSubscriptionKey);
    // //prefs.remove(slotDurationKey);
    // prefs.remove(vendorVerificationKey);
    // prefs.remove(businessIdKey);

    prefs.setBool(isUserLoggedInKey, true);

    prefs.setString(userIdKey, userId);

    prefs.setString(userNameKey, userName);
    prefs.setString(emailKey, email);
    prefs.setString(userImagekey, userImage);
    prefs.setString(createdAtKey, createdAt);
    prefs.setString(updatedAtKey, updatedAt);
    // prefs.setString(genderKey, gender);
    // prefs.setString(businessNameKey, businessName);
    // prefs.setString(addressKey, address);
    // prefs.setString(streetKey, street);

    // prefs.setBool(isPriceDisplayKey, isPriceDisplay);
    // prefs.setString(phoneNoKey, phoneNo);
    // prefs.setString(dobKey, dob);
    // prefs.setString(roleNameKey, roleName);
    // prefs.setString(genderKey, gender);

    // Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;

    UserDetails.userId = prefs.getString(userIdKey) ?? "";

    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.email = prefs.getString(emailKey) ?? "";

    UserDetails.userimage = prefs.getString(userImagekey) ?? "";
    UserDetails.createdAt = prefs.getString(createdAtKey) ?? "";
    UserDetails.updatedAt = prefs.getString(updatedAtKey) ?? "";
    // UserDetails.roleName = prefs.getString(roleNameKey) ?? "";
    // UserDetails.gender = prefs.getString(genderKey) ?? "";
    // UserDetails.businessName = prefs.getString(businessNameKey) ?? "";
    // UserDetails.address = prefs.getString(addressKey) ?? "";
    // UserDetails.street = prefs.getString(streetKey) ?? "";
    // UserDetails.state = prefs.getString(stateKey) ?? "";
    // UserDetails.country = prefs.getString(countryKey) ?? "";
    // UserDetails.subUrb = prefs.getString(subUrbKey) ?? "";
    // UserDetails.postCode = prefs.getString(postCodeKey) ?? "";
    // UserDetails.stripeId = prefs.getString(stripeIdKey) ?? "";

    log("UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}");

    log("UserDetails.userId : ${UserDetails.userId}");

    log("UserDetails.userName : ${UserDetails.userName}");
    log("UserDetails.email : ${UserDetails.email}");
    log("UserDetails.userimage : ${UserDetails.userimage}");
    log("UserDetails.createdAt : ${UserDetails.createdAt}");
    log("UserDetails.updatedAt : ${UserDetails.updatedAt}");
    // log("UserDetails.gender : ${UserDetails.gender}");
    // log("UserDetails.businessName : ${UserDetails.businessName}");
    // log("UserDetails.address : ${UserDetails.address}");
    // log("UserDetails.street : ${UserDetails.street}");
    // log("UserDetails.state : ${UserDetails.state}");
    // log("UserDetails.country : ${UserDetails.country}");
    // log("UserDetails.subUrb : ${UserDetails.subUrb}");
    // log("UserDetails.postCode : ${UserDetails.postCode}");
    // log("UserDetails.stripeId : ${UserDetails.stripeId}");
    // //log("UserDetails.slotDuration : ${UserDetails.slotDuration}");
    // log("UserDetails.isSubscription : ${UserDetails.isSubscription}");
    // log("UserDetails.businessId : ${UserDetails.vendorVerification}");
    // log("UserDetails.businessId : ${UserDetails.businessId}");
    // log("UserDetails.isServiceSlot : ${UserDetails.isServiceSlot}");
    // log("UserDetails.isPriceDisplay : ${UserDetails.isPriceDisplay}");
  }

  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, false);

    prefs.setString(userIdKey, "");

    prefs.setString(userNameKey, "");
    prefs.setString(emailKey, "");
    prefs.setString(userImagekey, "");
    prefs.setString(createdAtKey, "");
    prefs.setString(updatedAtKey, "");
    // prefs.setString(genderKey, "");
    // prefs.setString(businessNameKey, "");
    // prefs.setString(addressKey, "");
    // prefs.setString(streetKey, "");
    // prefs.setString(stateKey, "");
    // prefs.setString(countryKey, "");

    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;

    UserDetails.userId = prefs.getString(userIdKey) ?? "";

    UserDetails.userName = prefs.getString(userNameKey) ?? "";
    UserDetails.email = prefs.getString(emailKey) ?? "";
    UserDetails.userimage = prefs.getString(userImagekey) ?? "";
    UserDetails.createdAt = prefs.getString(createdAtKey) ?? "";
    UserDetails.updatedAt = prefs.getString(updatedAtKey) ?? "";

    // UserDetails.phoneNo = prefs.getString(phoneNoKey) ?? "";
    // UserDetails.dob = prefs.getString(dobKey) ?? "";
    // UserDetails.roleName = prefs.getString(roleNameKey) ?? "";
    // UserDetails.gender = prefs.getString(genderKey) ?? "";
    // UserDetails.businessName = prefs.getString(businessNameKey) ?? "";
    // UserDetails.address = prefs.getString(addressKey) ?? "";
    // UserDetails.street = prefs.getString(streetKey) ?? "";
    // UserDetails.state = prefs.getString(stateKey) ?? "";
    // UserDetails.country = prefs.getString(countryKey) ?? "";
    // UserDetails.subUrb = prefs.getString(subUrbKey) ?? "";
    // UserDetails.postCode = prefs.getString(postCodeKey) ?? "";
    // UserDetails.stripeId = prefs.getString(stripeIdKey) ?? "";
    //UserDetails.slotDuration = prefs.getString(slotDurationKey) ?? "";
    // UserDetails.vendorVerification =
    //     prefs.getBool(vendorVerificationKey) ?? false;
    // UserDetails.institutionName =
    //     prefs.getString(financialInstitutionNameKey) ?? "";

    log("UserDetails.userId : ${UserDetails.userId}");

    log("UserDetails.userName : ${UserDetails.userName}");
    log("UserDetails.email : ${UserDetails.email}");
    log("UserDetails.userimage : ${UserDetails.userimage}");
    log("UserDetails.createdAt : ${UserDetails.createdAt}");
    log("UserDetails.updatedAt : ${UserDetails.updatedAt}");
    // log("UserDetails.roleName : ${UserDetails.roleName}");
    // log("UserDetails.gender : ${UserDetails.gender}");
    // log("UserDetails.businessName : ${UserDetails.businessName}");
    // log("UserDetails.address : ${UserDetails.address}");
    // log("UserDetails.street : ${UserDetails.street}");
    // log("UserDetails.state : ${UserDetails.state}");
    // log("UserDetails.country : ${UserDetails.country}");
    // log("UserDetails.subUrb : ${UserDetails.subUrb}");

    /// Set Latitude & Longitude
    setLatAndLongInPrefs({required String lat, required String long}) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(latitudeKey, lat);
      prefs.setString(longitudeKey, long);

      UserDetails.latitude = prefs.getString(latitudeKey) ?? "";
      UserDetails.longitude = prefs.getString(longitudeKey) ?? "";
    }

    /// Clear Lat & Long
    clearLatAndLongFromPrefs() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(latitudeKey);
      prefs.remove(longitudeKey);

      prefs.setString(latitudeKey, "");
      prefs.setString(longitudeKey, "");
    }

    setUserIsFirstTimeInApp() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(isUserFirstTimeKey, false);
    }

    setBankInfoInPrefs({
      required String instituteName,
      required String accountName,
      required String accountNumber,
      required String ifscCode,
    }) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(financialInstitutionNameKey, instituteName);
      prefs.setString(accountNameKey, accountName);
      prefs.setString(accountNumberKey, accountNumber);
      prefs.setString(ifscCodeKey, ifscCode);

      UserDetails.institutionName =
          prefs.getString(financialInstitutionNameKey) ?? "";
      UserDetails.accountName = prefs.getString(accountNameKey) ?? "";
      UserDetails.accountNumber = prefs.getString(accountNumberKey) ?? "";
      UserDetails.ifscCode = prefs.getString(ifscCodeKey) ?? "";
    }
  }
}
