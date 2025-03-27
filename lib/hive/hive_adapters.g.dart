// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ConversionAdapter extends TypeAdapter<Conversion> {
  @override
  final int typeId = 1;

  @override
  Conversion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Conversion(
      url: fields[0] as String,
      longitude: fields[1] as String,
      latitude: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Conversion obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.latitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
