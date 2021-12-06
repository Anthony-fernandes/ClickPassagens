import 'package:clickpassagensg/Screens/Perfil_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Passageiros_Screen extends StatefulWidget {
  const Passageiros_Screen({Key? key}) : super(key: key);

  @override
  _Passageiros_ScreenState createState() => _Passageiros_ScreenState();
}

class _Passageiros_ScreenState extends State<Passageiros_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                CupertinoButton(child:
                Container(
                  width: 70.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('Image/iconPerfil.png')
                    ),
                  ),
                ), onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Perfil_Screen())
                  );
                },),
              ],
              backgroundColor: Color.fromARGB(255, 10, 19, 100),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                    height: MediaQuery.of(context).size.width/4,
                    child: Image.asset('Image/click.png')
                ),

                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Image/tema.png'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.width/2,
            ),
            SliverList(delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [

                          ],
                        ),
                      )
                  )
                ]
            ))
          ],
        )
    );
  }
}
