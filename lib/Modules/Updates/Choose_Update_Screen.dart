import 'package:flutter/material.dart';

import '../../Consts/Components.dart';
import 'Update_Pass.dart';
import 'Update_name.dart';

class UpdateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPDATE"),
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){
            //navigatTo(context, UpdateName());
          }, child: Text("Edit image")),
          SizedBox(height: 10.0,),
          TextButton(onPressed: (){
            navigatTo(context, UpdateName());
          }, child: Text("Edit name")),
          SizedBox(height: 10.0,),
          TextButton(onPressed: (){
            navigatTo(context, UpdatePass());
          }, child: Text("Edit password")),
        ],
      ),
    );
  }
}
