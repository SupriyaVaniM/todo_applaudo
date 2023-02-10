import 'package:json_annotation/json_annotation.dart';

part 'todo_item.g.dart';

@JsonSerializable()
class TodoItemResponse {
  List<TodoItem> documents;
  String nextPageToken;

  TodoItemResponse({
    required this.documents,
    required this.nextPageToken,
  });

  factory TodoItemResponse.fromJson(Map<String, dynamic> data) =>
      _$TodoItemResponseFromJson(data);

  Map<String, dynamic> toJson() => _$TodoItemResponseToJson(this);
}

@JsonSerializable()
class TodoItem {
  String name;
  Fields fields;
  String createTime;
  String updateTime;

  TodoItem({
    required this.name,
    required this.fields,
    required this.createTime,
    required this.updateTime,
  });

  factory TodoItem.fromJson(Map<String, dynamic> data) =>
      _$TodoItemFromJson(data);

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);
}

@JsonSerializable()
class Fields {
  Date? date;
  Id? id;
  CategoryId? categoryId;
  Name? name;
  IsCompleted isCompleted;

  Fields(
      {this.date,
      this.id,
      this.categoryId,
      this.name,
      required this.isCompleted});

  factory Fields.fromJson(Map<String, dynamic> data) => _$FieldsFromJson(data);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);
}

@JsonSerializable()
class IsCompleted {
  bool booleanValue;

  IsCompleted({required this.booleanValue});

  factory IsCompleted.fromJson(Map<String, dynamic> data) =>
      _$IsCompletedFromJson(data);

  Map<String, dynamic> toJson() => _$IsCompletedToJson(this);
}

@JsonSerializable()
class CategoryId {
  String stringValue;

  CategoryId({required this.stringValue});

  factory CategoryId.fromJson(Map<String, dynamic> data) =>
      _$CategoryIdFromJson(data);

  Map<String, dynamic> toJson() => _$CategoryIdToJson(this);
}

@JsonSerializable()
class Date {
  String? stringValue;
  String? integerValue;

  Date({this.stringValue, this.integerValue});

  factory Date.fromJson(Map<String, dynamic> data) => _$DateFromJson(data);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}

@JsonSerializable()
class Id {
  String stringValue;

  Id({required this.stringValue});

  factory Id.fromJson(Map<String, dynamic> data) => _$IdFromJson(data);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class Name {
  String stringValue;

  Name({required this.stringValue});

  factory Name.fromJson(Map<String, dynamic> data) => _$NameFromJson(data);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
