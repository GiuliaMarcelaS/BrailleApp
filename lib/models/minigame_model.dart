enum MiniGameType { LETTER_RECOGNITION, SYLLABLE, TEXT_TRANSCRIPTION }

class MiniGameTemplate {
  final String id;
  final MiniGameType type;
  final int difficulty;
  final Map<String, dynamic> content;

  MiniGameTemplate({
    required this.id,
    required this.type,
    required this.difficulty,
    required this.content,
  });
}
