import 'dart:ui';

import 'package:dosagemdecloro/calculadora.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}



class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color.fromRGBO(43, 57, 144, 1.0),
      ),
      */
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 65),
                child: Center(
                 // padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'APP LUCIANO NERES',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(43, 57, 144, 1.0),  
                    ),
                    
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Image.asset('imagens/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(                
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(43, 57, 144, 1.0),
                    onPrimary: Colors.white,
                    minimumSize: Size(88, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  onPressed: (){
                    final Future future = Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Calculadora();
                    }));
                  }, 
                  child: Text('SIMULADOR DE DOSAGEM DE CLORO'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(                
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(43, 57, 144, 1.0),
                    onPrimary: Colors.white,
                    minimumSize: Size(88, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  onPressed: (){}, 
                  child: Text('SIMULADOR CALCULO TESTE 2'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(                
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(43, 57, 144, 1.0),
                    onPrimary: Colors.white,
                    minimumSize: Size(88, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  onPressed: (){
                    
                  }, 
                  child: Text('SIMULADOR CALCULO TESTE 3'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    
}