class ServicesProviderPlans {
  int? status;
  String? message;
  List<Data>? data;

  ServicesProviderPlans({this.status, this.message, this.data});

  ServicesProviderPlans.fromJson(Map<String, dynamic> json) {
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
  String? planType;
  String? amount;
  String? sAmount;
  String? discription;
  dynamic days;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.planType,
        this.amount,
        this.sAmount,
        this.discription,
        this.days,
        this.status,
        this.createdAt,
        this.updatedAt,
        });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planType = json["plan_type"];
    amount = json["amount"];
    sAmount =  json["s_amount"];
    discription = json["discription"];
    days =  json["days"];
    status =  json["status"];
    createdAt =  json["created_at"];
    updatedAt = json["updated_at"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan_type'] = planType;
    data['amount'] = amount;
    data['s_amount'] = sAmount;
    data['discription'] = discription;
    data['days'] = days;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
