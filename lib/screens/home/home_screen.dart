import 'package:flutter/material.dart';
import 'package:flutter_contact_list/api/contact_service.dart';
import 'package:flutter_contact_list/model/model.dart';
import 'package:flutter_contact_list/widgets/contact_list_widget.dart';
import 'package:flutter_contact_list/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => HomeScreenState();

}


class HomeScreenState extends State<HomeScreen>{


  Future<ContactData> futureContactData;

  ContactData contactData;
  var contacts = [];
  var previousPage = 0;

  @override
  void initState() {
    super.initState();
    futureContactData = ContactService.fetch();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: getBody(),
    );
  }

  loadMore() {
    if(contactData.page < contactData.totalPages){
      if(contactData.page >= previousPage){
        previousPage = contactData.page + 1;
        setState(() {
          debugPrint("Load page ${contactData.page + 1}");
          futureContactData = ContactService.fetch(contactData.page + 1);
        });
      }

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