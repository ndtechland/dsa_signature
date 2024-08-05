//
// import 'package:flutter/material.dart';
// class FullDataModel {
//   String dateOfJoining;
//   String preName1;
//   String member1Name;
//   String member1DOB;
//   String member1Mobile;
//   String preName2;
//   String member2Name;
//   String member2DOB;
//   String member2Mobile;
//   String address;
//   String residenceNum;
//   String email;
//   String city;
//   String pincode;
//   // Fields from third file
//   String tenure;
//   String validity;
//   String type;
//   String season;
//   String apartment;
//   String occupancy;
//   int amcAmount;
//   String amcAmountDueDate;
//   String dsaCode;
//   String empCode;
//   int rciEnrollment;
//   // Fields from fourth file
//   int totalCost;
//   int purchasePrice;
//   int adminCharges;
//   int amcFirstYear;
//   int roundOffAmcFirstYearAmount;
//   int preAmount;
//   int initialPayment;
//   String modeOfPayment;
//   int otherCash;
//   int otherCard;
//   int otherOnline;
//   int otherCheque;
//   int balance;
//   int numberOfEMI;
//   int emi;
//   String emiStartDate;
//   String managerName;
//   String repName;
//   int offerStayNights;
//   int offerStayDays;
//   int offerNoOfAdults;
//   int offerNoOfChild;
//   String offerOnlyAccomodation;
//   String offerAccomodation;
//   String offerBreakfast;
//   String offerDinner;
//   String offerSightSeeing;
//   int offerBalanceAmount;
//   String offerValidity;
//   String offerIncludeRemark;
//   int offerNoOfAirtickets;
//   String airtTicketType;
//   String mafNo;
//   String remarks;
//
//   FullDataModel({
//     required this.dateOfJoining,
//     required this.preName1,
//     required this.member1Name,
//     required this.member1DOB,
//     required this.member1Mobile,
//     required this.preName2,
//     required this.member2Name,
//     required this.member2DOB,
//     required this.member2Mobile,
//     required this.address,
//     required this.residenceNum,
//     required this.email,
//     required this.city,
//     required this.pincode,
//     required this.tenure,
//     required this.validity,
//     required this.type,
//     required this.season,
//     required this.apartment,
//     required this.occupancy,
//     required this.amcAmount,
//     required this.amcAmountDueDate,
//     required this.dsaCode,
//     required this.empCode,
//     required this.rciEnrollment,
//     required this.totalCost,
//     required this.purchasePrice,
//     required this.adminCharges,
//     required this.amcFirstYear,
//     required this.roundOffAmcFirstYearAmount,
//     required this.preAmount,
//     required this.initialPayment,
//     required this.modeOfPayment,
//     required this.otherCash,
//     required this.otherCard,
//     required this.otherOnline,
//     required this.otherCheque,
//     required this.balance,
//     required this.numberOfEMI,
//     required this.emi,
//     required this.emiStartDate,
//     required this.managerName,
//     required this.repName,
//     required this.offerStayNights,
//     required this.offerStayDays,
//     required this.offerNoOfAdults,
//     required this.offerNoOfChild,
//     required this.offerOnlyAccomodation,
//     required this.offerAccomodation,
//     required this.offerBreakfast,
//     required this.offerDinner,
//     required this.offerSightSeeing,
//     required this.offerBalanceAmount,
//     required this.offerValidity,
//     required this.offerIncludeRemark,
//     required this.offerNoOfAirtickets,
//     required this.airtTicketType,
//     required this.mafNo,
//     required this.remarks,
//   });
//
//   factory FullDataModel.fromJson(Map<String, dynamic> json) {
//     return FullDataModel(
//       dateOfJoining: json['DateOfJoining'],
//       preName1: json['PreName'],
//       member1Name: json['MemberName1'],
//       member1DOB: json['Member1DOB'],
//       member1Mobile: json['Mobile1'],
//       preName2: json['PreName2'],
//       member2Name: json['MemberName2'],
//       member2DOB: json['Member2DOB'],
//       member2Mobile: json['Mobile2'],
//       address: json['Address'],
//       residenceNum: json['ResidenceNumber'],
//       email: json['Email'],
//       city: json['City'],
//       pincode: json['Pincode'],
//       tenure: json['Tenure'],
//       validity: json['Validity'],
//       type: json['Type'],
//       season: json['Season'],
//       apartment: json['Apartment'],
//       occupancy: json['Occupancy'],
//       amcAmount: json['AMC_Amount'],
//       amcAmountDueDate: json['AMC_DueDate'],
//       dsaCode: json['Dsa_Code'],
//       empCode: json['EmpCode'],
//       rciEnrollment: json['RCIEnrollment'],
//       totalCost: json['TotalCost'],
//       purchasePrice: json['PurchasePrice'],
//       adminCharges: json['AdminCharges'],
//       amcFirstYear: json['AmcFirstYear'],
//       roundOffAmcFirstYearAmount: json['RoundOffAmcFirstYearAmount'],
//       preAmount: json['PreAmount'],
//       initialPayment: json['InitialPayment'],
//       modeOfPayment: json['ModeOfPayment'],
//       otherCash: json['OtherCash'],
//       otherCard: json['OtherCard'],
//       otherOnline: json['OtherOnline'],
//       otherCheque: json['OtherCheque'],
//       balance: json['Balance'],
//       numberOfEMI: json['NumberOfEMI'],
//       emi: json['EMI'],
//       emiStartDate: json['EMIStartDate'],
//       managerName: json['ManagerName'],
//       repName: json['RepName'],
//       offerStayNights: json['Offer_StayNights'],
//       remarks: json['remarks'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'guestId': guestId,
//       'member1Name': member1Name,
//       'member1DOB': member1DOB,
//       'member1Mobile': member1Mobile,
//       'member2Name': member2Name,
//       'member2DOB': member2DOB,
//       'address': address,
//       'city': city,
//       'state': state,
//       'pincode': pincode,
//       'tenure': tenure,
//       'rciEnrollment': rciEnrollment,
//       'totalCost': totalCost,
//       'remarks': remarks,
//     };
//   }
// }
