import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voteme/Utils/apiCalls.dart';

import '../Utils/userModel.dart';

class Create extends StatefulWidget
{
  const Create({super.key});
  @override
  State<Create> createState() => _CreateState();
}
class _CreateState extends State<Create> {
  final _formKey= GlobalKey<FormState>();
  final idController=TextEditingController();
  final firstNamecontroller=TextEditingController();
  final lastNamecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final mobileController=TextEditingController();
  ApiFunctions apiFunctions=ApiFunctions();
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    Voter user;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add voter"),centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0),
              child: Column(
                children: [
                  TextFormField(keyboardType: TextInputType.phone,style: TextStyle(fontSize: 18,),
                    controller: idController,
                    validator:  (value) {
                      if(value==null || value.isEmpty)
                      {
                        return "Please Enter Id";
                      }
                    },
                    onChanged: (value) {
                      if(value==null || value.isEmpty)
                      {
                        setState(() {
                          isClicked=false;
                        });
                      }
                    },
                    decoration: InputDecoration(labelText: "Enter Id Of voter to Update",
                      enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))) ,focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18),borderSide: BorderSide(width: 1.2,color: Colors.blue)),
                      hintText: "Enter Id",prefixIcon: Icon(Icons.search),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator:  (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter First Name";
                        }
                      },
                      controller: firstNamecontroller,
                      decoration: InputDecoration(enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Enter User's First Name",hintText: "Enter First Name",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator:  (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter last Name";
                        }
                      },
                      controller: lastNamecontroller,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Enter user's  Last Name",hintText: "Enter Last Name",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator:  (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email ";
                        }
                      },
                      controller: emailcontroller,
                      decoration: InputDecoration(enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Enter user's   Email ",hintText: "Enter Email",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator:  (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Mobile Number";
                        }
                      },
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                          ,labelText: "Enter user's Mobile Number ",hintText: "Enter Moble Number",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate())
                    {

                      setState(() {
                        isClicked=true;
                      });
                    }
                  },style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      fixedSize: MaterialStateProperty.all<Size>(Size(100, 25))
                  ),child:Text("Create",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                  ),
                  SizedBox(height: 15,),
                  (isClicked )?FutureBuilder(future:apiFunctions.createUser(Voter(id: idController.text, firstName: firstNamecontroller.text, lastName: lastNamecontroller.text
                      , email:
                      emailcontroller.text, phoneNumber: mobileController.text)),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                      {
                        if(snapshot.data=="")
                        {
                          return Center(child: Text("User With given Id already Present ",style: TextStyle(color: Colors.red),));
                        }
                        Voter user=welcomeFromJson(snapshot.data.toString());
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Name :"+user.firstName+" "+user.lastName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ,Text("E-mail: "+user.email,style: TextStyle(fontSize: 16),)
                          ],
                        );
                      }
                      else if(snapshot.hasError)
                      {
                        return Center(child: Text("Something Went Wrong"));

                      }
                      return CircularProgressIndicator();

                    },):Text("")
                ],
              )
          ),
        ),
      ),
    );
  }
}