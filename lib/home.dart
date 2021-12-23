import 'package:bmi_app2/result.dart';
import 'package:flutter/material.dart';

class bmiHome extends StatefulWidget {
  @override
  _bmiHomeState createState() => _bmiHomeState();
}

class _bmiHomeState extends State<bmiHome> {
  String gender = "Male";
  double Height = 0;
  int Weight = 50;
  int Age = 18;
  double result = 0;
  String Healthiness = "";
  String ToNormal = "";



  Expanded buildGestureDetector(String gender2) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: gender == gender2 ? Colors.blueAccent : Colors
                  .lightBlueAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gender2 == "Male" ? Icon(
                  Icons.male, size: 70, color: Colors.white) : Icon(
                  Icons.female, size: 70, color: Colors.white),
              Text(gender2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),)
            ],
          ),
        ),
        onTap: () {
          setState(() {
            gender = gender2;
          });
        },
      ),

    );
  }
  Expanded buildHeightWidget() {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text("Height",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                      text: "${Height.toStringAsFixed(1)}",
                      style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 50,)
                  ),
                  TextSpan(
                      text: " CM",
                      style: TextStyle(color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)
                  )
                ],

              ),

              ),

              Slider(value: Height,
                  min: 0,
                  max: 200,
                  divisions: 200,
                  activeColor: Colors.blueAccent,
                  onChanged: (value) {
                    setState(() {
                      Height = value as double;
                    });
                  })
            ],
          ),
        )
    );
  }
  /// Build Age and Weight
  Expanded buildAgeWidget() {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Text("Age",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              Text("$Age", style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 50,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.remove, color: Colors.white, size: 50,),
                    onPressed: () {
                      setState(() {
                        Age == 0 ? Age == 0 : Age -= 1;
                      });
                    },
                    backgroundColor: Colors.blueAccent,),
                  FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.add, color: Colors.white, size: 50,),
                    onPressed: () {
                      setState(() {
                        Age += 1;
                      });
                    },
                    backgroundColor: Colors.blueAccent,),

                ],
              )
            ],
          ),
        )
    );
  }
  Expanded buildWeightWidget() {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Text("Weight",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              Text("$Weight", style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 50,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: "btn3",
                    child: Icon(Icons.remove, color: Colors.white, size: 50,),
                    onPressed: () {
                      setState(() {
                        Weight == 0 ? Weight == 0 : Weight -= 1;
                      });
                    },
                    backgroundColor: Colors.blueAccent,),
                  FloatingActionButton(
                    heroTag: "btn4",
                    child: Icon(Icons.add, color: Colors.white, size: 50,),
                    onPressed: () {
                      setState(() {
                        Weight += 1;
                      });
                    },
                    backgroundColor: Colors.blueAccent,),

                ],
              )
            ],
          ),
        )
    );
  }
  ///

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Body Mass Index',),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Padding(padding: EdgeInsets.all(10), child: Column(
            children: [

              ///// Gender
              Text("Choose Your Gender ?", style: TextStyle(fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),),
              Expanded(
                  child: Row(
                    children: [
                      buildGestureDetector("Male"),
                      buildGestureDetector("Female"),
                    ],
                  )
              ),
              /////
              ///// Height
              Text("How T𝗮𝗹𝗹 Are You ?", style: TextStyle(fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),),
              Expanded(
                  child: Row(
                    children: [
                      buildHeightWidget()
                    ],
                  )
              ),
              /////
              ///// Age && Weight
              Text("Weight and Age ?", style: TextStyle(fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),),
              Expanded(
                  child: Row(
                    children: [
                      buildWeightWidget(),
                      buildAgeWidget(),
                    ],
                  )
              ),
              /////
              SizedBox(height: 10,),
              ///// Button
              Builder(
                  builder: (xx) {
                    return Container(

                        width: double.infinity, child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blueAccent),
                        ),
                        onPressed: () {
                          CalcResult();
                          CalcHealth();
                          CalcNormal();
                          Navigator.of(xx).push(MaterialPageRoute(builder: (x) {
                            return Result(gender, Age, result,
                                Healthiness,ToNormal);
                          }));
                        },
                        icon: Icon(Icons.add_task, size: 50,),
                        label: Text("Calculate", style: TextStyle(fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),)));
                  }
              ),
              SizedBox(height: 10,)
            ],
          )),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
      theme: ThemeData(canvasColor: Colors.black),
    );
  }

  ///// BMI LAW
  void CalcResult() {
    setState(() {
      var w = Weight;
      var h = Height / 100;
      var mul = h * h;

      result = w / mul;
    });
  }

  ////
  ///// Calculate Healthniess
  void CalcHealth() {
    if (result < 18.5) {
      Healthiness = "UnderWeight";
    } else if (result >= 18.5 && result <= 25) {
      Healthiness = "Normal";
    } else if (result > 25 && result <= 30) {
      Healthiness = "OverWeight";
    } else if (result > 30 && result <= 35) {
      Healthiness = "Obese";
    } else if (result > 35) {
      Healthiness = "Extremely Obese";
    } else {
      Healthiness = "Wrong choose";
    }
  }
  //////
//// Calc Normal Weight
void CalcNormal(){
    if(result<25&&result!=0&&result>14){
      ToNormal = "You should increase your weight by ${((25-result)*(Height/100*Height/100)).toStringAsFixed(2)} KG to reach the ideal weight !" ;
    }else if(result>25&&result!=0&&result<45){
      ToNormal = "You should Decrease your weight by ${((result-25)*(Height/100*Height/100)).toStringAsFixed(2)} KG to reach the ideal weight !" ;
    }
}
}
