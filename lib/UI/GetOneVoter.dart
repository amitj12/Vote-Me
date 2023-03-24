import 'package:flutter/material.dart';
import 'package:voteme/Utils/apiCalls.dart';
import 'package:voteme/Utils/apiCalls.dart';
import 'package:voteme/Utils/UserModel.dart';

class GetUser extends StatefulWidget {
  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  bool isLoading = false;
  ApiFunctions apiFunctions = ApiFunctions();
  var idController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: idController,
                onChanged: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please Enter Id ";
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    labelText: "Enter Id Of User ",
                    hintText: "Enter Id",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                }
              },
              child: Text(
                "Get Data",
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )),
          (isLoading)
              ? FutureBuilder(
            future: apiFunctions.getOne(idController.text),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == "") {
                  return Text(
                      "No User Found With Id " + idController.text);
                } else {
                  Voter user = welcomeFromJson(snapshot.data.toString());
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name :" + user.firstName + " " + user.lastName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "E-mail: " + user.email,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  );
                }
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text(snapshot.error.toString()));
              }
              return CircularProgressIndicator();
            },
          )
              : Text(""),
        ],
      ),
    );
  }
}
