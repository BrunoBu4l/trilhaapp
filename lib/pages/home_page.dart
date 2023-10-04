import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu 1º App com a DIO", 
                    //style: GoogleFonts.pacifico()
                  ),
      ),
      body: Container(
        //color: Colors.amber,
        width: double.infinity,  //ajusta o tamanho do container na tela(tela inteira)
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),  //um jeito de alinhar dois lados
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),               //um jeito de alinar cada lado
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,  //alinhar na horizontal
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //alinhar na vertical
          children: [
             SizedBox(
              width: double.infinity,
              height: 100,
               child: Container(
                color: Colors.amber[200],
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                 child: Text(
                  "Ações do usuário", 
                  style: GoogleFonts.acme(fontSize: 20)        
                           ),
               ),
             ),
            Expanded(
              child: Center(
                child: Text(
                        "Foi clicado $quantidadeCliques vezes!", 
                        style: GoogleFonts.acme(fontSize: 20)
                      
              )),
            ),
            Expanded(
              child: Center(
                child: Text(
                        "O numero gerado foi: $numeroGerado", 
                        style: GoogleFonts.monteCarlo(fontSize: 40)
                      
              )),
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Expanded(
                      flex: 3,
                     child: Container(
                      color: Colors.red,
                       child: Text(
                                   "10", 
                                   style: GoogleFonts.acme(fontSize: 20)        
                                 ),
                     ),
                   ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red[400],
                    child: Text(
                      "20", 
                      style: GoogleFonts.acme(fontSize: 20)        
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.red[300],
                    child: Text(
                      "30", 
                      style: GoogleFonts.acme(fontSize: 20)        
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red[200],
                    child: Text(
                      "40", 
                      style: GoogleFonts.acme(fontSize: 20)        
                    ),
                  ),
                ),
                  ],
                ),
              ),
            )
          ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            quantidadeCliques = quantidadeCliques +1;
            numeroGerado =  GeradorNumeroAleatorioService.gerarNumeroAleatorio(100);
          });
          //debugPrint(numeroGerado.toString()); //aparece somente no terminal do vsCode
        },
      ),
    );
  }
}