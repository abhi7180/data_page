import 'package:flutter/cupertino.dart';

class dataclass
{
  int? id;
  String? name,number;

  dataclass(this.id, this.name, this.number);

  @override
  String toString() {
    return 'dataclass{id:$id ,name:$name , number:$number}';
  }
  static dataclass fromMap(Map m)
  {
    return dataclass(m['id'],m['name'],m['number']);
  }
}