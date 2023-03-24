import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voteme/UI/addVoter.dart';
import 'package:voteme/UI/updateVoter.dart';
import 'package:voteme/Utils/Myroutes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.getAll);
                    },
                    child: Text(
                      "Get All Voters",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            )),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.getOne);
                    },
                    child: Text(
                      "Get One voter ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.greenAccent),
                            )))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateUser(),
                          ));
                    },
                    child: Text(
                      "Update Voter",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.purple),
                            )))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.delete);
                    },
                    child: Text(
                      "Delete Voter",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            )))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(250, 200, 0, 0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Create(),
                          ));
                    },
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
