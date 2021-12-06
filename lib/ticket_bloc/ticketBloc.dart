import 'package:bloc/bloc.dart';
import 'package:clickpassagensg/models/ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ticketBloc extends Cubit<List<ticket>?> {
  ticketBloc() : super(null) {
    FirebaseFirestore.instance.collection('passagens').snapshots().listen((
        event) {
      List<ticket> ticketList = event.docs.map((e) {
        dynamic json = e.data();
        json['id'] = e.id;
        return ticket.fromJson(json);
      }).toList();

      emit(ticketList);
    });
  }

  addTicket(ticket ticket) async {
    await FirebaseFirestore.instance
        .collection('agenda')
        .doc()
        .set(ticket.toJson());
  }

  void edit(ticket ticket) async {
    await FirebaseFirestore.instance
        .collection('tickets')
        .doc()
        .set(ticket.toJson());
  }
}
