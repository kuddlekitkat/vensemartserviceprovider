class ServiceHomeModel {
  int? success;
  String? message;
  Data? data;

  ServiceHomeModel({this.success, this.message, this.data});

  ServiceHomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? pendingRequests;
  int? completedRequests;
  int? cancelledRequests;
  int? totalRequests;
  List<dynamic>? requests;

  Data(
      {this.pendingRequests,
      this.completedRequests,
      this.cancelledRequests,
      this.totalRequests,
      this.requests});

  Data.fromJson(Map<String, dynamic> json) {
    pendingRequests = json['pending_requests'];
    completedRequests = json['completed_requests'];
    cancelledRequests = json['cancelled_requests'];
    totalRequests = json['total_requests'];
    if (json['requests'] != null) {
      requests = <Null>[];
      json['requests'].forEach((v) {
        requests!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pending_requests'] = pendingRequests;
    data['completed_requests'] = completedRequests;
    data['cancelled_requests'] = cancelledRequests;
    data['total_requests'] = totalRequests;
    if (requests != null) {
      data['requests'] = requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}