class UserProfile {
  Name name;
  DateOfBirth dob;
  String gender;
  String email;
  String phone;
  String picture;

  UserProfile({
    required this.name,
    required this.dob,
    required this.gender,
    required this.email,
    required this.phone,
    required this.picture,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: Name.fromJson(json['name']),
      dob: DateOfBirth.fromJson(json['dob']),
      gender: json['gender'],

      email: json['email'],
      phone: json['phone'],
      picture: json['picture']['large'],
    );
  }
}

class Name {
  String title;
  String first;
  String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(title: json['title'], first: json['first'], last: json['last']);
  }
}

class DateOfBirth {
  String date;
  int age;

  DateOfBirth({required this.date, required this.age});

  factory DateOfBirth.fromJson(Map<String, dynamic> json) {
    return DateOfBirth(date: json['date'], age: json['age']);
  }
}
