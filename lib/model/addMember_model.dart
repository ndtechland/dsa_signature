// To parse this JSON data, do
//
//     final postAddMemberModel = postAddMemberModelFromJson(jsonString);

import 'dart:convert';

PostAddMemberModel postAddMemberModelFromJson(String str) => PostAddMemberModel.fromJson(json.decode(str));

String postAddMemberModelToJson(PostAddMemberModel data) => json.encode(data.toJson());

class PostAddMemberModel {
  int? status;
  String? message;
  AddMemberData? data;

  PostAddMemberModel({
    this.status,
    this.message,
    this.data,
  });

  factory PostAddMemberModel.fromJson(Map<String, dynamic> json) => PostAddMemberModel(
    status: json["Status"],
    message: json["Message"],
    data: json["data"] == null ? null : AddMemberData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "data": data?.toJson(),
  };
}

class AddMemberData {
  num? id;
  String? memberName1;
  String? memberName2;
  String? address;
  String? city;
  String? mobile1;
  String? mobile2;
  DateTime? dateOfJoining;
  DateTime? validity;
  String? type;
  String? season;
  String? apartment;
  String? occupancy;
  num? purchasePrice;
  num? adminCharges;
  num? totalCost;
  num? initialPayment;
  num? balance;
  DateTime? emiStartDate;
  num? amcAmount;
  DateTime? amcDueDate;
  String? password;
  String? membershipNo;
  bool? isActive;
  num? numberOfEmi;
  num? tenure;
  num? emi;
  String? username;
  String? repName;
  String? managerName;
  String? dsaCode;
  String? modeOfPayment;
  dynamic userPic;
  String? residenceNumber;
  String? membershipOffer;
  String? email;
  String? pincode;
  bool? isPaidEmiCommision;
  bool? isPaidSaleCommision;
  bool? isDeleted;
  num? otherCash;
  num? otherCard;
  num? otherOnline;
  num? otherCheque;
  num? approvalNumber;
  num? receiptNo;
  dynamic preAmount;
  String? termsOfMembership;
  dynamic aggrementPic;
  bool? isTrial;
  num? offerStayDays;
  num? offerStayNights;
  num? offerNoOfAdults;
  num? offerNoOfChild;
  dynamic offerIncludes;
  String? offerDestination;
  num? offerNoOfAirtickets;
  String? offerValidity;
  String? airtTicketType;
  String? offerIncludeRemark;
  bool? offerOnlyAccomodation;
  bool? offerAccomodation;
  bool? offerDinner;
  bool? offerSightSeeing;
  bool? offerBreakfast;
  num? amcFirstYear;
  num? roundOffAmcFirstYearAmount;
  num? offerBalanceAmount;
  String? preName;
  bool? isOfferUsed;
  dynamic offerExpiryDate;
  String? preName2;
  dynamic saleStatus;
  dynamic mrdRemark;
  num? offerAmount;
  num? dsaOtherContributionAmount;
  num? loginAmount;
  num? shortPayment;
  dynamic dsaOtherContributionRemark;
  bool? isPaid;
  bool? isSubmited;
  num? empId;
  String? empCode;
  num? repId;
  num? managerId;
  dynamic termsFile;
  dynamic receiptFile;
  dynamic mafFile;
  dynamic agreementFile;
  dynamic membershipOfferFile;
  dynamic dateOfHolding;
  num? rciEnrollment;
  dynamic rciEnrollDate;
  DateTime? member1Dob;
  DateTime? member2Dob;
  bool? isTrialPack;

  AddMemberData({
    this.id,
    this.memberName1,
    this.memberName2,
    this.address,
    this.city,
    this.mobile1,
    this.mobile2,
    this.dateOfJoining,
    this.validity,
    this.type,
    this.season,
    this.apartment,
    this.occupancy,
    this.purchasePrice,
    this.adminCharges,
    this.totalCost,
    this.initialPayment,
    this.balance,
    this.emiStartDate,
    this.amcAmount,
    this.amcDueDate,
    this.password,
    this.membershipNo,
    this.isActive,
    this.numberOfEmi,
    this.tenure,
    this.emi,
    this.username,
    this.repName,
    this.managerName,
    this.dsaCode,
    this.modeOfPayment,
    this.userPic,
    this.residenceNumber,
    this.membershipOffer,
    this.email,
    this.pincode,
    this.isPaidEmiCommision,
    this.isPaidSaleCommision,
    this.isDeleted,
    this.otherCash,
    this.otherCard,
    this.otherOnline,
    this.otherCheque,
    this.approvalNumber,
    this.receiptNo,
    this.preAmount,
    this.termsOfMembership,
    this.aggrementPic,
    this.isTrial,
    this.offerStayDays,
    this.offerStayNights,
    this.offerNoOfAdults,
    this.offerNoOfChild,
    this.offerIncludes,
    this.offerDestination,
    this.offerNoOfAirtickets,
    this.offerValidity,
    this.airtTicketType,
    this.offerIncludeRemark,
    this.offerOnlyAccomodation,
    this.offerAccomodation,
    this.offerDinner,
    this.offerSightSeeing,
    this.offerBreakfast,
    this.amcFirstYear,
    this.roundOffAmcFirstYearAmount,
    this.offerBalanceAmount,
    this.preName,
    this.isOfferUsed,
    this.offerExpiryDate,
    this.preName2,
    this.saleStatus,
    this.mrdRemark,
    this.offerAmount,
    this.dsaOtherContributionAmount,
    this.loginAmount,
    this.shortPayment,
    this.dsaOtherContributionRemark,
    this.isPaid,
    this.isSubmited,
    this.empId,
    this.empCode,
    this.repId,
    this.managerId,
    this.termsFile,
    this.receiptFile,
    this.mafFile,
    this.agreementFile,
    this.membershipOfferFile,
    this.dateOfHolding,
    this.rciEnrollment,
    this.rciEnrollDate,
    this.member1Dob,
    this.member2Dob,
    this.isTrialPack,
  });

