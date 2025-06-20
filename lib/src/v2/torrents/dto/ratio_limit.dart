/// {@template ratio_limit}
/// Ratio limit.
/// {@endtemplate}
class RatioLimit {
  /// {@macro ratio_limit}
  const RatioLimit(this.ratio);

  /// {@macro ratio_limit}
  /// Global ratio limit.
  const RatioLimit.global() : ratio = -2;

  /// {@macro ratio_limit}
  /// No ratio limit.
  const RatioLimit.none() : ratio = -1;

  /// The ratio limit value.
  final double ratio;
}
