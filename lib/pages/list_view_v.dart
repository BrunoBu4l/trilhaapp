import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewVerticalPage extends StatefulWidget {
  const ListViewVerticalPage({Key? key}) : super(key: key);

  @override
  State<ListViewVerticalPage> createState() => _ListViewVerticalPageState();
}

class _ListViewVerticalPageState extends State<ListViewVerticalPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("User 2"),
          //trailing: const Icon(Icons.menu),
          //isThreeLine: true,
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("olá tudo bem?"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              if (menu == "opcao1") {
              } else if (menu == "opcao2") {
              } else if (menu == "opcao3") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "opcao3", child: Text("Opção 3")),
              ];
            },
          ),
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
