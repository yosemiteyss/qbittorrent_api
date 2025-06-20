/// {@template piece_state}
/// Piece state.
/// {@endtemplate}
enum PieceState {
  /// Not downloaded yet
  notDownloaded(0),

  /// Now downloading
  downloading(1),

  /// Already downloaded
  downloaded(2);

  /// {@macro piece_state}
  const PieceState(this.value);

  /// The value of the piece state.
  final int value;

  /// Create a [PieceState] from its value.
  static PieceState byValue(int value) {
    return PieceState.values.firstWhere((e) => e.value == value);
  }
}
