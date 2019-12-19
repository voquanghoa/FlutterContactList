import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/widgets/contact_widget.dart';

class ContactListWidget extends StatefulWidget{

  var contacts = [];

  ContactListWidget(this.contacts);

  @override
  State<StatefulWidget> createState() => ContactListState(contacts);
}

class ContactListState extends State<ContactListWidget>{

  var contacts = [];

  ContactListState(this.contacts);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: contacts.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i){
        return ContactWidget(this.widget.contacts[i % contacts.length]);
      }

    );
  }
}