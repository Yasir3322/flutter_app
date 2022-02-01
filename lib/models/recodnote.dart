class Record {
  int? id;
  late String purchase;
  late int amount;

  Record({
    this.id,
    required this.purchase,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
    }
    map['purchase'] = purchase;
    map['amount'] = amount;

    return map;
  }

  static Record fromMap(Map<String, dynamic> map) {
    return Record(
      id: map['id'],
      purchase: map['purchase'],
      amount: map['amount'],
    );
  }
}
