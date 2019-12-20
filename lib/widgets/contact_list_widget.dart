import 'package:contacts/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts/widgets/contact_widget.dart';

typedef ContactCallback = Function(Contact);

class ContactListWidget extends StatefulWidget{

  var contacts = [];
  ContactCallback onSelected;

  VoidCallback loadMoreCallback;

  ContactListWidget(this.contacts, this.loadMoreCallback, this.onSelected);

  @override
  State<StatefulWidget> createState() => _ContactListState(contacts, onSelected);
}

class _ContactListState extends State<ContactListWidget>{

  var contacts = [];

  ContactCallback onSelected;

  _ContactListState(this.contacts, this.onSelected);

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
          final contact = contacts[i];
          return GestureDetector(
            onTap: (){
              onSelected(contact);
            },
            child: ContactWidget(contact)
          );
        },
      )
    );
  }
}