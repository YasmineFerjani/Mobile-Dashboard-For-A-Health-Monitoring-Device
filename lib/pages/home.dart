import 'package:flutter/material.dart';
import 'package:tsyp_app/mock_bluetooth_service.dart';
import 'package:tsyp_app/value.dart';
import 'package:tsyp_app/vitalSample.dart';

class HomeWidget extends StatefulWidget {
  List<VitalSample> samples; 
  
  HomeWidget(this.samples,  {super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool bluetoothConnection = true;
  


  @override
  Widget build(BuildContext context) {
    final latest = widget.samples.isNotEmpty? widget.samples.last : null; 
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
      
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  
                  children: [
                    Text('Health Monitor', style: Theme.of(context).textTheme.titleLarge,),
                    Text('Your Vitals At A Glance', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ), 
                Icon(Icons.healing, color: Colors.blue, size: 45,),
                
              ],
            ),
            
      
            // bluetooth on or off
            Container(
                margin: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(134, 79, 139, 187),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SwitchListTile(
                    activeThumbColor: const Color.fromARGB(255, 94, 178, 247),
                    title: const Text("Bluetooth Connection", style: TextStyle(color: Colors.white),),
                    value: bluetoothConnection,
                    onChanged: (value) {
                      setState(() {
                        bluetoothConnection = value;
                      });
                    },
                    secondary: const Icon(Icons.bluetooth, color: Colors.blue, size: 50),
                  ),
                ),
              ),


              
              Text('Current Vitals', style: Theme.of(context).textTheme.titleLarge), 
            
            bluetoothConnection ? buildVitals(latest) : ErrorVisual()
      
            
          ],
          
      
        )
      ),
    );
  }


  Widget buildVitals(latest){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ValueWidget('Heart Rate', (latest?.heartrate??  0).toString(), 'BPM', Colors.blue, Icons.favorite_border), 
            ValueWidget('Temperature', (latest?.temperature?? 0).toStringAsFixed(1), '°C', Colors.green, Icons.device_thermostat_outlined),
          ],), 

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ValueWidget('Body Humidity', (latest?.humidity?? 0).toString(), '%', Colors.orange, Icons.water_drop_outlined), 

          ],)
      ],
    );
  }

  Widget ErrorVisual(){
    return Container(

      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color.fromARGB(144, 244, 67, 54),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.error, color: Colors.red,),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
            children: [
              Text("Can't Connect To Your Device",style: Theme.of(context).textTheme.bodyLarge, ), 
              const SizedBox(height: 8),
              Text("Please check your bluetooth connection.", style: Theme.of(context).textTheme.bodySmall,)
            ],
          ) )
        ],
      )
    );
  }
}