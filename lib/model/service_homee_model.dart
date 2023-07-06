class ServiceHomeeModel {

  Entity? entity;

  ServiceHomeeModel({ this.entity});

  ServiceHomeeModel.fromJson(Map<String, dynamic> json) {

    entity = json['entity'] != null ? Entity.fromJson(json['entity']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> entity = <String, dynamic>{};

    if (this.entity != null) {
      entity['entity'] = this.entity!.toJson();
    }
    return entity;
  }
}

class Entity {

  List<dynamic>? requests;

  Entity(
      {
        this.requests});

  Entity.fromJson(Map<String, dynamic> json) {

    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> entity = <String, dynamic>{};

    if (requests != null) {
      entity['requests'] =
          requests!.map((v) => v).toList();
    }
    return entity;
  }
}

class Requests {
  dynamic id;
  String? bookingId;
  String? userId;


  Requests({
    this.id,
    this.bookingId,
    this.userId,

  });

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json["booking_id"];
    userId = json["user_id"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> entity = <String, dynamic>{};
    entity['id'] = id;
    entity['booking_id'] = bookingId;
    entity['user_id'] = userId;
    return entity;
  }
}