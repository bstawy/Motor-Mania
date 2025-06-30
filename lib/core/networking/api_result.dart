sealed class ApiResult<T> {
  R fold<R>(
    R Function(Failure<T> failure) onFailure,
    R Function(Success<T> success) onSuccess,
  );
}

class Success<T> implements ApiResult<T> {
  final T data;
  Success(this.data);

  @override
  R fold<R>(
    R Function(Failure<T> failure) onFailure,
    R Function(Success<T> success) onSuccess,
  ) {
    return onSuccess(this);
  }
}

class Failure<T> implements ApiResult<T> {
  final Exception exception;
  Failure(this.exception);

  @override
  R fold<R>(
    R Function(Failure<T> failure) onFailure,
    R Function(Success<T> success) onSuccess,
  ) {
    return onFailure(this);
  }
}
