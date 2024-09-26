// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_tokens_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginTokensModelAdapter extends TypeAdapter<LoginTokensModel> {
  @override
  final int typeId = 4;

  @override
  LoginTokensModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginTokensModel(
      auth: fields[0] as LoginTokenModel,
      refresh: fields[1] as LoginTokenModel,
    );
  }

  @override
  void write(BinaryWriter writer, LoginTokensModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.auth)
      ..writeByte(1)
      ..write(obj.refresh);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginTokensModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokensModel _$LoginTokensModelFromJson(Map<String, dynamic> json) =>
    LoginTokensModel(
      auth: LoginTokenModel.fromJson(json['auth'] as String),
      refresh: LoginTokenModel.fromJson(json['refresh'] as String),
    );

Map<String, dynamic> _$LoginTokensModelToJson(LoginTokensModel instance) =>
    <String, dynamic>{
      'auth': instance.auth,
      'refresh': instance.refresh,
    };
