import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';
//import 'package:trilhaapp/pages/main_page.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);
  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  //contole de nome e texto
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");

  //recebendo DataTime
  DateTime? dataNascimento; //pode receber nulo

  //controle do Repositório de níveis de experiência
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";

  //controle do repositório de Linguagens
  var linguagensRepository = LinguagensRepository();
  var linguagens = [];
  var linguagensSelecionados = [];

  //controle slider
  double salarioEscolhido = 0;

  //controle DropDownButton
  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  //widget text
  Text returnText(String texto) {
    return Text(texto,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  returnText("Nome"),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: "Data de Nascimento"),
                  TextField(
                    controller: dataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(
                            1900,
                            1,
                          ),
                          lastDate: DateTime(2023, 10, 23));
                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: "Nível de Experiência"),
                  Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              dense:
                                  true, //compacta um pouco a lista de radioButton
                              title: Text(nivel.toString()),
                              selected: nivelSelecionado == nivel,
                              value: nivel.toString(),
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              }))
                          .toList()),
                  const TextLabel(texto: "Linguagens Preferidas"),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            dense: true,
                            title: Text(linguagem),
                            value: linguagensSelecionados.contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  linguagensSelecionados.add(linguagem);
                                });
                              } else {
                                setState(() {
                                  linguagensSelecionados.remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de Experiência"),
                  DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretenção Salarial. R\$ ${salarioEscolhido.round()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      }),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "O nome deve ser preenchido com pelo menos 3 letras!")));
                          return;
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Data de nascimento não pode estar vazia!")));
                          return;
                        }
                        if (nivelSelecionado.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nível deve ser selecionado!")));
                          return;
                        }
                        if (linguagensSelecionados.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione pelo menos uma linguagem!")));
                          return;
                        }
                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ter pelo menos um ano de experiencia!")));
                          return;
                        }
                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretensão salarial deve ser maior que 0!")));
                          return;
                        }

                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvos com sucesso!")));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });

                        debugPrint("Dados salvos com sucesso!");
                      },
                      child: const Text("salvar")),
                ],
              ),
      ),
    );
  }
}
