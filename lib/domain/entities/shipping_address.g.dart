// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShippingAddressAdapter extends TypeAdapter<ShippingAddress> {
  @override
  final int typeId = 3;

  @override
  ShippingAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShippingAddress(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      address: fields[2] as String,
      city: fields[3] as String,
      state: fields[4] as String,
      zipCode: fields[5] as String,
      phone: fields[6] as String,
      id: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ShippingAddress obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.zipCode)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
