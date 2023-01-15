class CurrentPlanDetailsModel {
  int? status;
  String? message;
  Data? data;

  CurrentPlanDetailsModel({this.status, this.message, this.data});

  CurrentPlanDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? serviceProviderId;
  String? subscriptionPlanId;
  String? amount;
  dynamic purchaseDate;
  dynamic transactionId;
  String? validity;
  dynamic status;
  String? planName;
  String? createdAt;
  String? updatedAt;






  Data(
      {this.id,
      this.serviceProviderId,
      this.subscriptionPlanId,
      this.amount,
      this.purchaseDate,
      this.transactionId,
        this.validity,
        this.status,
        this.planName,
        this.createdAt,
        this.updatedAt,

     });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    subscriptionPlanId = json['subscription_plan_id'];
    amount = json['amount'];
    purchaseDate = json['purchase_date'];
    transactionId = json['transaction_id'];
    validity = json['validity'];
    status = json['status'];
    planName = json['plan_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['s'] = serviceProviderId;
    data['name'] = subscriptionPlanId;
    data['email'] = amount;
    data['age'] = purchaseDate;
    data['gender'] = transactionId;
    data['email'] = validity;
    data['age'] = status;
    data['gender'] = planName;
    data['email'] = createdAt;
    data['age'] = updatedAt;

    return data;
  }
}