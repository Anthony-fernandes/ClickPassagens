import 'package:clickpassagensg/Screens/Perfil_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Agenda_Screen extends StatefulWidget {
  const Agenda_Screen({Key? key}) : super(key: key);

  @override
  _Agenda_ScreenState createState() => _Agenda_ScreenState();
}

class _Agenda_ScreenState extends State<Agenda_Screen> {
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
                      Card(
                        elevation: 15,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                child: Image.network('https://images.vexels.com/media/users/3/73139/raw/730dc1591230dead52798995177c2694-viagem-de-van-com-logotipo-de-ferias.jpg'),
                                height: 80,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ClickPassagens', style: TextStyle(fontSize: 18),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Origem: Conceição'),
                                  Text('Destino: Cajazeiras'),
                                  Text('Horario: 12:00'),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Preço: 25,00 R\$', style: TextStyle(fontSize: 10)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextButton(onPressed: () {}, child: Text('Cancelar Passagem', style: TextStyle(fontSize: 10),))
                                ],
                              )
                            ],
                          )
                      )
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
