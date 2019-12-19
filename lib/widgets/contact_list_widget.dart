import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts/widgets/contact_widget.dart';

class ContactListWidget extends StatefulWidget{

  var contacts = [];

  VoidCallback loadMoreCallback;

  ContactListWidget(this.contacts, this.loadMoreCallback);

  @override
  State<StatefulWidget> createState() => ContactListState(contacts);
}

class ContactListState extends State<ContactListWidget>{

  var contacts = [];

  ContactListState(this.contacts);

  loadMore(){
    this.widget.loadMoreCallback();
  }


  @override
  Widget build(BuildContext context) {

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo){
        if(scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent){
          loadMore();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: contacts.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i){
          return ContactWidget(contacts[i]);
        },
      )
    );
  }
}