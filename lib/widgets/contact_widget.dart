import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/model/model.dart';

import 'avatar_widget.dart';

class ContactWidget extends StatefulWidget{

  var contact = Contact(0, "", "", "");

  ContactWidget(this.contact);

  @override
  State<StatefulWidget> createState() => ContactWidgetState(contact);
}

class ContactWidgetState extends State<ContactWidget>{

  var contact = Contact(0, "", "", "");

  ContactWidgetState(this.contact);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        leading: AvatarWidget(contact.avatar),
        title: Text(contact.getFullName()),
        subtitle: Text(contact.email),
      ),
    );
  }

}