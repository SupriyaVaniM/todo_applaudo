// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    required this.collection,
  });

  Collection collection;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        collection: Collection.fromJson(json["collection"]),
      );

  Map<String, dynamic> toJson() => {
        "collection": collection.toJson(),
      };
}

class Collection {
  Collection({
    required this.info,
    required this.item,
    required this.auth,
    required this.event,
    required this.variable,
  });

  Info info;
  List<Item> item;
  CollectionAuth auth;
  List<Event> event;
  List<Variable> variable;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        info: Info.fromJson(json["info"]),
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
        auth: CollectionAuth.fromJson(json["auth"]),
        event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
        variable: List<Variable>.from(
            json["variable"].map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "auth": auth.toJson(),
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
        "variable": List<dynamic>.from(variable.map((x) => x.toJson())),
      };
}

class CollectionAuth {
  CollectionAuth({
    required this.type,
    required this.bearer,
  });

  String type;
  List<Variable> bearer;

  factory CollectionAuth.fromJson(Map<String, dynamic> json) => CollectionAuth(
        type: json["type"],
        bearer: List<Variable>.from(
            json["bearer"].map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "bearer": List<dynamic>.from(bearer.map((x) => x.toJson())),
      };
}

class Variable {
  Variable({
    required this.key,
    required this.value,
    this.type,
    this.disabled,
    this.id,
  });

  String key;
  String value;
  String? type;
  bool? disabled;
  String? id;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        key: json["key"],
        value: json["value"],
        type: json["type"],
        disabled: json["disabled"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": type,
        "disabled": disabled,
        "id": id,
      };
}

class Event {
  Event({
    required this.listen,
    required this.script,
  });

  String listen;
  Script script;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        listen: json["listen"],
        script: Script.fromJson(json["script"]),
      );

  Map<String, dynamic> toJson() => {
        "listen": listen,
        "script": script.toJson(),
      };
}

class Script {
  Script({
    required this.id,
    required this.type,
    required this.exec,
  });

  String id;
  String type;
  List<String> exec;

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        id: json["id"],
        type: json["type"],
        exec: List<String>.from(json["exec"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "exec": List<dynamic>.from(exec.map((x) => x)),
      };
}

class Info {
  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
    required this.updatedAt,
  });

  String postmanId;
  String name;
  String schema;
  DateTime updatedAt;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Item {
  Item({
    required this.name,
    this.event,
    required this.id,
    required this.protocolProfileBehavior,
    required this.request,
    required this.response,
  });

  String name;
  List<Event>? event;
  String id;
  ProtocolProfileBehavior protocolProfileBehavior;
  Request request;
  List<Response> response;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        event: json["event"] == null
            ? []
            : List<Event>.from(json["event"]!.map((x) => Event.fromJson(x))),
        id: json["id"],
        protocolProfileBehavior:
            ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
        request: Request.fromJson(json["request"]),
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "event": event == null
            ? []
            : List<dynamic>.from(event!.map((x) => x.toJson())),
        "id": id,
        "protocolProfileBehavior": protocolProfileBehavior.toJson(),
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class ProtocolProfileBehavior {
  ProtocolProfileBehavior({
    required this.disableBodyPruning,
  });

  bool disableBodyPruning;

  factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) =>
      ProtocolProfileBehavior(
        disableBodyPruning: json["disableBodyPruning"],
      );

  Map<String, dynamic> toJson() => {
        "disableBodyPruning": disableBodyPruning,
      };
}

class Request {
  Request({
    this.auth,
    required this.method,
    required this.header,
    this.body,
    required this.url,
  });

  RequestAuth? auth;
  String method;
  List<dynamic> header;
  Body? body;
  Url url;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        auth: json["auth"] == null ? null : RequestAuth.fromJson(json["auth"]),
        method: json["method"],
        header: List<dynamic>.from(json["header"].map((x) => x)),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        url: Url.fromJson(json["url"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth?.toJson(),
        "method": method,
        "header": List<dynamic>.from(header.map((x) => x)),
        "body": body?.toJson(),
        "url": url.toJson(),
      };
}

class RequestAuth {
  RequestAuth({
    required this.type,
  });

  String type;

  factory RequestAuth.fromJson(Map<String, dynamic> json) => RequestAuth(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class Body {
  Body({
    required this.mode,
    required this.raw,
    required this.options,
  });

  String mode;
  String raw;
  Options options;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: json["mode"],
        raw: json["raw"],
        options: Options.fromJson(json["options"]),
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "raw": raw,
        "options": options.toJson(),
      };
}

class Options {
  Options({
    required this.raw,
  });

  Raw raw;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        raw: Raw.fromJson(json["raw"]),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw.toJson(),
      };
}

class Raw {
  Raw({
    required this.language,
  });

  String language;

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}

class Url {
  Url({
    required this.raw,
    this.protocol,
    required this.host,
    required this.path,
    required this.query,
  });

  String raw;
  String? protocol;
  List<Host> host;
  List<String> path;
  List<Variable> query;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json["raw"],
        protocol: json["protocol"],
        host: List<Host>.from(json["host"].map((x) => hostValues.map[x]!)),
        path: List<String>.from(json["path"].map((x) => x)),
        query:
            List<Variable>.from(json["query"].map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "protocol": protocol,
        "host": List<dynamic>.from(host.map((x) => hostValues.reverse[x])),
        "path": List<dynamic>.from(path.map((x) => x)),
        "query": List<dynamic>.from(query.map((x) => x.toJson())),
      };
}

enum Host { IDENTITYTOOLKIT, GOOGLEAPIS, COM, BASE_URL, FIRESTORE }

final hostValues = EnumValues({
  "{{base_url}}": Host.BASE_URL,
  "com": Host.COM,
  "firestore": Host.FIRESTORE,
  "googleapis": Host.GOOGLEAPIS,
  "identitytoolkit": Host.IDENTITYTOOLKIT
});

class Response {
  Response({
    required this.id,
    required this.name,
    required this.originalRequest,
    required this.status,
    required this.code,
    required this.postmanPreviewlanguage,
    required this.header,
    required this.cookie,
    this.responseTime,
    required this.body,
  });

  String id;
  String name;
  OriginalRequest originalRequest;
  String status;
  int code;
  String postmanPreviewlanguage;
  List<Header> header;
  List<dynamic> cookie;
  dynamic responseTime;
  String body;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        name: json["name"],
        originalRequest: OriginalRequest.fromJson(json["originalRequest"]),
        status: json["status"],
        code: json["code"],
        postmanPreviewlanguage: json["_postman_previewlanguage"],
        header:
            List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        cookie: List<dynamic>.from(json["cookie"].map((x) => x)),
        responseTime: json["responseTime"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "originalRequest": originalRequest.toJson(),
        "status": status,
        "code": code,
        "_postman_previewlanguage": postmanPreviewlanguage,
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "cookie": List<dynamic>.from(cookie.map((x) => x)),
        "responseTime": responseTime,
        "body": body,
      };
}

class Header {
  Header({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class OriginalRequest {
  OriginalRequest({
    required this.method,
    required this.header,
    this.body,
    required this.url,
  });

  String method;
  List<dynamic> header;
  Body? body;
  Url url;

  factory OriginalRequest.fromJson(Map<String, dynamic> json) =>
      OriginalRequest(
        method: json["method"],
        header: List<dynamic>.from(json["header"].map((x) => x)),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        url: Url.fromJson(json["url"]),
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "header": List<dynamic>.from(header.map((x) => x)),
        "body": body?.toJson(),
        "url": url.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
