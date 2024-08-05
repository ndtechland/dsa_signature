
import 'dart:convert';

ApprovalFormModel approvalFormModelFromJson(String str) => ApprovalFormModel.fromJson(json.decode(str));

String approvalFormModelToJson(ApprovalFormModel data) => json.encode(data.toJson());

class ApprovalFormModel {
  int? status;
  String? message;
  ApprovalData? data;

  ApprovalFormModel({
    this.status,
    this.message,
    this.data,
  });

  factory ApprovalFormModel.fromJson(Map<String, dynamic> json) => ApprovalFormModel(
    status: json["Status"],
    message: json["Message"],
    data: json["Data"] == null ? null : ApprovalData.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Data": data?.toJson(),
  };
}

class ApprovalData {
  num? approvalNumber;
  DateTime? craeteDate;
  String? mafNumber;
  String? dsaCode;
  DateTime? member1Dob;
  String? memberName2;
  DateTime? member2Dob;
  String? address;
  String? city;
  String? mobile1;
  String? mobile2;
  String? pincode;
  String? email;
  String? apartment;
  String? occupancy;
  num? tenure;
  String? season;
  num? amcAmount;
  DateTime? amcDueDate;
  dynamic preAmount;
  dynamic dateOfHolding;
  dynamic rciEnrollment;
  num? purchasePrice;
  num? adminCharges;
  num? totalCost;
  num? initialPayment;
  num? balance;
  String? modeOfPayment;
  DateTime? dateOfJoining;
  num? emi;
  num? numberOfEmi;
  DateTime? emiStartDate;
  dynamic offerDestination;
  dynamic offerStayDays;
  dynamic offerStayNights;
  dynamic offerNoOfAdults;
  dynamic offerNoOfChild;
  bool? offerOnlyAccomodation;
  bool? offerAccomodation;
  bool? offerBreakfast;
  bool? offerDinner;
  bool? offerSightSeeing;
  dynamic offerNoOfAirtickets;
  dynamic airtTicketType;
  dynamic offerBalanceAmount;
  String? offerValidity;
  String? offerIncludeRemark;
  String? repName;
  String? managerName;

  ApprovalData({
    this.approvalNumber,
    this.craeteDate,
    this.mafNumber,
    this.dsaCode,
    this.member1Dob,
    this.memberName2,
    this.member2Dob,
    this.address,
    this.city,
    this.mobile1,
    this.mobile2,
    this.pincode,
    this.email,
    this.apartment,
    this.occupancy,
    this.tenure,
    this.season,
    this.amcAmount,
    this.amcDueDate,
    this.preAmount,
    this.dateOfHolding,
    this.rciEnrollment,
    this.purchasePrice,
    this.adminCharges,
    this.totalCost,
    this.initialPayment,
    this.balance,
    this.modeOfPayment,
    this.dateOfJoining,
    this.emi,
    this.numberOfEmi,
    this.emiStartDate,
    this.offerDestination,
    this.offerStayDays,
    this.offerStayNights,
    this.offerNoOfAdults,
    this.offerNoOfChild,
    this.offerOnlyAccomodation,
    this.offerAccomodation,
    this.offerBreakfast,
    this.offerDinner,
    this.offerSightSeeing,
    this.offerNoOfAirtickets,
    this.airtTicketType,
    this.offerBalanceAmount,
    this.offerValidity,
    this.offerIncludeRemark,
    this.repName,
    this.managerName,
  });

