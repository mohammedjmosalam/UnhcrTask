part of '../home.dart';

class _BodyJobs extends StatelessWidget {
  const _BodyJobs();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeControllerCubit, HomeControllerState,
        GetDataStatus>(
      selector: (state) => state.getDataStatus,
      builder: (context, getDataStatus) => switch (getDataStatus) {
        GetDataStatus.loading => const _LoadingWidget(),
        GetDataStatus.successful => const _ListJobs(),
        GetDataStatus.error => const _ErrorWidget(),
        _ => const SizedBox(),
      },
    );
  }
}
