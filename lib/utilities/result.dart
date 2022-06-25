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
    /// 2022.05.11 추가 : onFailure에서 공통 오류 발생 시 처리 로직을 추가함.
    /*R _failureWithCommonError(Exception e) {
      /// 네트워크 연결이 되어 있지 않음
      if(e is NetworkConnectException) {
        ConnectionErrorDialog.showConnectionErrorDialog();
        return null;
      }
      /// 네트워크 연결 지연(timeout)
      else if(e is DioError && e.type == DioErrorType.connectTimeout) {
        TimeoutDialog.showTimeoutDialog();
        return null;
      }
      /// 서버 점검(500 에러 등)
      else if(e is ServerUnderMaintenanceException || e == NetworkException.serverNotRespond()) {
        ServerUnderMaintenanceDialog.showServerCheckDialog();
        return null;
      }
      /// 기타 통상적인 오류 처리
      else {
        return onFailure((this as Failure).error);
      }
    }*/

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
