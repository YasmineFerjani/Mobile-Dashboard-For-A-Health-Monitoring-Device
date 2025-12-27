import 'package:flutter/material.dart';
import 'package:tsyp_app/mock_bluetooth_service.dart';
import 'package:tsyp_app/pages/graphs.dart';
import 'package:tsyp_app/pages/home.dart';
import 'package:tsyp_app/pages/personal.dart';
import 'package:tsyp_app/pages/tips.dart';
import 'package:tsyp_app/vitalSample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  
  @override

  


  // Bluetooth Service initialisation 
  late MockBluetoothService mockService;
  List<VitalSample> samples = [];
  static const int maxSamples = 60; // last 60 seconds

  int index= 0; 

  

  @override
  void initState() {
    super.initState();

    mockService = MockBluetoothService();
    mockService.start();

    mockService.stream.listen((sample) {
      setState(() {
        samples.add(sample);
        if (samples.length > maxSamples) {
          samples.removeAt(0);
        }
      });
    });
  }

  @override
  void dispose() {
    mockService.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    // defining screens
    
    List<Widget> screens = [HomeWidget(samples), GraphWidget(samples),TipsWidget(),PersonalWidget()]; 
    return MaterialApp(

      // theme of the app
      theme: ThemeData(
        
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedIconTheme: IconThemeData(
            color: Colors.blue
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
            opacity: 0.8,
          )
        ),

        primaryColor: const Color.fromARGB(255, 31, 30, 30),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold 
          ),
          titleMedium: TextStyle(
            color: Colors.white
          ),
          bodyLarge: TextStyle(
            color: Colors.white70
          ), 
          labelMedium: TextStyle(
            color: Colors.white54
          ),
          bodyMedium: TextStyle(
            color: Colors.white54
          )


          

        )
      ),




      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.black, title: const Text('Auraflow'), titleTextStyle: TextStyle(color: Colors.white), ),



        // bottom navigation bar 
        bottomNavigationBar: Container(
          color: Colors.black,  
          height: 60,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.auto_graph, color: index == 0 ? Colors.blue : Colors.white,), onPressed: () {
                setState(() {
                  index = 0; 
                });
              } ),
              IconButton(icon: Icon(Icons.bar_chart, color: index == 1 ? Colors.blue : Colors.white,), onPressed: ()
              {
                setState(() {
                  index = 1;
                });
              }, ),
              IconButton(icon: Icon(Icons.tips_and_updates, color: index == 2 ? Colors.blue : Colors.white,), onPressed: ()
              {
                setState(() {
                  index = 2;
                });
              }, ),
              IconButton(icon: Icon(Icons.person, color: index == 3 ? Colors.blue : Colors.white,), onPressed: () 
              {
                setState(() {
                  index = 3;
                });
              }, )
            ],
          ),

        ),
        
        
        
        
        
        body: screens[index],
      ),
    );
  }
}


