class EntityDojahModel {

  Entity? entity;

  EntityDojahModel({ this.entity});

  EntityDojahModel.fromJson(Map<String, dynamic> json) {
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

  FirstName? firstName;
  LastName? lastName;
  Selfie? selfie;

  Entity({
    required this.firstName,
    required this.lastName,
    required this.selfie,

  });

  Entity.fromJson(Map<String, dynamic> json) {

    selfie = json['selfie'] != null ? Selfie.fromJson(json['selfie']) : null;

    if (json['selfie'] != null) {
      firstName = json['first_name'] != null ? FirstName.fromJson(json['first_name']) : null;
    }

    if (json['first_name'] != null) {
      lastName = json['last_name'] != null ? LastName.fromJson(json['last_name']) : null;
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> entity = <String, dynamic>{};


    if (this.selfie != null) {
      entity['selfie'] =
          selfie;
    }

    if (this.firstName != null) {
      entity['first_name'] =
          firstName;
    }

    if (this.lastName != null) {
      entity['last_name'] =
          lastName;
    }

    return entity;
  }

}


  class Selfie {

  int? confidenceValue;
  bool? match;
  bool? photoIdImageBlurry;
  bool? selfieImageBlurry;
  bool? selfieGlare;
  bool? photoIdGlare;
  String? ageRange;
  bool? sunglasses;
  String? cardType;


  Selfie(
  {
  this.confidenceValue,
  this.match,
  this.photoIdImageBlurry,
  this.selfieImageBlurry,
  this.selfieGlare,
  this.photoIdGlare,
  this.ageRange,
  this.sunglasses,
    this.cardType,

  });

  Selfie.fromJson(Map<String, dynamic> json) {

  confidenceValue = json['confidence_value'];
  match = json['match'];
  photoIdImageBlurry = json['photoId_image_blurry'];
  selfieImageBlurry = json["selfie_image_blurry"];
  selfieGlare =  json["selfie_glare"];
  photoIdGlare =  json["photoId_glare"];
  ageRange =  json["age_range"];
  sunglasses =  json["sunglasses"];
  cardType =  json["card_type"];

  }

  Map<String, dynamic> toJson() {

  final Map<String, dynamic> entity = <String, dynamic>{};
  entity['confidence_value'] = confidenceValue;
  entity['match'] = match;
  entity['photo_image_blurry'] = photoIdImageBlurry;
  entity['selfie_image_blurry'] =  selfieImageBlurry;
  entity['selfie_glare'] =  selfieGlare;
  entity['photoId_glare'] = photoIdGlare;
  entity['age_range'] =ageRange;
  entity['sunglasses'] =  sunglasses;
  entity['card_type'] =  cardType;

  return entity;


  }


}



class FirstName {

  int? confidenceValue;
  bool? match;
  dynamic firstname;


  FirstName(
      {
        this.confidenceValue,
        this.match,
        this.firstname,


      });

  FirstName.fromJson(Map<String, dynamic> json) {

    confidenceValue = json['confidence_value'];
    match = json['match'];
    firstname = json['first_name'];

  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> entity = <String, dynamic>{};
    entity['confidence_value'] = confidenceValue;
    entity['match'] = match;
    entity['first_name'] = firstname;
    return entity;

  }






}





class LastName {

  int? confidenceValue;
  bool? match;
  String? lastname;


  LastName(
      {
        this.confidenceValue,
        this.match,
        this.lastname,



      });

  LastName.fromJson(Map<String, dynamic> json) {

    confidenceValue = json['confidence_value'];
    match = json['match'];
    lastname = json['last_name'];

  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> entity = <String, dynamic>{};
    entity['confidence_value'] = confidenceValue;
    entity['match'] = match;
    entity['last_name'] = lastname;

    return entity;


  }






}
