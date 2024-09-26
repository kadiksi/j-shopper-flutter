// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginDataModelAdapter extends TypeAdapter<LoginDataModel> {
  @override
  final int typeId = 5;

  @override
  LoginDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginDataModel(
      tokens: fields[0] as LoginTokensModel,
    );
  }

  @override
  void write(BinaryWriter writer, LoginDataModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tokens);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    LoginDataModel(
      tokens: LoginTokensModel.fromJson(json['tokens'] as String),
    );

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
    };
