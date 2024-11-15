class Imc {
  final int? id;
  final double imc;
  final String date;

  Imc({
    this.id,
    required this.imc,
    required this.date,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'imc': imc,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'Imc{id: $id, imc: $imc, date: $date}';
  }
}
