import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Contact {
  var id = 0;
  var email = "";

  @JsonKey(name: "first_name")
  var firstName = "";

  @JsonKey(name: "last_name")
  var lastName = "";
  var avatar = "";

  getFullName() => "$firstName $lastName";

  Contact(this.id, this.email, this.firstName, this.lastName);

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable()
class ContactData {
  var page = 0;

  @JsonKey(name: "per_page")
  var perPage = 0;
  var total = 0;

  @JsonKey(name: "total_pages")
  var totalPages = 0;
  List<Contact> data;

  ContactData(this.page, this.perPage, this.total, this.totalPages, this.data);

  factory ContactData.fromJson(Map<String, dynamic> json) => _$ContactDataFromJson(json);
  Map<String, dynamic> toJson() => _$ContactDataToJson(this);
}
