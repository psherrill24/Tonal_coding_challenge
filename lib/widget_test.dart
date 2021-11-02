import 'dart:developer';

import 'package:Tonal/models/dataModel.dart';
import 'package:Tonal/widgets/metrics.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //set initial value for our widget using a model to store the values
  Metrics data = Metrics("Upper Body", 150, "lbs", "assets/graph.svg");
  final label = TextEditingController();
  final weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Here we simply pass our data model which contains the values to build the Metric widget
            //we also pass the height and width that we want our widget to be in its container
            MetricsWidget(mydata: data, height: 250, width: 250)
          ],
        ),
      ),

      //floating action button with text fields to change data
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      //form for text fields and changing data
                      Form(
                        key: widget.key,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Enter a Label name"),
                                controller: label,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Enter a Weight"),
                                controller: weight,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text("Submit"),
                                onPressed: () {
                                  //using set state to change data in our page
                                  setState(() {
                                    //Error checking the weight input before setting the state of the new widget values
                                    //Ideally, would implement warning dialog, but for now have outputting to debug console

                                    if (int.tryParse(weight.text) == null) {
                                      return print("Enter a number for Weight");
                                    }

                                    if (int.parse(weight.text) > 350 ||
                                        int.parse(weight.text) < 0) {
                                      return print(
                                          "Enter a number between 0 and 350 for weight");
                                    }

                                    //change the state of the metric model with the new data values

                                    data = Metrics(
                                        label.text,
                                        int.parse(weight.text),
                                        "lbs",
                                        "assets/graph.svg");
                                  });

                                  //go back to previous page
                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
