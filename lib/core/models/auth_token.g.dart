// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      kind: json['kind'] as String,
      localId: json['localId'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      idToken: json['idToken'] as String,
      registered: json['registered'] as bool,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as String,
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'kind': instance.kind,
      'localId': instance.localId,
      'email': instance.email,
      'displayName': instance.displayName,
      'idToken': instance.idToken,
      'registered': instance.registered,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };
