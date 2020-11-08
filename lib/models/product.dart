import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Product extends Equatable {
  final int id;

  final String name;

  final int price;

  Product({@required this.id, @required this.name, @required this.price});

  @override
  List<Object> get props => [id];
}
