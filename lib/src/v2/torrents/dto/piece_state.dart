enum PieceState {
  /// Not downloaded yet
  notDownloaded(0),

  /// Now downloading
  downloading(1),

  /// Already downloaded
  downloaded(2);

  const PieceState(this.value);

  final int value;

  static PieceState byValue(int value) {
    return PieceState.values.firstWhere((e) => e.value == value);
  }
}
