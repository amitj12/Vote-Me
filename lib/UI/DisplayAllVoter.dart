import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voteme/Utils/apiCalls.dart';
import 'package:http/http.dart' as http;
import '../Utils/apis.dart';
import '../Utils/userModel.dart';

class DisplayAllUser extends StatefulWidget {
  const DisplayAllUser({super.key});

  @override
  State<DisplayAllUser> createState() => _DisplayAllUserState();
}

class _DisplayAllUserState extends State<DisplayAllUser> {
  late ApiFunctions apiFunctions = ApiFunctions();
  List userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
              child: FutureBuilder(
                  future: apiFunctions.getAll(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("Something Went Wrong!!"));
                    } else if (snapshot.hasData) {
                      return ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(color: Colors.green, thickness: 0.8),
                          itemCount: snapshot.data!.length,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Center(
                                            child: Row(
                                              children: [
                                                Text("First Name : ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold)),
                                                Text(snapshot.data![index]?.firstName,
                                                    style: TextStyle(fontSize: 18))
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Row(children: [
                                              Text("Last Name : ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.bold)),
                                              Text(snapshot.data![index]?.lastName,
                                                  style: TextStyle(fontSize: 18))
                                            ]),
                                          )
                                        ])));
                          });
                    }
                    // if(snapshot.data==null)
                    //   {
                    //     return Center(child: Text("No Users Found",style: TextStyle(fontSize: 26),));
                    //   }
                    return CircularProgressIndicator();
                  })),
        ));
  }
}
