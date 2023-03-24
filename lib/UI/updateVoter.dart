

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voteme/UI/updateUi.dart';
import 'package:voteme/Utils/apiCalls.dart';

import '../Utils/userModel.dart';

class UpdateUser extends StatefulWidget
{
  const UpdateUser({super.key});


  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _formKey= GlobalKey<FormState>();
  final idController=TextEditingController();
  final firstNamecontroller=TextEditingController();
  final lastNamecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final mobileController=TextEditingController();
  ApiFunctions? apiFunctions;
  late Future? future;
  late Voter user;
  String msg="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User"),centerTitle: true,
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
                    decoration: InputDecoration(labelText: "Enter Id Of Voter to Update",
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
                      decoration: InputDecoration(enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Enter New First Name",hintText: "Enter First Name",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
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
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Enter New Last Name",hintText: "Enter Last Name",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
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
                      decoration: InputDecoration(enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Enter New Email ",hintText: "Enter Email",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
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
                          ,labelText: "Enter New Mobile Number ",hintText: "Enter Moble Number",focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)))),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate())
                    {
                      user=Voter(id: idController.text, firstName: firstNamecontroller.text, lastName: lastNamecontroller.text, email: emailcontroller.text, phoneNumber: mobileController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Update(user: user,id: idController.text,)));
                    }
                  },style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      fixedSize: MaterialStateProperty.all<Size>(Size(100, 25))
                  ),child:Text("Update",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                  ),Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,0,0),
                    child: Text(msg,style: TextStyle(fontSize: 20),),
                  )
                ],
              )
          ),
        ),
      ),

    );
  }
}