import 'package:cached_network_image/cached_network_image.dart';
import 'package:contacts/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactDetailWidget extends StatefulWidget {
  Contact contact;

  ContactDetailWidget(this.contact);

  @override
  State<StatefulWidget> createState() => ContactDetailState(contact);
}

class ContactDetailState extends State<ContactDetailWidget> {
  Contact contact;

  ContactDetailState(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: contact.avatar,
                placeholder: (context, url) => CircularProgressIndicator(),
              ),
              Text(contact.getFullName(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue)),
              Text(
                contact.email,
                style: TextStyle(fontSize: 14, color: Colors.cyan),
              )
            ]));
  }
}
