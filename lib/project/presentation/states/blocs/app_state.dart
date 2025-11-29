part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;

  const factory AppState.loading() = _Loading;

  const factory AppState.injectWithContext() = InjectWithContext;

  const factory AppState.completed(AppEntity entity) = _Completed;

  const factory AppState.error() = _Error;
}
