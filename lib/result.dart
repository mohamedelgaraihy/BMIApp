
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String? _Gender ;
  String ?_Healthiness ;
  int ?_Age;
  double? result ;
  String ?ToNormal ;

 Result (String Gender,int Age,double RResult,String Healthiness,String Normality){
  _Gender = Gender ;
  _Age = Age ;
  result = RResult ;
  _Healthiness = Healthiness ;
  ToNormal = Normality ;
}

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(title: Text("Result"),centerTitle: true,),
          body: SafeArea(
            child: Center(
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Gender: $_Gender"),
                      Text("Age: $_Age"),
                      Text("Result: ${result!.toStringAsFixed(5)}"),
                      Text("Healthiness: $_Healthiness"),
                      Divider(height: 1,thickness: 3,color: Colors.blueAccent,),
                      Text(ToNormal!,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.red),)

                    ],
                  ),
                )
            ),
          ),
        ) ;

  }
}
