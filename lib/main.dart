import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  double input,output;
  bool forC;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      input=0;
      output=0;
      forC=false;

    }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Temperature calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value){
                try {
                  input=double.parse(value);
                } catch (e) {
                  input=0;
                }
              },
              decoration: InputDecoration(
                labelText: "insert a value in ${forC==false ? "fahrenheit":"celsius"}"
              ),

            ),
            Text("choose ur mode of calculating"),
            Switch(
              value: forC,
              onChanged:(e){
                setState(() {
                        forC=!forC;
                                });
              } ,
            ),
            RaisedButton(
              child: Text("calculate"),
              onPressed: (){
                setState(() {
                            forC==false? output=(input-32)*5/9:output=(input-9/5)*32;
                                });

                          AlertDialog alertDialog=AlertDialog(
                            content: forC==false?Text("${input.toStringAsFixed(2)} F : ${output.toStringAsFixed(2)} C"):Text("${input.toStringAsFixed(2)} C : ${output.toStringAsFixed(2)} F"),
                          )    ;
                          showAboutDialog(context: context,children: [alertDialog]);  
              },
            )
          ],
        ),
      )
      
        
      ); // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}
