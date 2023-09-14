class Peer {
  const Peer({
    required this.host,
    required this.port,
  });

  /// Host of the peer
  final String host;

  /// Port number of the peer
  final int port;

  /// Each peer is a colon-separated host:port
  @override
  String toString() {
    return '$host:$port';
  }
}
