import 'package:clickpassagensg/models/User_model.dart';
import 'package:clickpassagensg/models/ticket.dart';
import 'package:clickpassagensg/ticket_bloc/ticketBloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';

import 'agendar_ticket.dart';

class ticketTile extends StatelessWidget {
  final ticket product;
  ticketTile(this.product);



  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return Card(
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Image.network('https://images.vexels.com/media/users/3/73139/raw/730dc1591230dead52798995177c2694-viagem-de-van-com-logotipo-de-ferias.jpg'),
                          height: 30,
                        ),
                        SizedBox(width: 10,),
                        Text(product.name, style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('${product.HorarioSaida}', style: TextStyle(fontSize: 20)),
                            Text('Origem: ${product.origin}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${product.HorarioChegada}', style: TextStyle(fontSize: 20)),
                            Text('Destino: ${product.destiny}', style: TextStyle(fontSize: 15)),
                          ],
                        )

                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          textColor: Color.fromARGB(255, 10, 19, 100),
                          onPressed: () {
                            if(model.verification()){
                              ticket? tickets = ticket.empty();
                              BlocProvider.of<ticketBloc>(context).addTicket(tickets);
                            }
                          },
                          child: Text('Comprar Passagem', style: TextStyle(fontSize: 15),),
                        ),
                        Text('R\$${product.price}', style: TextStyle(fontSize: 15, color: Colors.indigo)),
                      ],
                    )
                  ],
                ),
              )
          );
        });
  }
}
