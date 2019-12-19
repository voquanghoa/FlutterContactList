import 'package:contacts/widgets/contact_list_widget.dart';
import 'package:contacts/widgets/loading_widget.dart';
import 'package:contacts/api/contact_service.dart';
import 'package:contacts/model/model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => HomeScreenState();

}


class HomeScreenState extends State<HomeScreen>{


  Future<ContactData> futureContactData;

  ContactData contactData;
  var contacts = [];
  var previousPage = 1;

  @override
  void initState() {
    super.initState();
    futureContactData = ContactService.fetch();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: getBody(),
    );
  }

  loadMore() {
    if(previousPage < contactData.totalPages){
        previousPage = previousPage + 1;
        setState(() {
          debugPrint("Load page $previousPage");
          futureContactData = ContactService.fetch(previousPage);
        });
      }
    }

  getBody(){

    return FutureBuilder<ContactData>(
      future: futureContactData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          contactData = snapshot.data;
          contacts.addAll(contactData.data);
          return  ContactListWidget(contacts, this.loadMore);
        } else if (snapshot.hasError) {
          return ErrorWidget("${snapshot.error}");
        }

        return LoadingWidget();
      },
    );
  }
}