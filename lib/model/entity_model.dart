class EntityModel {

  Selfie? entity;

  EntityModel({this.entity});

  EntityModel.fromJson(Map<String, dynamic> json) {

    entity = json['entity'] != null ? Selfie.fromJson(json['entity']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.entity != null) {
      data['entity'] = this.entity!.toJson();
    }
    return data;
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


      });

  Selfie.fromJson(Map<String, dynamic> json) {

    confidenceValue = json['id'];
    match = json['name'];
    photoIdImageBlurry = json['phone'];
    selfieImageBlurry = json["service_type"];
    selfieGlare =  json["location_lat"];
    photoIdGlare =  json["location_long"];
    ageRange =  json["profile"];
    sunglasses =  json["category_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidence_value'] = confidenceValue;
    data['match'] = match;
    data['photo_image_blurry'] = photoIdImageBlurry;
    data['selfie_image_blurry'] =  selfieImageBlurry;
    data['selfie_glare'] =  selfieGlare;
    data['photoId_glare'] = photoIdGlare;
    data['age_range'] =ageRange;
    data['sunglasses'] =  sunglasses;

    return data;


  }
}
