import 'dart:convert';
Voter welcomeFromJson(String str) => Voter.fromJson(json.decode(str));

String welcomeToJson(Voter data) => json.encode(data.toJson());

class Voter {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  Voter({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });



  factory Voter.fromJson(Map<String, dynamic> json) => Voter(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
  };
}