// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class payChat extends StatefulWidget {
  payChat({Key? key}) : super(key: key);

  @override
  State<payChat> createState() => _payChatState();
}

class _payChatState extends State<payChat> {
  var MoneyList = [];
  TextEditingController value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print(i);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Amit Kumar\n+91-6000637319"),
                  const SizedBox(
                    width: 120,
                  ),
                  IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.menu,
                        size: 25,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: MoneyList.length,
          itemBuilder: (BuildContext context, int index) {
            if (MoneyList[index][0] == "Red") {
              return ListTile(
                trailing: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: Border.all(color: Colors.black),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "₹ " + MoneyList[index][1],
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ),
              );
            } else if (MoneyList[index][0] == "Green") {
              return ListTile(
                leading: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: Border.all(color: Colors.black),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "₹ " + MoneyList[index][1],
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                ),
              );
            }
            return Text("");
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80, //set your height here
          width: double.maxFinite, //set your width here
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Balance Due"),
                  Text(
                    " ₹500",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      modelOpen(context, "Green");
                      // setState(() {
                      //   MoneyList.add("Green");
                      // });
                      // print(MoneyList);
                    },
                    child: Text("Received"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      modelOpen(context, "Red");
                      // setState(() {
                      //   MoneyList.add("Red");
                      // });
                      // print(MoneyList);
                    },
                    child: Text("Given"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  modelOpen(context, Key) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter Amount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: value,
                        decoration: InputDecoration(hintText: "₹"),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          MoneyList.add([Key, value.text]);
                          value.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Confirm"))
                ],
              ),
            ),
          );
        });
  }
}
