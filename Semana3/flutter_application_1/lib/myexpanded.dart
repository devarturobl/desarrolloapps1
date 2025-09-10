import 'package:flutter/material.dart';

class MyExpanded extends StatefulWidget {
  const MyExpanded({super.key});

  @override
  State<MyExpanded> createState() => _MyExpandedState();
}

class _MyExpandedState extends State<MyExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 40.0,
                    right: 40.0,
                    bottom: 20,
                  ),
                  child: Container(
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyWidget(color: Colors.red),
                        MyWidget(color: Colors.green),
                        Expanded(child: MyWidget(color: Colors.red)),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 222,
                    height: 200,
                    child: Expanded(
                      child: Container(
                        color: Colors.green,
                        //child: Text("data"),
                      ),
                    ),
                  ),
                  Container(
                    width: 225,
                    height: 200,
                    child: Expanded(
                      child: Container(
                        color: Colors.redAccent,
                        //child: Text("sR"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Widgets adicionales
class MyWidget extends StatefulWidget {
  final Color color;
  const MyWidget({super.key, required this.color});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: widget.color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: const Text("Hola")),
        ),
      ),
    );
  }
}
