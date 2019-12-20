import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts/model/model.dart';

import 'avatar_widget.dart';

class ContactWidget extends StatefulWidget{

  Contact contact;

  ContactWidget(this.contact);

  @override
  State<StatefulWidget> createState() => _ContactWidgetState(contact);
}

class _ContactWidgetState extends State<ContactWidget>{

  Contact contact;

  _ContactWidgetState(this.contact);

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