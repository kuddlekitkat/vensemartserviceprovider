class UpcomingRequest {
  int? status;
  String? message;
  List<Data>? data;

  UpcomingRequest({this.status, this.message, this.data});

  UpcomingRequest.fromJson(Map<String, dynamic> json) {
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
  dynamic description;
  dynamic userAddress;
  dynamic userMobile;
  dynamic userLat;
  dynamic userLong;
  String? bookingDate;
  String? bookingTime;
  String? price;
  dynamic status;
  dynamic cancelReason;
  dynamic paymentStatus;
  dynamic transactionId;
  dynamic paymentMode;
  dynamic mobileNumber;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? email;
  String? mobile;
  String? categoryName;

  Data({
    this.id,
    this.bookingId,
    this.userId,
    this.serviceProId,
    this.serviceType,
    this.description,
    this.userAddress,
    this.userMobile,
    this.userLat,
    this.userLong,
    this.bookingDate,
    this.bookingTime,
    this.price,
    this.status,
    this.cancelReason,
    this.paymentStatus,
    this.transactionId,
    this.paymentMode,
    this.mobileNumber,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.mobile,
    this.categoryName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json["booking_id"];
    userId = json["user_id"];
    serviceProId = json["service_pro_id"];
    serviceType =  json["service_type"];
    description = json["description"];
    userAddress = json["user_address"];
    userMobile = json["user_mobile"];
    userLat = json["user_lat"];
    userLong = json["user_long"];
    bookingDate = json["booking_date"];
    bookingTime = json["booking_time"];
    price = json["price"];
    status = json["status"];
    cancelReason = json["cancel_reason"];
    paymentStatus = json["payment_status"];
    transactionId = json["transaction_id"];
    paymentMode = json["payment_mode"];
    mobileNumber = json["mobile_number"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    name = json["name"];
    email = json["email"];
    mobile = json["mobile"];
    categoryName = json["category_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['user_id'] = userId;
    data['service_pro_id'] = serviceProId;
    data['service_type'] = serviceType;
    data['description'] = description;
    data['user_address'] = userAddress;
    data['user_mobile'] = userMobile;
    data['user_lat'] = userLat;
    data['user_long'] = userLong;
    data['booking_date'] = bookingDate;
    data['booking_time'] = bookingTime;
    data['price'] = price;
    data['status'] = status;
    data['cancel_reason'] = cancelReason;
    data['payment_status'] = paymentStatus;
    data['transaction_id'] = transactionId;
    data['payment_mode'] = paymentMode;
    data['mobile_number'] = mobileNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['category_name'] = categoryName;
    return data;
  }
}