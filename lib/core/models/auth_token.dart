import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken {
  String kind;
  String localId;
  String email;
  String displayName;
  String idToken;
  bool registered;
  String refreshToken;
  String expiresIn;

  AuthToken(
      {required this.kind,
      required this.localId,
      required this.email,
      required this.displayName,
      required this.idToken,
      required this.registered,
      required this.refreshToken,
      required this.expiresIn});

  factory AuthToken.fromJson(Map<String, dynamic> data) =>
      _$AuthTokenFromJson(data);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
