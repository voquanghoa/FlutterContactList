class Contact {
  var id = 0;
  var email = "";
  var firstName = "";
  var lastName = "";
  var avatar = "";

  Contact(this.id, this.email, this.firstName, this.lastName);

  Contact.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        avatar = json["avatar"];
}

class ContactData {
  var page = 0;
  var perPage = 0;
  var total = 0;
  var totalPages = 0;
  var data = [];

  ContactData.fromJson(Map<String, dynamic> json)
      : page = json["page"],
        perPage = json["per_page"],
        total = json["total"],
        totalPages = json["total_pages"],
        data = (json["data"] as List).map((f) => Contact.fromJson(f)).toList();
}
