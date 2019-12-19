import 'package:flutter/cupertino.dart';

class Avatar extends StatefulWidget{

  var avatar = "";

  Avatar(this.avatar);

  @override
  State<StatefulWidget> createState() => AvatarState();

}

class AvatarState extends State<Avatar>{
  @override
  Widget build(BuildContext context) {
    return Image.network(this.widget.avatar);
  }

}