// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveProductAdapter extends TypeAdapter<HiveProduct> {
  @override
  final int typeId = 0;

  @override
  HiveProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProduct(
      id: fields[0] as String,
      quantity: fields[1] as int,
      name: fields[2] as String?,
      description: fields[3] as String?,
      price: fields[4] as String?,
      weight: fields[5] as String?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveProduct obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
