class Joke {
  final String imageUrl;
  final String joke;
  final String id;

  const Joke({
    this.imageUrl = '',
    this.joke = '',
    this.id = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Joke &&
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

  Joke copyWith({
    String? imageUrl,
    String? joke,
    String? id,
  }) {
    return Joke(
      imageUrl: imageUrl ?? this.imageUrl,
      joke: joke ?? this.joke,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'joke': joke,
      'id': id,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      imageUrl: map['imageUrl'] as String,
      joke: map['joke'] as String,
      id: map['id'] as String,
    );
  }
}
