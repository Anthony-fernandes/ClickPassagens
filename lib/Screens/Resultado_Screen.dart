import 'dart:ui';

import 'package:clickpassagensg/models/ticket.dart';
import 'package:clickpassagensg/ticket/ticket_tile.dart';
import 'package:clickpassagensg/ticket_bloc/ticketBloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Resultado_Screen extends StatelessWidget {
  const Resultado_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(220, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 19, 100),
        title:TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisa:',
            hintStyle: TextStyle(color: Colors.white, fontSize: 10),
            suffixIcon: Icon(Icons.search, color: Colors.white, size: 20,),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white38),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white38),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          style: TextStyle(color: Colors.white, fontSize: 10),

        ),
      ),
      body: BlocBuilder<ticketBloc, List<ticket>?>(
        builder: (context, state) {
          if (state == null)
            return Center(child: CircularProgressIndicator(),);
          return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: state.length,
              itemBuilder: (context, index) {
                ticket tickets = state[index];
                return ticketTile(tickets);
              }
          );
        },
      ),
    );
  }

}


/*



Card(
                  child: ListTile(
                    title: Text(tickets.name),
                    subtitle: Column(
                      children: [
                        Text(tickets.origin),
                        Text(tickets.destiny)
                      ],
                    ),
                    onTap: () async{
                      ticket t = await Navigator.of(context).pushNamed('ticket', arguments: tickets) as ticket;
                    },
                  ),
                );



FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('passagens').get(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else{
            return ListView.builder(
              padding: EdgeInsets.all(5),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                return ticketTile(ticket.fromDocument(snapshot.data!.docs[index]));
                }
                );
          }
        },
      )
 */

