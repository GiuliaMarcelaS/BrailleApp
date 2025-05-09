class QuestaoModel {
  final String id;
  final String enunciado;
  final List<String> opcoes;
  final List<int> corretas;

  QuestaoModel({
    required this.id,
    required this.enunciado,
    required this.opcoes,
    required this.corretas,
  });

  factory QuestaoModel.fromMap(Map<String, dynamic> data, String id) {
    return QuestaoModel(
      id: id,
      enunciado: data['enunciado'],
      opcoes: List<String>.from(data['opcoes']),
      corretas: List<int>.from(data['corretas']),
    );
  }
}
