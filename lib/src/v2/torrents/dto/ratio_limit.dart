class RatioLimit {
  const RatioLimit(this.ratio);

  const RatioLimit.global() : ratio = -2;

  const RatioLimit.none() : ratio = -1;

  final double ratio;
}
