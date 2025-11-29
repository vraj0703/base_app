part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.configure(BootLoad? initialLoad) = Configure;

  const factory AppEvent.configureWithContext(ContextCollects collects) =
      ConfigureWithContext;

  const factory AppEvent.refreshFeatureFlag() = RefreshFeatureFlag;
}
