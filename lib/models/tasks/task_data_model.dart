import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/date_utils.dart';

part 'task_data_model.g.dart';

@JsonSerializable()
class TaskDataModel extends Equatable {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'userId')
  final int userId;

  @JsonKey(name: 'orderSource')
  final String orderSource;

  @JsonKey(name: 'createdDate')
  final DateTime createdDate;

  const TaskDataModel({
    required this.id,
    required this.userId,
    required this.orderSource,
    required this.createdDate,
  });

  String getcreatedDate() {
    return formatFromDateToddMMyyyy(createdDate);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'orderSource': orderSource,
      'createdDate': createdDate.millisecondsSinceEpoch,
    };
  }

  factory TaskDataModel.fromMap(Map<String, dynamic> map) {
    return TaskDataModel(
      id: map['id'] as String,
      userId: map['userId'] as int,
      orderSource: map['orderSource'] as String,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
    );
  }

  factory TaskDataModel.fromJson(Map<String, dynamic> json) =>
      _$TaskDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDataModelToJson(this);

  TaskDataModel copyWith({
    String? id,
    int? userId,
    String? orderSource,
    DateTime? createdDate,
  }) {
    return TaskDataModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderSource: orderSource ?? this.orderSource,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, userId, orderSource, createdDate];
}
