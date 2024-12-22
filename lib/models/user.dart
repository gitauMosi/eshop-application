// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String status;
    String message;
    List<User> users;

    UserData({
        required this.status,
        required this.message,
        required this.users,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        status: json["status"],
        message: json["message"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String email;
    String username;
    String password;
    Name name;
    Address address;
    String phone;

    User({
        required this.id,
        required this.email,
        required this.username,
        required this.password,
        required this.name,
        required this.address,
        required this.phone,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: Name.fromJson(json["name"]),
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "address": address.toJson(),
        "phone": phone,
    };
}

class Address {
    String city;
    String street;
    String number;
    String zipcode;
    Geolocation geolocation;

    Address({
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
        required this.geolocation,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
        geolocation: Geolocation.fromJson(json["geolocation"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
        "geolocation": geolocation.toJson(),
    };
}

class Geolocation {
    double lat;
    double long;

    Geolocation({
        required this.lat,
        required this.long,
    });

    factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
    };
}

class Name {
    String firstname;
    String lastname;

    Name({
        required this.firstname,
        required this.lastname,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
    };
}
