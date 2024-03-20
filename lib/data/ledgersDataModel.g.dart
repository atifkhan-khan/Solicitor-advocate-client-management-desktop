// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledgersDataModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LedgersDataAdapter extends TypeAdapter<LedgersData> {
  @override
  final int typeId = 1;

  @override
  LedgersData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LedgersData(
      formID: fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as int,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LedgersData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.formID)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LedgersDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
