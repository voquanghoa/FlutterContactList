import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget{

  var avatar = "";

  AvatarWidget(this.avatar);

  @override
  State<StatefulWidget> createState() => AvatarWidgetState();

}

class AvatarWidgetState extends State<AvatarWidget>{
  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: this.widget.avatar,
      placeholder: (context, url) => CircularProgressIndicator(),
    );
  }

}