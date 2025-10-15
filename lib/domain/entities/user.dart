// Domain Entity - Pure business object
class User {
  final String firstName;
  final String lastName;
  final int age;
  final String city;
  final String country;
  final String pictureUrl;
  final String id;
  bool isLiked;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.city,
    required this.country,
    required this.pictureUrl,
    required this.id,
    this.isLiked = false,
  });

  String get fullName => '$firstName $lastName';

  String get location => '$city, $country';
}