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

  Future<ContactData> contactData;

  @override
  void initState() {
    super.initState();
    contactData = ContactService.fetch();
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



  getBody(){

    return FutureBuilder<ContactData>(
      future: contactData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ContactListWidget(snapshot.data.data);
        } else if (snapshot.hasError) {
          return ErrorWidget("${snapshot.error}");
        }

        return LoadingWidget();
      },
    );
  }


}