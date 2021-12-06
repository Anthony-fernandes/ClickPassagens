import 'package:clickpassagensg/Screens/Agenda_Screen.dart';
import 'package:clickpassagensg/Screens/Login_Screen.dart';
import 'package:clickpassagensg/Screens/Passageiros_Screen.dart';
import 'package:clickpassagensg/Screens/Perfil_Screen.dart';
import 'package:clickpassagensg/Screens/Pesquisa_Screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  final _PageControle = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _PageControle,
        children: [
          Pesquisa_Screen(),
          Agenda_Screen(),
          Passageiros_Screen()
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _PageControle,
        builder: (context, snapshot){
          return BottomNavigationBar(
            currentIndex: _PageControle.page?.round() ?? 0,
            onTap: (index) {
              _PageControle.jumpToPage(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white,),
                title: Text('Pesquisa', style: TextStyle(color: Colors.white,),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_available_outlined, color: Colors.white,),
                title: Text('Agenda', style: TextStyle(color: Colors.white,),),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_num_outlined, color: Colors.white,),
                title: Text('Passageiros', style: TextStyle(color: Colors.white,),),
                backgroundColor: Colors.white,
              ),
            ],
            backgroundColor: Color.fromARGB(255, 10, 19, 100),
          );
        }
      )
    ));
  }
}
