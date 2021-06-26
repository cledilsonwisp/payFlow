import 'dart:convert';

class BoletoModel {

  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  final bool? isPaid;

  BoletoModel({
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
    this.isPaid
  });
  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
    bool? isPaid,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
      isPaid: isPaid ?? this.isPaid
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
      'isPaid' : isPaid
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
      isPaid:  map['isPaid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) => BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode, isPaid: $isPaid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BoletoModel &&
      other.name == name &&
      other.dueDate == dueDate &&
      other.value == value &&
      other.isPaid == isPaid &&
      other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dueDate.hashCode ^
      value.hashCode ^
      isPaid.hashCode ^
      barcode.hashCode;
  }
}
