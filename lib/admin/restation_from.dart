import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/round_button.dart';

class SocityRestitation extends StatefulWidget {
  const SocityRestitation({Key? key}) : super(key: key);

  @override
  State<SocityRestitation> createState() => _SocityRestitationState();
}

class _SocityRestitationState extends State<SocityRestitation> {
  //
  int one = 1;
  int entered = 0;
  //
  List<TextEditingController> flateNameController = [];
  List<TextEditingController> flateFloorsController = [];
  List<TextEditingController> flateHousesController = [];

  @override
  void dispose() {
    for (var controller in flateNameController) {
      controller.dispose();
    }
    for (var controller in flateHousesController) {
      controller.dispose();
    }
    for (var controller in flateFloorsController) {
      controller.dispose();
    }
    super.dispose();
  } //

  void updateFields(int newNumberOfFields) {
    setState(() {
      if (newNumberOfFields > flateNameController.length) {
        for (int i = flateNameController.length; i < newNumberOfFields; i++) {
          flateNameController.add(TextEditingController());
        }
      } else if (newNumberOfFields < flateNameController.length) {
        for (int i = flateNameController.length - 1;
            i >= newNumberOfFields;
            i--) {
          flateNameController.removeAt(i);
        }
      }
    });
  }
  //

  TextEditingController _totalBlock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " My Socity ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                " No of block",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              // Note: Same code is applied for the TextFormField as well
              TextField(
                onChanged: (value) {
                  if (value != "") {
                    entered = int.parse(value);
                    setState(() {});
                  } else {
                    entered = one;
                    setState(() {});
                  }
                },
                keyboardType: TextInputType.number,
                controller: _totalBlock,
                decoration: InputDecoration(
                  hintText: ' eg  1 & 2',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                    ), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 0.5, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // for (int i = 1; i <= entered; i++)
              //   Container(
              //       child: TextField(
              //     decoration: InputDecoration(hintText: i.toString()),
              //   )),
              const Text(
                "Flates",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: entered,
                  itemBuilder: (context, index) {
                    if (index >=
                        flateNameController.length &
                            flateFloorsController.length &
                            flateHousesController.length) {
                      flateNameController.add(
                        TextEditingController(),
                      );
                      flateFloorsController.add(
                        TextEditingController(),
                      );
                      flateHousesController.add(
                        TextEditingController(),
                      );
                      // } else if (index < flateNameController.length) {
                      //   flateNameController.remove(TextEditingController());
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Name of the block",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: flateNameController[index],
                                decoration: InputDecoration(
                                  hintText: ' Enter the block name',
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                    ), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.5,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Numbers of floors",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              TextField(
                                controller: flateFloorsController[index],
                                decoration: InputDecoration(
                                  hintText: 'Numbers of floors',
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                    ), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.5,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "No of Ho in each floors",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              TextField(
                                controller: flateHousesController[index],
                                decoration: InputDecoration(
                                  hintText: 'No of Ho in each floors',
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                    ), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.5,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // log(flateHousesController[index].toString());

                                  log(_totalBlock.text.toString());
                                  log(flateHousesController.length.toString());
                                  // for (var controller
                                  //     in flateHousesController) {
                                  //   String value = controller.text;
                                  //   log(value[index].indexOf(value).toString() +
                                  //       value +
                                  //       "    index");
                                  //   // log();
                                  // }
                                  flateHousesController
                                      .asMap()
                                      .forEach((index, controller) {
                                    String value = controller.text;
                                    print('Index: $index, Value: $value');
                                  });
                                },
                                icon: Icon(Icons.add),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              RoundedButton(
                onTap: () {
                  //  Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SecondRoute()),
                  // );
                  // entered = int.parse(_totalBlock.text);
                  // setState(() {});
                },
                title: 'Submit',
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log("index");
          log(flateHousesController.length.toString());
        },
      ),
    );
  }
}
