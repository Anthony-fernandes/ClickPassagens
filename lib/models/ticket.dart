class ticket {

  late String name;
  late String destiny;
  late String origin;
  late double price;
  late String date;
  late String HorarioChegada;
  late String HorarioSaida;
  late String idUser;

  ticket.empty();

  ticket(this.name, this.destiny, this.origin, this.date, this.price);


  ticket.fromJson(dynamic json){
    name = json["name"];
    destiny = json["destiny"];
    origin = json["origin"];
    price = json["price"] + 0.0;
    date = json["date"];
    HorarioChegada = json['HorarioChegada'];
    HorarioSaida = json['HorarioSaida'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};

    json['title'] = name;
    json['destiny'] = destiny;
    json['origin'] = origin;
    json['price'] = price;
    json['HorarioChegada'] = HorarioChegada;
    json['HorarioSaida'] = HorarioSaida;

    return json;
  }

}


/*



  ticket.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.id;
    name = snapshot["name"];
    destiny = snapshot["destiny"];
    origin = snapshot["origin"];
    price = snapshot["price"] + 0.0;
    date = snapshot["date"];
  }
 */