import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/apiCalls.dart';
import '../Utils/userModel.dart';

class Update extends StatefulWidget
{
  Voter user;
  String id;


  Update( { required this.id,required this.user});

  @override
  State<Update> createState() => _UpdateState();


}

class _UpdateState extends State<Update> {
  late ApiFunctions apiFunctions = ApiFunctions();
  // String id;
  // User user;
  //_UpdateState({  this.id, this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Update User"),centerTitle: true,),
      body: FutureBuilder(future:apiFunctions.updateUser(widget.user,widget.id ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData)
          {
            Voter user2;
            if(snapshot.data=="")
            {
              return Center(child: Text("No User Found"));
            }
            user2=welcomeFromJson(snapshot.data);

            return Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 50,),
                Text("Name :" + user2.firstName + " " + user2.lastName,
                  style: TextStyle(fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),),
                Text("Id :" + user2.id ,
                  style: TextStyle(fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),),
                Text("Email :" + user2.email ,textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                Text("Mobile Number :" + user2.phoneNumber ,textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400))
              ],
            );
          }
          else if(snapshot.hasError)
          {
            return Center(child: Text("Something Went Wrong"));
          }

          return CircularProgressIndicator();

        },

      ),
    );
  }
}