  factory AddMemberData.fromJson(Map<String, dynamic> json) => AddMemberData(
    id: json["Id"],
    memberName1: json["MemberName1"],
    memberName2: json["MemberName2"],
    address: json["Address"],
    city: json["City"],
    mobile1: json["Mobile1"],
    mobile2: json["Mobile2"],
    dateOfJoining: json["DateOfJoining"] == null ? null : DateTime.parse(json["DateOfJoining"]),
    validity: json["Validity"] == null ? null : DateTime.parse(json["Validity"]),
    type: json["Type"],
    season: json["Season"],
    apartment: json["Apartment"],
    occupancy: json["Occupancy"],
    purchasePrice: json["PurchasePrice"],
    adminCharges: json["AdminCharges"],
    totalCost: json["TotalCost"],
    initialPayment: json["InitialPayment"],
    balance: json["Balance"],
    emiStartDate: json["EMIStartDate"] == null ? null : DateTime.parse(json["EMIStartDate"]),
    amcAmount: json["AMC_Amount"],
    amcDueDate: json["AMC_DueDate"] == null ? null : DateTime.parse(json["AMC_DueDate"]),
    password: json["Password"],
    membershipNo: json["MembershipNo"],
    isActive: json["IsActive"],
    numberOfEmi: json["NumberOfEMI"],
    tenure: json["Tenure"],
    emi: json["EMI"],
    username: json["Username"],
    repName: json["RepName"],
    managerName: json["ManagerName"],
    dsaCode: json["Dsa_Code"],
    modeOfPayment: json["ModeOfPayment"],
    userPic: json["UserPic"],
    residenceNumber: json["ResidenceNumber"],
    membershipOffer: json["MembershipOffer"],
    email: json["Email"],
    pincode: json["Pincode"],
    isPaidEmiCommision: json["isPaidEmiCommision"],
    isPaidSaleCommision: json["isPaidSaleCommision"],
    isDeleted: json["IsDeleted"],
    otherCash: json["OtherCash"],
    otherCard: json["OtherCard"],
    otherOnline: json["OtherOnline"],
    otherCheque: json["OtherCheque"],
    approvalNumber: json["ApprovalNumber"],
    receiptNo: json["ReceiptNo"],
    preAmount: json["PreAmount"],
    termsOfMembership: json["TermsOfMembership"],
    aggrementPic: json["AggrementPic"],
    isTrial: json["IsTrial"],
    offerStayDays: json["Offer_StayDays"],
    offerStayNights: json["Offer_StayNights"],
    offerNoOfAdults: json["Offer_NoOfAdults"],
    offerNoOfChild: json["Offer_NoOfChild"],
    offerIncludes: json["Offer_Includes"],
    offerDestination: json["Offer_Destination"],
    offerNoOfAirtickets: json["Offer_NoOfAirtickets"],
    offerValidity: json["Offer_Validity"],
    airtTicketType: json["AirtTicketType"],
    offerIncludeRemark: json["Offer_IncludeRemark"],
    offerOnlyAccomodation: json["Offer_OnlyAccomodation"],
    offerAccomodation: json["Offer_Accomodation"],
    offerDinner: json["Offer_Dinner"],
    offerSightSeeing: json["Offer_SightSeeing"],
    offerBreakfast: json["Offer_Breakfast"],
    amcFirstYear: json["AmcFirstYear"],
    roundOffAmcFirstYearAmount: json["RoundOffAmcFirstYearAmount"],
    offerBalanceAmount: json["Offer_BalanceAmount"],
    preName: json["PreName"],
    isOfferUsed: json["IsOfferUsed"],
    offerExpiryDate: json["OfferExpiryDate"],
    preName2: json["PreName2"],
    saleStatus: json["SaleStatus"],
    mrdRemark: json["MrdRemark"],
    offerAmount: json["OfferAmount"],
    dsaOtherContributionAmount: json["Dsa_OtherContributionAmount"],
    loginAmount: json["LoginAmount"],
    shortPayment: json["ShortPayment"],
    dsaOtherContributionRemark: json["DsaOtherContributionRemark"],
    isPaid: json["isPaid"],
    isSubmited: json["IsSubmited"],
    empId: json["Emp_Id"],
    empCode: json["EmpCode"],
    repId: json["RepId"],
    managerId: json["ManagerId"],
    termsFile: json["TermsFile"],
    receiptFile: json["ReceiptFile"],
    mafFile: json["MafFile"],
    agreementFile: json["AgreementFile"],
    membershipOfferFile: json["MembershipOfferFile"],
    dateOfHolding: json["DateOfHolding"],
    rciEnrollment: json["RCIEnrollment"],
    rciEnrollDate: json["RCIEnrollDate"],
    member1Dob: json["Member1DOB"] == null ? null : DateTime.parse(json["Member1DOB"]),
    member2Dob: json["Member2DOB"] == null ? null : DateTime.parse(json["Member2DOB"]),
    isTrialPack: json["IsTrialPack"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "MemberName1": memberName1,
    "MemberName2": memberName2,
    "Address": address,
    "City": city,
    "Mobile1": mobile1,
    "Mobile2": mobile2,
    "DateOfJoining": dateOfJoining?.toIso8601String(),
    "Validity": validity?.toIso8601String(),
    "Type": type,
    "Season": season,
    "Apartment": apartment,
    "Occupancy": occupancy,
    "PurchasePrice": purchasePrice,
    "AdminCharges": adminCharges,
    "TotalCost": totalCost,
    "InitialPayment": initialPayment,
    "Balance": balance,
    "EMIStartDate": emiStartDate?.toIso8601String(),
    "AMC_Amount": amcAmount,
    "AMC_DueDate": amcDueDate?.toIso8601String(),
    "Password": password,
    "MembershipNo": membershipNo,
    "IsActive": isActive,
    "NumberOfEMI": numberOfEmi,
    "Tenure": tenure,
    "EMI": emi,
    "Username": username,
    "RepName": repName,
    "ManagerName": managerName,
    "Dsa_Code": dsaCode,
    "ModeOfPayment": modeOfPayment,
    "UserPic": userPic,
    "ResidenceNumber": residenceNumber,
    "MembershipOffer": membershipOffer,
    "Email": email,
    "Pincode": pincode,
    "isPaidEmiCommision": isPaidEmiCommision,
    "isPaidSaleCommision": isPaidSaleCommision,
    "IsDeleted": isDeleted,
    "OtherCash": otherCash,
    "OtherCard": otherCard,
    "OtherOnline": otherOnline,
    "OtherCheque": otherCheque,
    "ApprovalNumber": approvalNumber,
    "ReceiptNo": receiptNo,
    "PreAmount": preAmount,
    "TermsOfMembership": termsOfMembership,
    "AggrementPic": aggrementPic,
    "IsTrial": isTrial,
    "Offer_StayDays": offerStayDays,
    "Offer_StayNights": offerStayNights,
    "Offer_NoOfAdults": offerNoOfAdults,
    "Offer_NoOfChild": offerNoOfChild,
    "Offer_Includes": offerIncludes,
    "Offer_Destination": offerDestination,
    "Offer_NoOfAirtickets": offerNoOfAirtickets,
    "Offer_Validity": offerValidity,
    "AirtTicketType": airtTicketType,
    "Offer_IncludeRemark": offerIncludeRemark,
    "Offer_OnlyAccomodation": offerOnlyAccomodation,
    "Offer_Accomodation": offerAccomodation,
    "Offer_Dinner": offerDinner,
    "Offer_SightSeeing": offerSightSeeing,
    "Offer_Breakfast": offerBreakfast,
    "AmcFirstYear": amcFirstYear,
    "RoundOffAmcFirstYearAmount": roundOffAmcFirstYearAmount,
    "Offer_BalanceAmount": offerBalanceAmount,
    "PreName": preName,
    "IsOfferUsed": isOfferUsed,
    "OfferExpiryDate": offerExpiryDate,
    "PreName2": preName2,
    "SaleStatus": saleStatus,
    "MrdRemark": mrdRemark,
    "OfferAmount": offerAmount,
    "Dsa_OtherContributionAmount": dsaOtherContributionAmount,
    "LoginAmount": loginAmount,
    "ShortPayment": shortPayment,
    "DsaOtherContributionRemark": dsaOtherContributionRemark,
    "isPaid": isPaid,
    "IsSubmited": isSubmited,
    "Emp_Id": empId,
    "EmpCode": empCode,
    "RepId": repId,
    "ManagerId": managerId,
    "TermsFile": termsFile,
    "ReceiptFile": receiptFile,
    "MafFile": mafFile,
    "AgreementFile": agreementFile,
    "MembershipOfferFile": membershipOfferFile,
    "DateOfHolding": dateOfHolding,
    "RCIEnrollment": rciEnrollment,
    "RCIEnrollDate": rciEnrollDate,
    "Member1DOB": member1Dob?.toIso8601String(),
    "Member2DOB": member2Dob?.toIso8601String(),
    "IsTrialPack": isTrialPack,
  };
}
