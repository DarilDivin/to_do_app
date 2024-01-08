// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Todo> todoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  String? id;
  String? description;
  String? title;
  dynamic beginedAt;
  dynamic finishedAt;
  DateTime? deadlineAt;
  String? priority;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Todo({
    this.id,
    this.description,
    this.title,
    this.beginedAt,
    this.finishedAt,
    this.deadlineAt,
    this.priority,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    description: json["description"],
    title: json["title"],
    beginedAt: json["begined_at"],
    finishedAt: json["finished_at"],
    deadlineAt: json["deadline_at"] == null ? null : DateTime.parse(json["deadline_at"]),
    priority: json["priority"],
    userId: json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "title": title,
    "begined_at": beginedAt,
    "finished_at": finishedAt,
    "deadline_at": deadlineAt?.toIso8601String(),
    "priority": priority,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
