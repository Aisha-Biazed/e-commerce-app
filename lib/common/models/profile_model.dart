class ProfileModel {
  ProfileModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.phone,
  });

  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final String? phone;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      phone: json["phone"],
    );
  }
}

// class ProfileModel {
//   ProfileModel({
//     required this.address,
//     required this.id,
//     required this.email,
//     required this.username,
//     required this.password,
//     required this.phone,
//   });
//
//   final Address? address;
//   final int? id;
//   final String? email;
//   final String? username;
//   final String? password;
//   final String? phone;
//
//   factory ProfileModel.fromJson(Map<String, dynamic> json){
//     return ProfileModel(
//       address: json["address"] == null ? null : Address.fromJson(json["address"]),
//       id: json["id"],
//       email: json["email"],
//       username: json["username"],
//       password: json["password"],
//       phone: json["phone"],
//     );
//   }
//
// }
//
// class Address {
//   Address({
//     required this.city,
//     required this.street,
//   });
//
//   final String? city;
//   final String? street;
//
//   factory Address.fromJson(Map<String, dynamic> json){
//     return Address(
//       city: json["city"],
//       street: json["street"],
//     );
//   }
//
// }
