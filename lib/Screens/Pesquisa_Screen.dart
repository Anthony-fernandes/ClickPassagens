import 'package:clickpassagensg/Screens/Perfil_Screen.dart';
import 'package:clickpassagensg/Screens/Resultado_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pesquisa_Screen extends StatefulWidget {
  const Pesquisa_Screen({Key? key}) : super(key: key);

  @override
  _Pesquisa_ScreenState createState() => _Pesquisa_ScreenState();
}

class _Pesquisa_ScreenState extends State<Pesquisa_Screen> {
  DateTime _date = DateTime.now();
  Future Date(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        locale: Locale("pt", "BR"));
  }
  TimeOfDay _time = TimeOfDay.now();
  Future Time(BuildContext context) async {
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  List cidades =[];


  @override
  Widget build(BuildContext context) {
    final String DataFormate;

    return Scaffold(
        drawer: Drawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                CupertinoButton(
                  child: Container(
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
                    height: MediaQuery.of(context).size.width / 4,
                    child: Image.asset('Image/click.png')),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Image/tema.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.width / 2,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                      padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.near_me_outlined),
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Origem',),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on_outlined),
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Destino',),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today),
                                    hintText: DataFormate =
                                        DateFormat(DateFormat.YEAR_MONTH_DAY, "pt_Br")
                                            .format(_date),
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  readOnly: true,
                                  onTap: () {
                                    Date(context);
                                  },
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width/4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.watch_later_outlined),
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  readOnly: true,
                                  onTap: () {
                                    Time(context);
                                  },
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CupertinoButton(
                            color: Color.fromARGB(255, 10, 19, 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search, color: Colors.white),
                                Text(
                                  'Buscar',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Resultado_Screen()),
                                );
                              });
                            }),
                      ],
                    ),
                  )
            ]))
          ],
        ));
  }

}
