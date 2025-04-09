// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ConversionEntityAdapter extends TypeAdapter<ConversionEntity> {
  @override
  final int typeId = 0;

  @override
  ConversionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversionEntity(
      url: fields[0] as String,
      longitude: fields[1] as String,
      latitude: fields[2] as String,
      mapImagePath: fields[4] as String?,
      addressLine1: fields[5] as String?,
      addressLine2: fields[6] as String?,
      formattedAddress: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConversionEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.mapImagePath)
      ..writeByte(5)
      ..write(obj.addressLine1)
      ..writeByte(6)
      ..write(obj.addressLine2)
      ..writeByte(7)
      ..write(obj.formattedAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
