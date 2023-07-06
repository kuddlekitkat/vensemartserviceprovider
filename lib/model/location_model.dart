class UserLocationModel {
  int? status;
  String? message;
  Data? data;

 UserLocationModel({this.status, this.message, this.data});

  UserLocationModel.fromJson(Map<String, dynamic> json) {
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

  String? location;
  String? locationLat;
  String? locationLong;
  String? state;



  Data({this.locationLat, this.location, this.locationLong});

  Data.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
    state = json['state'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['location_lat'] = locationLat;
    data['location_long'] = locationLong;
    data['state'] = state;

    return data;
  }
}