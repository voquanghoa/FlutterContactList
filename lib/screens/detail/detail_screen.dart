import 'package:contacts/model/model.dart';
import 'package:contacts/widgets/contact_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget{

  Contact contact;

  DetailScreen(this.contact);

  @override
  State<StatefulWidget> createState() => DetailScreenState(contact);

}

class DetailScreenState extends State<DetailScreen>{

  Contact contact;
  DetailScreenState(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.getFullName())),
      body: ContactDetailWidget(contact),
    );
  }

}