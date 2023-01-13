class AnimalModel {
  Animal? animal;
  Biometry? biometry;
  String? breed;

  AnimalModel({this.animal, this.biometry, this.breed});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    animal =
        json['animal'] != null ? new Animal.fromJson(json['animal']) : null;
    biometry = json['biometry'] != null
        ? new Biometry.fromJson(json['biometry'])
        : null;
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animal != null) {
      data['animal'] = this.animal!.toJson();
    }
    if (this.biometry != null) {
      data['biometry'] = this.biometry!.toJson();
    }
    data['breed'] = this.breed;
    return data;
  }
}

class Animal {
  String? name;
  String? sex;
  String? isCastrated;
  String? activityLevel;

  Animal({this.name, this.sex, this.isCastrated, this.activityLevel});

  Animal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sex = json['sex'];
    isCastrated = json['is_castrated'];
    activityLevel = json['activity_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['is_castrated'] = this.isCastrated;
    data['activity_level'] = this.activityLevel;
    return data;
  }
}

class Biometry {
  String? weight;
  String? height;

  Biometry({this.weight, this.height});

  Biometry.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    data['height'] = this.height;
    return data;
  }
}
