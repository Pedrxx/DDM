import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/lista.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body:  ElevatedButton(child: const Text('Lista'),
      onPressed: (){
        Route rota = MaterialPageRoute(builder: (context) => Lista(),);
      Navigator.pushNamed(context, 'Lista');
      },),  
    );
  }
}


/*Container(
      color: Colors.yellow,
      alignment: Alignment.topLeft,
      child: Container(
        color: Colors.green,
        width: 150,
        height: 200,
        alignment: Alignment.center,
        child: Container(
          color: Colors.red,
          width: 100,
          height: 50,
        ),
      ),
    ); */