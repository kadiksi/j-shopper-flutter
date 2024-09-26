// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginTokenModelAdapter extends TypeAdapter<LoginTokenModel> {
  @override
  final int typeId = 3;

  @override
  LoginTokenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginTokenModel(
      token: fields[0] as String,
      issued: fields[1] as String,
      expired: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginTokenModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.issued)
      ..writeByte(2)
      ..write(obj.expired);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginTokenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokenModel _$LoginTokenModelFromJson(Map<String, dynamic> json) =>
    LoginTokenModel(
      token: json['token'] as String,
      issued: json['issued'] as String,
      expired: json['expired'] as String,
    );

Map<String, dynamic> _$LoginTokenModelToJson(LoginTokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'issued': instance.issued,
      'expired': instance.expired,
    };
