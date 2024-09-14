part of 'home_controller_cubit.dart';

class HomeControllerState extends Equatable {
  const HomeControllerState({
    this.getDataStatus = GetDataStatus.init,
    this.errorMassage = '',
    this.jobs = const [],
    this.navigatorTypeHome = NavigatorTypeHome.init,
  });
  final GetDataStatus getDataStatus;
  final String errorMassage;
  final List<JobModel> jobs;
  final NavigatorTypeHome navigatorTypeHome;
  HomeControllerState copyWith({
    GetDataStatus? getDataStatus,
    String? errorMassage,
    NavigatorTypeHome? navigatorTypeHome,
    List<JobModel>? jobs,
  }) =>
      HomeControllerState(
        errorMassage: errorMassage ?? this.errorMassage,
        getDataStatus: getDataStatus ?? this.getDataStatus,
        jobs: jobs ?? this.jobs,
        navigatorTypeHome: navigatorTypeHome ?? this.navigatorTypeHome,
      );
  @override
  List<Object> get props => [
        getDataStatus,
        errorMassage,
        jobs,
        navigatorTypeHome,
      ];
}
