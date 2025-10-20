class User {
  final String name;
  final String imageUrl;
  final int age;
  final String city;
  bool isLiked;

  User({
    required this.name,
    required this.imageUrl,
    required this.age,
    required this.city,
    this.isLiked = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name']['first'],
      imageUrl: json['picture']['large'],
      age: json['dob']['age'],
      city: json['location']['city'],
    );
  }
}
