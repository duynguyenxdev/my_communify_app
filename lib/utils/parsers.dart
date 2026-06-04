Map parseMap<T>(dynamic raw, {Map defaultValue = const {}}) {
  return raw is Map ? raw : defaultValue;
}

T? safeCast<T>(dynamic raw) {
  return raw is T ? raw : null;
}
