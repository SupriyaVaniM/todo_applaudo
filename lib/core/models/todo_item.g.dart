// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItemResponse _$TodoItemResponseFromJson(Map<String, dynamic> json) =>
    TodoItemResponse(
      documents: (json['documents'] as List<dynamic>)
          .map((e) => TodoItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String,
    );

Map<String, dynamic> _$TodoItemResponseToJson(TodoItemResponse instance) =>
    <String, dynamic>{
      'documents': instance.documents,
      'nextPageToken': instance.nextPageToken,
    };

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) => TodoItem(
      name: json['name'] as String,
      fields: Fields.fromJson(json['fields'] as Map<String, dynamic>),
      createTime: json['createTime'] as String,
      updateTime: json['updateTime'] as String,
    );

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
    };

Fields _$FieldsFromJson(Map<String, dynamic> json) => Fields(
      date: json['date'] == null
          ? null
          : Date.fromJson(json['date'] as Map<String, dynamic>),
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      categoryId: json['categoryId'] == null
          ? null
          : CategoryId.fromJson(json['categoryId'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      isCompleted:
          IsCompleted.fromJson(json['isCompleted'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'date': instance.date,
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'isCompleted': instance.isCompleted,
    };

IsCompleted _$IsCompletedFromJson(Map<String, dynamic> json) => IsCompleted(
      booleanValue: json['booleanValue'] as bool,
    );

Map<String, dynamic> _$IsCompletedToJson(IsCompleted instance) =>
    <String, dynamic>{
      'booleanValue': instance.booleanValue,
    };

CategoryId _$CategoryIdFromJson(Map<String, dynamic> json) => CategoryId(
      stringValue: json['stringValue'] as String,
    );

Map<String, dynamic> _$CategoryIdToJson(CategoryId instance) =>
    <String, dynamic>{
      'stringValue': instance.stringValue,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      stringValue: json['stringValue'] as String?,
      integerValue: json['integerValue'] as String?,
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'stringValue': instance.stringValue,
      'integerValue': instance.integerValue,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      stringValue: json['stringValue'] as String,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'stringValue': instance.stringValue,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      stringValue: json['stringValue'] as String,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'stringValue': instance.stringValue,
    };
