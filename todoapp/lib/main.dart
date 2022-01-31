import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          accentColor: Colors.red,
        ),
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("Nervtek meeting");
    todos.add("Code Flutter");
    todos.add("Study Algorithms");
    todos.add("Cook Food");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyToDos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Create A Task"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          todos.add(input);
                        });
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                    )
                  ],
                );
                Navigator.of(context).pop();
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}
