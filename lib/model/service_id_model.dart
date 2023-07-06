class ServiceIdModel {
  int? status;
  String? message;
  Data? data;

  ServiceIdModel({this.status, this.message, this.data});

  ServiceIdModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  dynamic id;
  dynamic phone;
  String? serviceType;
  String? locationLat;
  String? locationLong;
  String? profile;
  String? categoryName;
  String? categoryIcon;
  String? location;
  String? serviceTypePrice;
  dynamic serviceProviderImage;
  dynamic serviceProviderRating;

  Data(
      {
        this.name,
        this.id,
        this.phone,
        this.serviceType,
        this.locationLat,
        this.locationLong,
        this.profile,
        this.categoryName,
        this.categoryIcon,
        this.location,
        this.serviceTypePrice,
        this.serviceProviderImage,
        this.serviceProviderRating,

      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    serviceType = json["service_type"];
    locationLat =  json["location_lat"];
    locationLong =  json["location_long"];
    profile =  json["profile"];
    categoryName =  json["category_name"];
    categoryIcon =  json["category_icon"];
    location =  json["location"];
    serviceTypePrice =  json["service_type_price"];
    serviceProviderImage =  json["service_provider_image"];
    serviceProviderRating =  json["service_provider_rating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['id'] = id;
    data['service_type'] =  serviceType;
    data['location_lat'] =  locationLat;
    data['location_long'] = locationLong;
    data['profile'] = profile;
    data['category_name'] =  categoryName;
    data['category_icon'] =  categoryIcon;
    data['location'] =  location;
    data['service_type_price'] =  serviceTypePrice;
    data['service_provider_image'] =  serviceProviderImage;
    data['service_provider_rating'] =  serviceProviderRating;

    return data;


  }
}
