class JokeEntity {
  final String imageUrl;
  final String joke;
  final String id;

  const JokeEntity({
    required this.imageUrl,
    required this.joke,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JokeEntity &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          joke == other.joke &&
          id == other.id);

  @override
  int get hashCode => imageUrl.hashCode ^ joke.hashCode;

  @override
  String toString() {
    return 'Joke{imageUrl: $imageUrl,joke: $joke, id: $id}';
  }

  JokeEntity copyWith({
    String? imageUrl,
    String? joke,
    String? id,
  }) {
    return JokeEntity(
      imageUrl: imageUrl ?? this.imageUrl,
      joke: joke ?? this.joke,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon_url': imageUrl,
      'value': joke,
      'id': id,
    };
  }

  factory JokeEntity.fromMap(Map<String, dynamic> map) {
    return JokeEntity(
      imageUrl: map['icon_url'] as String,
      joke: map['value'] as String,
      id: map['id'] as String,
    );
  }
}
