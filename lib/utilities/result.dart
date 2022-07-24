abstract class Result<T> {
  static Result<T> failure<T>(Exception error) => Failure<T>(error);

  static Result<T> success<T>(T value) => Success<T>(value);

  T getOrThrow() {
    return this is Success
        ? (this as Success).value
        : throw (this as Failure).error;
  }

  Result<R> mapSuccess<R>(R Function(T value) func) {
    return map(onSuccess: func, onFailure: (e) => e);
  }

  Result<R> map<R>({
    required R Function(T value) onSuccess,
    required Exception Function(Exception e) onFailure,
  }) {
    return this is Success
        ? Result.success<R>(onSuccess((this as Success).value))
        : Result.failure<R>(onFailure((this as Failure).error));
  }

  Result<R> flatMap<R>({
    required Result<R> Function(T value) onSuccess,
    required Result<R> Function(Exception e) onFailure,
  }) {
    return this is Success
        ? onSuccess((this as Success).value)
        : onFailure((this as Failure).error);
  }

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Exception e) onFailure,
  }) {
    return this is Success
        ? onSuccess((this as Success).value)
        : onFailure((this as Failure).error);
  }
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Failure<T> extends Result<T> {
  final Exception error;

  Failure(this.error);
}
