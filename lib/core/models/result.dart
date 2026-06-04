import 'package:my_communify/core/models/exception.dart';

typedef ResultType<T> = Result<T, AppException>;

sealed class Result<S, E extends AppException> {
  const Result();

  factory Result.ok(S value) => Ok(value);

  factory Result.error(E error) => Error(error);
}

class Ok<S, E extends AppException> extends Result<S, E> {
  final S value;

  Ok(this.value);
}

class Error<S, E extends AppException> extends Result<S, E> {
  final E value;

  Error(this.value);
}
