abstract class ResultApi<T> {
  final T _result;
  ResultApi(this._result);
  T get getResult => _result;
}

class FailureApi extends ResultApi<String> {
  FailureApi(super.result);
}

class SucceedApi<T> extends ResultApi<T> {
  SucceedApi(super.result);
}
