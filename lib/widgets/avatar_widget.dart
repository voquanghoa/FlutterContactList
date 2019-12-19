import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget{

  var avatar = "";

  Avatar(this.avatar);

  @override
  State<StatefulWidget> createState() => AvatarState();

}

class AvatarState extends State<Avatar>{
  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: this.widget.avatar,
      placeholder: (context, url) => CircularProgressIndicator(),
    );
  }

}