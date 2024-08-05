class Banner {
  int status;
  String message;
  List<Datum> data;

  Banner({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      status: json['Status'],
      message: json['Message'],
      data: List<Datum>.from(json['Data'].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  int id;
  String bannerPath;

  Datum({
    required this.id,
    required this.bannerPath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['Id'],
      bannerPath: json['BannerPath'],
    );
  }
}
