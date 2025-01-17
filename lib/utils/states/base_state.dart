abstract class BaseState {
  const BaseState();
}

class InitialState extends BaseState {
  const InitialState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class SuccessState extends BaseState {
  const SuccessState();
}

class ErrorState extends BaseState {
  const ErrorState();
}

class EmptyDataState extends BaseState {
  const EmptyDataState();
}

class ImageCapturedState extends BaseState {
  const ImageCapturedState();
}
