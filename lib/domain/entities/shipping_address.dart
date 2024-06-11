// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';

part 'shipping_address.g.dart';

@HiveType(typeId: HiveId.shippingAddress)
class ShippingAddress extends HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String address;
  @HiveField(3)
  final String city;
  @HiveField(4)
  final String state;
  @HiveField(5)
  final String zipCode;
  @HiveField(6)
  final String phone;
  @HiveField(7)
  final int id;

  ShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.phone,
    required this.id,
  });

  factory ShippingAddress.empty() => ShippingAddress(
      firstName: '',
      lastName: '',
      address: '',
      city: '',
      state: '',
      zipCode: '',
      phone: '',
      id: 0);

  ShippingAddress copyWith({
    String? firstName,
    String? lastName,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? phone,
    int? id,
  }) {
    return ShippingAddress(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      phone: phone ?? this.phone,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'phone': phone,
      'id': id,
    };
  }

  factory ShippingAddress.fromMap(Map<String, dynamic> map) {
    return ShippingAddress(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zipCode: map['zipCode'] as String,
      phone: map['phone'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingAddress.fromJson(String source) =>
      ShippingAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShippingAddress(firstName: $firstName, lastName: $lastName, address: $address, city: $city, state: $state, zipCode: $zipCode, phone: $phone, id: $id)';
  }

  @override
  bool operator ==(covariant ShippingAddress other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.address == address &&
        other.city == city &&
        other.state == state &&
        other.zipCode == zipCode &&
        other.phone == phone &&
        other.id == id;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        zipCode.hashCode ^
        phone.hashCode ^
        id.hashCode;
  }
}
