import 'package:contacts/screens/detail/detail_screen.dart';
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

  var contacts = [];
  var previousPage = 0;
  var pageTotal = 0;

  @override
  void initState() {
    super.initState();
    loadMore();
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
    if(previousPage < pageTotal || pageTotal == 0){
        previousPage = previousPage + 1;
        setState(() {
          debugPrint("Load page $previousPage");
          futureContactData = ContactService.fetch(previousPage);
        });
      }
    }

    showContact(Contact contact){
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context){
            return DetailScreen(contact);
          }
        )
      );
    }

  getBody(){

    return FutureBuilder<ContactData>(
      future: futureContactData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          pageTotal = snapshot.data.totalPages;
          contacts.addAll(snapshot.data.data);
          return  ContactListWidget(contacts, this.loadMore, this.showContact);
        } else if (snapshot.hasError) {
          return ErrorWidget("${snapshot.error}");
        }

        return LoadingWidget();
      },
    );
  }
}