import 'package:flutter/material.dart';

class CreateSociety extends StatefulWidget {
  const CreateSociety({super.key});

  @override
  State<CreateSociety> createState() => _CreateSocietyState();
}

class _CreateSocietyState extends State<CreateSociety> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black87,
            ),
          ),
        ],
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          " My Society",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Enter City"),
            ),
            const SizedBox(height: 10),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: const BoxDecoration(
                      boxShadow: [],
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/buldingsBG.png",
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        const Text("Bhopal"),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: VerticalDivider(
                      thickness: 10,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 100,
                    decoration: const BoxDecoration(
                      boxShadow: [],
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/buldingsBG.png",
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        const Text("Bhopal"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      )),
    );
  }
}
