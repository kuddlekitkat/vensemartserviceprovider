class GetServiceProviderBank {
  int? status;
  String? message;
  List<Data>? data;

  GetServiceProviderBank({this.status, this.message, this.data});

  GetServiceProviderBank.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  String? bookingId;
  String? userId;
  String? serviceProId;
  String? serviceType;


  Data({
    this.id,
    this.bookingId,
    this.userId,
    this.serviceProId,
    this.serviceType,

  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json["booking_id"];
    userId = json["user_id"];
    serviceProId = json["service_pro_id"];
    serviceType =  json["service_type"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['user_id'] = userId;
    data['service_pro_id'] = serviceProId;
    data['service_type'] = serviceType;
    return data;
  }
}