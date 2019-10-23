import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController ageController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  double result = 0.0;
  String resultReading = "";
  String finalResult = "";

  void calculateBMI() {
    setState(() {
      int age = int.parse(ageController.text);
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);

      if (ageController.text.isNotEmpty ||
          age > 0 && heightController.text.isNotEmpty ||
          height > 0 && weightController.text.isNotEmpty ||
          weight > 0) {
        result = weight / (height * height);

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          resultReading = "UnderWeight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 24.9) {
          resultReading = "HealthyWeight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 24.9 &&
            result < 29.9) {
          resultReading = "OverWeight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          resultReading = "Obese";
        }
      } else
        result = 0.0;
    });
    finalResult = "Your BMI:${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            new Container(
                margin: const EdgeInsets.all(3.0),
                height: 245.0,
                width: 290.0,
                color: Colors.grey.shade300,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Age',
                          hintText: 'e.g 23',
                          icon: new Icon(Icons.person_outline)),
                    ),
                    new TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Height in meter',
                          hintText: 'e.g 1.4',
                          icon: new Icon(Icons.insert_chart)),
                    ),
                    new TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Weight in kg',
                          hintText: 'e.g 70',
                          icon: new Icon(Icons.line_weight)),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Container(
                      alignment: Alignment.center,
                      child: new RaisedButton(
                        onPressed: calculateBMI,
                        color: Colors.pinkAccent,
                        child: new Text("Calculate"),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$finalResult",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "$resultReading",
                  style: new TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
