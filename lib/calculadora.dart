
//import 'package:flutter/src/material/dropdown.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
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
 
  String resultConsumoCloro = '';
  String resultConcentraSolucao = '';
  String resultDosagemSolucao = '';
  String resultAutonomiaHoras = '';
  String resultAutonomiaDias = '';
  
  String valorEscolhido = '';
  
  final items = ['0.50','0,75','1.0','1,25'];
  String? value;

   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Center(
        
        child: Text(
          
          item,
          style: const TextStyle(
            fontSize: 15,
            
          ),
        ),
      ),
    );

  void _calcular(){   

    double concentracaoSolucao = 0;
    double dosagemSolucao = 0;
    double consumoCloro = 0;
    double autonomiaSolucaoHoras = 0;
    double autonomiaSolucaoDias = 0;

    if(volumeAguaConsumida.text == '' || cloroRequerido.text == ''){
      setState(() {
        resultConsumoCloro = 'N/A';
      });
    }else{
      consumoCloro = ((double.parse(volumeAguaConsumida.text)) / 1000) * (double.parse(cloroRequerido.text));
      setState(() {
        resultConsumoCloro = consumoCloro.toStringAsFixed(2);
      });
    }

    if(quantidadeCloro.text == '' || quantidadeAgua.text == ''){
      setState(() {
        resultConcentraSolucao = 'N/A';
      });
    }else{
      concentracaoSolucao = (double.parse(quantidadeCloro.text)) / (double.parse(quantidadeAgua.text));
      setState(() {
        resultConcentraSolucao = concentracaoSolucao.toStringAsFixed(2);     
      });
      
    }

    if(consumoCloro == 0 || concentracaoSolucao == 0){
      setState(() {
        resultDosagemSolucao = 'N/A';
      });
    }else{
      dosagemSolucao = consumoCloro / concentracaoSolucao;
      setState(() { 
        resultDosagemSolucao = dosagemSolucao.toStringAsFixed(2);    
      });
    }

    if(quantidadeAgua.text == '' || dosagemSolucao == null){
      setState(() {
        resultAutonomiaHoras = 'N/A';        
      });
    }else{
      autonomiaSolucaoHoras = (double.parse(quantidadeAgua.text)) / dosagemSolucao;
      setState(() {
        resultAutonomiaHoras = autonomiaSolucaoHoras.toStringAsFixed(2);
      });
    }

    if(autonomiaSolucaoHoras == 0 || horasOperacionais.text == ""){
      setState(() {
        resultAutonomiaDias = 'N/A';
      });
    }else{
      autonomiaSolucaoDias = autonomiaSolucaoHoras / (int.parse(horasOperacionais.text));
      setState(() {
        resultAutonomiaDias = autonomiaSolucaoDias.toStringAsFixed(2);
      });
    }
     

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
        backgroundColor: const Color.fromRGBO(43, 57, 144, 1.0),
      ),
      body: Container(
        //alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
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
                  fontSize: 16,
                ),
                controller: volumeAguaConsumida,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Cloro requerido (mg/L ou ppm)',
                  style: TextStyle(
                    fontSize: 16,                    
                    color: Color.fromARGB(255, 80, 79, 79),
                  ),
                ),
              ),              
              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text('Selecione'),
                      iconSize: 32,
                      icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 80, 79, 79),),
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                      
                      
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 8,
                thickness: 1,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cloro requerido (mg/L ou ppm)'
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                controller: cloroRequerido,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade cloro (g)'
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                controller: quantidadeCloro,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade água (L)'
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                controller: quantidadeAgua,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Horas operacionais (h)'
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                controller: horasOperacionais,
              ),              
              Padding(
                padding: const EdgeInsets.all(32),
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

              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 209, 211, 236),
                          ),
                          child: const Center(
                            child: Icon(Icons.water_drop_outlined),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                             
                          child: const Center(
                            child: Text(
                              "Consumo de cloro (g/h):",
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                                                       
                          child: Center(
                            child: Text(
                              resultConsumoCloro,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),                                
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  height: 8,
                  thickness: 1,
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 209, 211, 236),
                          ),
                          child: const Center(
                            child: Icon(Icons.bar_chart_outlined),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                             
                          child: const Center(
                            child: Text(
                              "Concentração de solução (g/L):",
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                                                       
                          child: Center(
                            child: Text(
                              resultConcentraSolucao,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),                                
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  height: 8,
                  thickness: 1,
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 209, 211, 236),
                          ),
                          child: const Center(
                            child: Icon(Icons.bar_chart_outlined),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                             
                          child: const Center(
                            child: Text(
                              'Dosagem solução (L/h):',
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                                                       
                          child: Center(
                            child: Text(
                              resultDosagemSolucao,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),                                
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  height: 8,
                  thickness: 1,
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 209, 211, 236),
                          ),
                          child: const Center(
                            child: Icon(Icons.access_time),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                             
                          child: const Center(
                            child: Text(
                              'Autonomia solução (horas):',
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                                                       
                          child: Center(
                            child: Text(
                              resultAutonomiaHoras,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  height: 8,
                  thickness: 1,
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 209, 211, 236),
                          ),
                          child: const Center(
                            child: Icon(Icons.access_time),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                             
                          child: const Center(
                            child: Text(
                              'textoAutonomiaSolucaoDias:',
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                                                       
                          child: Center(
                            child: Text(
                              resultAutonomiaDias,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),                                
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  height: 8,
                  thickness: 1,
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 209, 211, 236),
                          ),
                          child: const Center(
                            child: Icon(Icons.bar_chart_outlined),                          
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                             
                          child: const Center(
                            child: Text(
                              'Sugerir dosadora com vazão (L/H):',
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 4),                      
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(                                                       
                          child: Center(                            
                            child: Text(
                              resultDosagemSolucao,
                             // textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),     
                                                           
                              ),
                            ),
                         ),
                        ),
                      ),
                    ),
                  ],
                ),                                
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  height: 8,
                  thickness: 1,
                ),
              ),

              /*
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: (){},
                        child: Container(                         
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 180, 181, 192),
                          ),
                          child: Center(
                            child: Text(
                              textoConsumoCloro,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 41, 40, 40),
                              ),
                            ),
                            
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: (){},
                        child: Container(                         
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 180, 181, 192),
                          ),
                          child: Center(
                            child: Text(
                              textoConcentraSolucao,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),
                              ),
                            ),
                            
                          ),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: (){},
                        child: Container(                         
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 180, 181, 192),
                          ),
                          child: Center(
                            child: Text(
                              textoDosagemSolucao,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 41, 40, 40),
                              ),
                            ),
                            
                          ),
                        ),
                      ),
                    ),
                  ], 
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