

import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();

}

class _CalculadoraState extends State<Calculadora>{

  TextEditingController volumeAguaConsumida = TextEditingController();
  TextEditingController cloroRequerido = TextEditingController();
  TextEditingController quantidadeCloro = TextEditingController();
  TextEditingController quantidadeAgua = TextEditingController();
  TextEditingController horasOperacionais = TextEditingController();   
 
  String textoConcentraSolucao = '';
  String textoDosagemSolucao = ''; 
  String textoConsumoCloro = '';
  String textoAutonomiaSolucaoHoras = '';
  String textoAutonomiaSolucaoDias = '';
  String textoSugestao = "";
  

  void _calcular(){   

    double concentracaoSolucao = 0;
    double dosagemSolucao = 0;
    double consumoCloro = 0;
    double autonomiaSolucaoHoras = 0;
    double autonomiaSolucaoDias = 0;

    if(volumeAguaConsumida.text == '' || cloroRequerido.text == ''){
      setState(() {
        textoConsumoCloro = 'Consumo de cloro (g/h): inserir dados corretamente!';
      });
    }else{
      consumoCloro = ((double.parse(volumeAguaConsumida.text)) / 1000) * (double.parse(cloroRequerido.text));
      setState(() {
        textoConsumoCloro = 'Consumo de cloro (g/h): ' + consumoCloro.toStringAsFixed(2);
      });
    }

    if(quantidadeCloro.text == '' || quantidadeAgua.text == ''){
      setState(() {
        textoConcentraSolucao = 'Concentração de solução (g/L): inserir dados corretamente!';
      });
    }else{
      concentracaoSolucao = (double.parse(quantidadeCloro.text)) / (double.parse(quantidadeAgua.text));
      setState(() {
        textoConcentraSolucao = 'Concentração de solução (g/L): ' + concentracaoSolucao.toStringAsFixed(2);      
      });
      
    }

    if(consumoCloro == 0 || concentracaoSolucao == 0){
      setState(() {
        textoDosagemSolucao = 'Dosagem solução (L/h): inserir dados corretamente!';
      });
    }else{
      dosagemSolucao = consumoCloro / concentracaoSolucao;
      setState(() {
        textoDosagemSolucao = 'Dosagem solução (L/h): ' + dosagemSolucao.toStringAsFixed(2);
      });
    }

    if(quantidadeAgua.text == '' || dosagemSolucao == null){
      setState(() {
        textoAutonomiaSolucaoHoras = 'Autonomia solução (horas): inserir dados corretamente!';
      });
    }else{
      autonomiaSolucaoHoras = (double.parse(quantidadeAgua.text)) / dosagemSolucao;
      setState(() {
        textoAutonomiaSolucaoHoras = 'Autonomia solução (horas): ' + autonomiaSolucaoHoras.toStringAsFixed(2);
      });
    }

    if(autonomiaSolucaoHoras == 0 || horasOperacionais.text == ""){
      setState(() {
        textoAutonomiaSolucaoDias = 'Autonomia solução (dias): inserir dados corretamente!';
      });
    }else{
      autonomiaSolucaoDias = autonomiaSolucaoHoras / (int.parse(horasOperacionais.text));
      setState(() {
        textoAutonomiaSolucaoDias = 'Autonomia solução (dias): ' + autonomiaSolucaoDias.toStringAsFixed(2);
      });
    }

    textoSugestao = 'Sugerir dosadora com vazão máxima à (L/H): ' + dosagemSolucao.toStringAsFixed(2);

  }

  
  void limparCampos(){
    volumeAguaConsumida.text = " ";
    cloroRequerido.text = " ";
    quantidadeCloro.text = " ";
    quantidadeAgua.text = " ";
    horasOperacionais.text = " ";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulador de Dosagem de Cloro'),
        backgroundColor: Color.fromRGBO(43, 57, 144, 1.0),
      ),
      body: Container(
        //alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Insira todos os valores corretamente',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(43, 57, 144, 1.0),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Volume água consumida (L/h)'
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
                controller: volumeAguaConsumida,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cloro requerido (mg/L ou ppm)'
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
                controller: cloroRequerido,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade cloro (g)'
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
                controller: quantidadeCloro,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade água (L)'
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
                controller: quantidadeAgua,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Horas operacionais (h)'
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
                controller: horasOperacionais,
              ),              
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(   
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(43, 57, 144, 1.0),
                    onPrimary: Colors.white,
                    minimumSize: const Size(88, 40),
                    maximumSize: const Size(176,100),                    
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    )
                  ),              
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: _calcular,
                ),
              ),
              
              Center(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 15),
                  height: 190,
                  
                  decoration: BoxDecoration(
                    //color: const Color.fromRGBO(220, 220, 220, 1.0),
                    color: Color.fromARGB(176, 196, 222, 243),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  
                  child: Text(
                    textoConsumoCloro + '\n' 
                    + textoConcentraSolucao + '\n'
                    + textoDosagemSolucao + '\n'
                    + textoAutonomiaSolucaoHoras + '\n'
                    + textoAutonomiaSolucaoDias + '\n'
                    + textoSugestao,                    
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.10,
                      color: Colors.black,
                      
                    ),
                  ),
                  
                ),
              ),
              /*
              Center(
                child: Container(
                  alignment: Alignment.center,
                 // margin: const EdgeInsets.only(top: 3),
                  height: 25,                  
                  child: Text(
                    textoConcentraSolucao,                    
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  //margin: const EdgeInsets.only(top: 3),
                  height: 30,              
                  child: Text(
                    textoDosagemSolucao,                    
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  //margin: const EdgeInsets.only(top: 3),
                  height: 30,
                  child: Text(
                    textoAutonomiaSolucaoHoras,                    
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  //margin: const EdgeInsets.only(top: 3),
                  height: 30,
                  child: Text(
                    textoAutonomiaSolucaoDias,                    
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  //margin: const EdgeInsets.only(top: 3),
                  height: 30,
                  child: Text(
                    textoSugestao,                    
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  textoConsumoCloro,                  
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //color: Color.fromRGBO(43, 57, 144, 1.0)
                    color: Colors.black54,                    
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  textoConcentraSolucao,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(43, 57, 144, 1.0)
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  textoDosagemSolucao,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(43, 57, 144, 1.0)
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  textoAutonomiaSolucaoHoras,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(43, 57, 144, 1.0)
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  textoAutonomiaSolucaoDias,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(43, 57, 144, 1.0)
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  textoSugestao,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(43, 57, 144, 1.0)
                    ),
                ),
              ),
              */
            ],
          ),
        ),
      ),
    );
  }

}