class QuestaoModel {
  final String id;
  final String? enunciado;
  final List<String>? opcoes;
  final List<int>? corretas;
  late final Map<Object, String>? caracteres;
  final String? imagemUrl; // Novo
  final String? palavra; // Novo
  final String? dica; // Novo
  final List<int>? lacunas; // Novo
  final List<int>? ordemCorreta; // Novo
  final List<int>? posicoesLacunas; // Novo

  QuestaoModel({
    required this.id,
    this.enunciado,
    this.opcoes,
    this.corretas,
    this.caracteres,
    this.imagemUrl,
    this.palavra,
    this.dica,
    this.lacunas,
    this.ordemCorreta,
    this.posicoesLacunas,
  });

  factory QuestaoModel.fromMap(Map<String, dynamic> data, String id) {
    return QuestaoModel(
      id: id,
      enunciado: data['enunciado'],
      opcoes: data['opcoes'] != null ? List<String>.from(data['opcoes']) : null,
      corretas: data['corretas'] != null ? List<int>.from(data['corretas']) : null,
      caracteres: data['caracteres'] != null ? Map<String, String>.from(data['caracteres']) : null,
      imagemUrl: data['imagemUrl'],
      palavra: data['palavra'],
      dica: data['dica'],
      lacunas: data['lacunas'] != null ? List<int>.from(data['lacunas']) : null,
      ordemCorreta: data['ordem_correta'] != null ? List<int>.from(data['ordem_correta']) : null,
      posicoesLacunas: data['posicoesLacunas'] != null ? List<int>.from(data['posicoesLacunas']) : null,
    );
  }
}