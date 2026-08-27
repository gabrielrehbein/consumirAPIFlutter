import 'geo.dart';


class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Geo geo;

  Address({
    required this.street,
    required this.city,
    required this.suite,
    required this.zipCode,
    required this.geo,
  });
}