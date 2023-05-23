import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/round_button.dart';

class SocietyFlate extends StatefulWidget {
  const SocietyFlate({Key? key}) : super(key: key);

  @override
  State<SocietyFlate> createState() => _SocietyFlateState();
}

class _SocietyFlateState extends State<SocietyFlate> {
  //
  int entered = 0;
  //
  List<TextEditingController> textControllers = [];

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  } //

  void updateFields(int newNumberOfFields) {
    setState(() {
      if (newNumberOfFields > textControllers.length) {
        for (int i = textControllers.length; i < newNumberOfFields; i++) {
          textControllers.add(TextEditingController());
        }
      } else if (newNumberOfFields < textControllers.length) {
        for (int i = textControllers.length - 1; i >= newNumberOfFields; i--) {
          textControllers.removeAt(i);
        }
      }
    });
  }
  //

  TextEditingController _totalBlock = TextEditingController();
  TextEditingController _tryBlock = TextEditingController();
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
                "name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: entered,
                  itemBuilder: (context, index) {
                    if (index >= textControllers.length) {
                      textControllers.add(TextEditingController());
                      // } else if (index < textControllers.length) {
                      //   textControllers.remove(TextEditingController());
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: textControllers[index],
                        decoration: InputDecoration(
                          hintText: ' Enter the Block name',
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
                    );
                  },
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              RoundedButton(
                onTap: () {
                  entered = int.parse(_totalBlock.text);
                  setState(() {});
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
    );
  }
}
