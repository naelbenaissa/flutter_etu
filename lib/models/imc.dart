class Imc {
  final int id;
  final DateTime date;

  Imc({
    required this.id,
    required this.date,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Imc{id: $id, date: $date}';
  }
}