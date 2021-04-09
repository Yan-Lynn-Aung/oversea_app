import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';

@JsonSerializable()
class Contact {
  int id;
  String name;
  String job;
  int age;
  Contact(this.name, this.job, this.age, this.id);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
