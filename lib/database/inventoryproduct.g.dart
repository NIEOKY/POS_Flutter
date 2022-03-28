// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventoryproduct.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InventoryProductAdapter extends TypeAdapter<InventoryProduct> {
  @override
  final int typeId = 1;

  @override
  InventoryProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InventoryProduct(
      name: fields[0] as String,
      price: fields[1] as double,
      quantity: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, InventoryProduct obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
