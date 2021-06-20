import 'package:flutter/material.dart';

class App extends StatefulWidget {
  // const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var output = "";
  List<dynamic> todos = ["first", "second"];

  addItem() {
    Navigator.of(context).pop();
    if (output.length != 0) {
      setState(() {
        todos.add(output);
        output = "";
      });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text('Please add some text!'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            margin: EdgeInsets.only(
              top: 10,
            ),
            color: Colors.pink,
            child: ListTile(
              title: Text(todos[index]),
              trailing: Container(
                width: 60,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Edit Item'),
                              content: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    output = value;
                                  });
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      todos.replaceRange(
                                          index, index + 1, {output});
                                    });
                                  },
                                  child: Text('Edit'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Item'),
                content: TextField(
                  onChanged: (value) {
                    setState(() {
                      output = value;
                    });
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: addItem,
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Text('Add'),
      ),
    );
  }
}
