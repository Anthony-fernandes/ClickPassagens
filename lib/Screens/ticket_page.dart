import 'package:clickpassagensg/models/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ticket_page extends StatefulWidget {
  const ticket_page({Key? key}) : super(key: key);

  @override
  _ticket_pageState createState() => _ticket_pageState();
}

class _ticket_pageState extends State<ticket_page> {

  late ticket _ticket;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ticket = ModalRoute.of(context)!.settings.arguments as ticket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 19, 100),

          title:Text('adicionar passagem')
      ),
      body: Form(
        child: ListView(

          padding: EdgeInsets.all(15),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Nome',
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (text){
                _ticket.name = text;
              },

            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(

              decoration: InputDecoration(
                  labelText: 'Origem',
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (text){
                _ticket.origin = text;
              },

            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(

              decoration: InputDecoration(
                  labelText: 'Destino',
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (text){
                _ticket.destiny = text;
              },

            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(

              decoration: InputDecoration(
                  labelText: 'Dias de Serviço',
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Horario de saida',
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (text){
                _ticket.HorarioSaida = text;
              },

            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Preço',
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),

              ),
              onChanged: (text){
              },
            ),
            SizedBox(
              height: 10,
            ),
            CupertinoButton(
                  color: Color.fromARGB(255, 10, 19, 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.white),
                      Text(
                        'Adicionar',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  onPressed: () {
                  }
              ),
          ],
        ),
      ),
    );
  }
}
