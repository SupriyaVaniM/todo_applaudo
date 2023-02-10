import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_applaudo/core/models/auth_token.dart';
import 'package:todo_applaudo/core/models/todo_item.dart';
import 'package:todo_applaudo/core/utils/constants.dart';
import 'package:todo_applaudo/core/utils/logging.dart';



class DioClient {
  final Dio _authDio = Dio(
    BaseOptions(
      baseUrl: 'https://identitytoolkit.googleapis.com/v1',
      connectTimeout: 50000,
      receiveTimeout: 30000,
    ),
  )..interceptors.add(Logging());

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://firestore.googleapis.com/v1',
        connectTimeout: 50000,
        receiveTimeout: 30000,
        headers: {'Authorization': 'Bearer ${Constants.BEARER_TOKEN}'}),
  )..interceptors.add(Logging());

  Future<AuthToken?> refreshToken() async {
    AuthToken? user;

    try {
      const Map<String, Object> credentials = {
        "email": "test@test.com",
        "password": "password",
        "returnSecureToken": true
      };
      Response userData = await _authDio.post(
          '/accounts:signInWithPassword?key=${Constants.API_KEY}',
          data: json.encode(credentials));

      debugPrint('User Info: ${userData.data}');

      user = AuthToken.fromJson(userData.data);
      Constants.BEARER_TOKEN = user.idToken;
    } on DioError catch (e) {
      parseDioError(e);
    }

    return user;
  }

  Future<List<TodoItem>?> getTasks() async {
    List<TodoItem>? users;

    try {
      Response userData = await _dio.get(
          '/projects/applaudo-todo-app/databases/(default)/documents/tasks?key=${Constants.API_KEY}');

      debugPrint('Task Info: ${userData.data}');

      users = TodoItemResponse.fromJson(userData.data).documents;
    } on DioError catch (e) {
      parseDioError(e);
    }
    return users;
  }

  Future<TodoItem?> updateTodoItem({required bool status}) async {
    TodoItem? updatedItem;

    Map<String, Object> payload = {
      "fields": {
        "date": {"integerValue": "1664072803"},
        "categoryId": {"stringValue": "DDQeCPpZATcLfV9U3I0v"},
        "name": {"stringValue": "update task!"},
        "isCompleted": {"booleanValue": status}
      }
    };

    try {
      Response updateTodoResponse = await _dio.patch(
          '/projects/applaudo-todo-app/databases/(default)/documents/tasks?key=${Constants.API_KEY}',
          data: payload);

      debugPrint('Task Info: ${updateTodoResponse.data}');

      updatedItem = TodoItem.fromJson(updateTodoResponse.data);
    } on DioError catch (e) {
      parseDioError(e);
    }

    return updatedItem;
  }

  Future<TodoItem?> createTodo({required TodoItem userInfo}) async {
    TodoItem? retrievedUser;

    try {
      Response response = await _dio.post(
        '/users',
        data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = TodoItem.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }

  Future<TodoItem?> updateTodo({
    required TodoItem userInfo,
    required String id,
  }) async {
    TodoItem? updatedUser;

    try {
      Response response = await _dio.put(
        '/users/$id',
        data: userInfo.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = TodoItem.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }

    return updatedUser;
  }

  void parseDioError(DioError e) {
    if (e.response != null) {
      debugPrint('Dio error!');
      debugPrint('STATUS: ${e.response?.statusCode}');
      debugPrint('DATA: ${e.response?.data}');
      debugPrint('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      debugPrint('Error sending request!');
      debugPrint(e.message);
    }
  }
}
