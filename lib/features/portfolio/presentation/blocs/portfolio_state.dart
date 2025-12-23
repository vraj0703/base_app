part of 'portfolio_bloc.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState.initial() = _Initial;
  const factory PortfolioState.loading() = _Loading;
  const factory PortfolioState.loaded(List<ProjectModel> projects) = _Loaded;
  const factory PortfolioState.error([String? message]) = _Error;
}
