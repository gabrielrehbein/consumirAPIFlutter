
import 'package:project/models/address.dart';
import 'package:project/models/company.dart';
import 'package:project/models/geo.dart';


class User {
  final int id;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'address': {
        'street': address.street,
        'suite': address.suite,
        'city': address.city,
        'zipcode': address.zipCode,
        'geo': {
          'lat': address.geo.lat,
          'lng': address.geo.lng,
        },
      },
      'phone': phone,
      'website': website,
      'company': {
        'name': company.name,
        'catchPhrase': company.catchPhrase,
        'bs': company.bs,
      },
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      address: Address(
        street: json['address']['street'],
        suite: json['address']['suite'],
        city: json['address']['city'],
        zipCode: json['address']['zipcode'],
        geo: Geo(
          lat: json['address']['geo']['lat'],
          lng: json['address']['geo']['lng'],
        ),
      ),
      phone: json['phone'],
      website: json['website'],
      company: Company(
        name: json['company']['name'],
        catchPhrase: json['company']['catchPhrase'],
        bs: json['company']['bs'],
      ),
    );
  }
}