  factory ApprovalData.fromJson(Map<String, dynamic> json) => ApprovalData(
    approvalNumber: json["ApprovalNumber"],
    craeteDate: json["CraeteDate"] == null ? null : DateTime.parse(json["CraeteDate"]),
    mafNumber: json["MafNumber"],
    dsaCode: json["DsaCode"],
    member1Dob: json["Member1DOB"] == null ? null : DateTime.parse(json["Member1DOB"]),
    memberName2: json["MemberName2"],
    member2Dob: json["Member2DOB"] == null ? null : DateTime.parse(json["Member2DOB"]),
    address: json["Address"],
    city: json["City"],
    mobile1: json["Mobile1"],
    mobile2: json["Mobile2"],
    pincode: json["Pincode"],
    email: json["Email"],
    apartment: json["Apartment"],
    occupancy: json["Occupancy"],
    tenure: json["Tenure"],
    season: json["Season"],
    amcAmount: json["AMC_Amount"],
    amcDueDate: json["AMC_DueDate"] == null ? null : DateTime.parse(json["AMC_DueDate"]),
    preAmount: json["PreAmount"],
    dateOfHolding: json["DateOfHolding"],
    rciEnrollment: json["RCIEnrollment"],
    purchasePrice: json["PurchasePrice"],
    adminCharges: json["AdminCharges"],
    totalCost: json["TotalCost"],
    initialPayment: json["InitialPayment"],
    balance: json["Balance"],
    modeOfPayment: json["ModeOfPayment"],
    dateOfJoining: json["DateOfJoining"] == null ? null : DateTime.parse(json["DateOfJoining"]),
    emi: json["EMI"],
    numberOfEmi: json["NumberOfEMI"],
    emiStartDate: json["EMIStartDate"] == null ? null : DateTime.parse(json["EMIStartDate"]),
    offerDestination: json["Offer_Destination"],
    offerStayDays: json["Offer_StayDays"],
    offerStayNights: json["Offer_StayNights"],
    offerNoOfAdults: json["Offer_NoOfAdults"],
    offerNoOfChild: json["Offer_NoOfChild"],
    offerOnlyAccomodation: json["Offer_OnlyAccomodation"],
    offerAccomodation: json["Offer_Accomodation"],
    offerBreakfast: json["Offer_Breakfast"],
    offerDinner: json["Offer_Dinner"],
    offerSightSeeing: json["Offer_SightSeeing"],
    offerNoOfAirtickets: json["Offer_NoOfAirtickets"],
    airtTicketType: json["AirtTicketType"],
    offerBalanceAmount: json["Offer_BalanceAmount"],
    offerValidity: json["Offer_Validity"],
    offerIncludeRemark: json["Offer_IncludeRemark"],
    repName: json["RepName"],
    managerName: json["ManagerName"],
  );

  Map<String, dynamic> toJson() => {
    "ApprovalNumber": approvalNumber,
    "CraeteDate": craeteDate?.toIso8601String(),
    "MafNumber": mafNumber,
    "DsaCode": dsaCode,
    "Member1DOB": member1Dob?.toIso8601String(),
    "MemberName2": memberName2,
    "Member2DOB": member2Dob?.toIso8601String(),
    "Address": address,
    "City": city,
    "Mobile1": mobile1,
    "Mobile2": mobile2,
    "Pincode": pincode,
    "Email": email,
    "Apartment": apartment,
    "Occupancy": occupancy,
    "Tenure": tenure,
    "Season": season,
    "AMC_Amount": amcAmount,
    "AMC_DueDate": amcDueDate?.toIso8601String(),
    "PreAmount": preAmount,
    "DateOfHolding": dateOfHolding,
    "RCIEnrollment": rciEnrollment,
    "PurchasePrice": purchasePrice,
    "AdminCharges": adminCharges,
    "TotalCost": totalCost,
    "InitialPayment": initialPayment,
    "Balance": balance,
    "ModeOfPayment": modeOfPayment,
    "DateOfJoining": dateOfJoining?.toIso8601String(),
    "EMI": emi,
    "NumberOfEMI": numberOfEmi,
    "EMIStartDate": emiStartDate?.toIso8601String(),
    "Offer_Destination": offerDestination,
    "Offer_StayDays": offerStayDays,
    "Offer_StayNights": offerStayNights,
    "Offer_NoOfAdults": offerNoOfAdults,
    "Offer_NoOfChild": offerNoOfChild,
    "Offer_OnlyAccomodation": offerOnlyAccomodation,
    "Offer_Accomodation": offerAccomodation,
    "Offer_Breakfast": offerBreakfast,
    "Offer_Dinner": offerDinner,
    "Offer_SightSeeing": offerSightSeeing,
    "Offer_NoOfAirtickets": offerNoOfAirtickets,
    "AirtTicketType": airtTicketType,
    "Offer_BalanceAmount": offerBalanceAmount,
    "Offer_Validity": offerValidity,
    "Offer_IncludeRemark": offerIncludeRemark,
    "RepName": repName,
    "ManagerName": managerName,
  };
}
