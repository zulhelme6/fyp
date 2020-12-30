import 'package:flutter/material.dart';
import 'package:haifma_v2/models/user.dart';
import 'package:haifma_v2/screens/authenticate/authenticate.dart';
import 'package:haifma_v2/screens/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null){
      return Authenticate();
    } else {
      return homescreen();
    }

    //return Authenticate();
  }
}
