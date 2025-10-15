import '../../domain/entities/user.dart';

// Data Model - Handles JSON serialization
class UserModel extends User {
  UserModel({
    required super.firstName,
    required super.lastName,
    required super.age,
    required super.city,
    required super.country,
    required super.pictureUrl,
    required super.id,
    super.isLiked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['name']['first'] as String,
      lastName: json['name']['last'] as String,
      age: json['dob']['age'] as int,
      city: json['location']['city'] as String,
      country: json['location']['country'] as String,
      pictureUrl: json['picture']['large'] as String,
      id: json['login']['uuid'] as String,
      isLiked: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': {
        'first': firstName,
        'last': lastName,
      },
      'dob': {
        'age': age,
      },
      'location': {
        'city': city,
        'country': country,
      },
      'picture': {
        'large': pictureUrl,
      },
      'login': {
        'uuid': id,
      },
    };
  }
}