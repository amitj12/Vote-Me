
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voteme/Utils/apiCalls.dart';

import '../Utils/userModel.dart';

class DeleteUser extends StatefulWidget
{
  const DeleteUser({super.key});

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  final _formKey=GlobalKey<FormState>();
  var idController=TextEditingController();
  bool isLoading=false;
  ApiFunctions apiFunctions=ApiFunctions();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(body: Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: idController,
            onChanged: (value) {
              if(value==null || value.isEmpty)
              {
                setState(() {
                  isLoading=false;
                });
              }
            },
            validator: (value) {
              if(  value==null||value.isEmpty )
              {
                return "please Enter Id ";
              }
            },
            decoration:InputDecoration(suffixIcon:Icon(Icons.search) ,
                labelText: "Enter Id Of Voter to Delete ",hintText: "Enter Id",
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))) ,
          ),
        ),
      ),
      SizedBox(height: 30,),
      ElevatedButton(onPressed: () {
        if(_formKey.currentState!.validate())
        {
          setState(() {

            isLoading=true;
          });
        }


      }, child: Text("Delete Voter",style: TextStyle(fontSize: 20),),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          )),
      (isLoading)?FutureBuilder(future:apiFunctions.deleteUser(idController.text),
        builder: (context, snapshot) {
          print("in builder");
          if(snapshot.hasData)
          {
            if(snapshot.data=="")
            {
              return Text("No User Found With Id "+idController.text);
            }
            else
            {
              Voter user=welcomeFromJson(snapshot.data.toString());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: Text("Deleted Voter With Following information",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                  Text("Name :"+user.firstName+" "+user.lastName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ,Text("E-mail: "+user.email,style: TextStyle(fontSize: 16),)
                ],
              );
            }
          }
          else if(snapshot.hasError)
          {
            print(snapshot.error);
            return Center(child: Text("Something Went Wrong"));
          }
          return CircularProgressIndicator();
        },) :Text(""),
    ],

    ),);
  }
}