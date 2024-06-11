// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';

part 'payment_method.g.dart';

@HiveType(typeId: HiveId.paymentMethod)
class PaymentMethod extends HiveObject {
  @HiveField(0)
  final String nameOnCard;
  @HiveField(1)
  final String cardNumber;
  @HiveField(2)
  final String expMonth;
  @HiveField(3)
  final String expDate;
  @HiveField(4)
  final String cvv;
  @HiveField(5)
  final int id;

  PaymentMethod({
    required this.nameOnCard,
    required this.cardNumber,
    required this.expMonth,
    required this.expDate,
    required this.cvv,
    required this.id,
  });

  factory PaymentMethod.empty() => PaymentMethod(
        nameOnCard: '',
        cardNumber: '',
        expMonth: '',
        expDate: '',
        cvv: '',
        id: 0,
      );

  PaymentMethod copyWith({
    String? nameOnCard,
    String? cardNumber,
    String? expMonth,
    String? expDate,
    String? cvv,
    int? id,
  }) {
    return PaymentMethod(
      nameOnCard: nameOnCard ?? this.nameOnCard,
      cardNumber: cardNumber ?? this.cardNumber,
      expMonth: expMonth ?? this.expMonth,
      expDate: expDate ?? this.expDate,
      cvv: cvv ?? this.cvv,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameOnCard': nameOnCard,
      'cardNumber': cardNumber,
      'expMonth': expMonth,
      'expDate': expDate,
      'cvv': cvv,
      'id': id,
    };
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      nameOnCard: map['nameOnCard'] as String,
      cardNumber: map['cardNumber'] as String,
      expMonth: map['expMonth'] as String,
      expDate: map['expDate'] as String,
      cvv: map['cvv'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethod.fromJson(String source) =>
      PaymentMethod.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentMethod(nameOnCard: $nameOnCard, cardNumber: $cardNumber, expMonth: $expMonth, expDate: $expDate, cvv: $cvv, id: $id)';
  }

  @override
  bool operator ==(covariant PaymentMethod other) {
    if (identical(this, other)) return true;

    return other.nameOnCard == nameOnCard &&
        other.cardNumber == cardNumber &&
        other.expMonth == expMonth &&
        other.expDate == expDate &&
        other.cvv == cvv &&
        other.id == id;
  }

  @override
  int get hashCode {
    return nameOnCard.hashCode ^
        cardNumber.hashCode ^
        expMonth.hashCode ^
        expDate.hashCode ^
        cvv.hashCode ^
        id.hashCode;
  }
}
