import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_view_h.dart';
import 'package:trilhaapp/pages/list_view_v.dart';
import 'package:trilhaapp/pages/tarefa_page.dart';
import 'package:trilhaapp/shared/widgets/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Meu Menu Principal")),
        //menu hamburger
        drawer: const CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewVerticalPage(),
                  ListViewHorizontalPage(),
                  TarefaPage()
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Page1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Page2", icon: Icon(Icons.link)),
                  BottomNavigationBarItem(
                      label: "Page3", icon: Icon(Icons.star)),
                  BottomNavigationBarItem(
                      label: "Page4", icon: Icon(Icons.list)),
                  BottomNavigationBarItem(
                      label: "Page5", icon: Icon(Icons.work)),
                ])
          ],
        ),
      ),
    );
  }
}
