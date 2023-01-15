class AcceptRejectBookingModel {
  int? status;
  String? message;
  List<Data>? data;

  AcceptRejectBookingModel({this.status, this.message, this.data});

  AcceptRejectBookingModel.fromJson(Map<String, dynamic> json) {
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

  String? bookingId;
  dynamic status;

  Data({

    this.bookingId,
    this.status,


  });

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    bookingId = json["booking_id"];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['status'] = status;

    return data;
  }
}