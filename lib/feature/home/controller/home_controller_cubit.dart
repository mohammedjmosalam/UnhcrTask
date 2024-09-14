import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template_project/core/utilities/enum/get_data_status.dart';
import 'package:template_project/core/utilities/enum/navigator_type_home.dart';
import 'package:template_project/data/model/job_model.dart';
import 'package:template_project/data/model/result_api.dart';
import 'package:template_project/data/repository/job_repository.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  final JobRepository jobRepository;
  final BuildContext context;
  dynamic dataTravel;
  HomeControllerCubit({
    required this.context,
    required this.jobRepository,
  }) : super(const HomeControllerState()) {
    initData();
  }
  Future<void> initData() async {
    emit(state.copyWith(
      getDataStatus: GetDataStatus.loading,
    ));
    ResultApi resultApi = await jobRepository.getJobsList(context: context);
    if (resultApi is SucceedApi<List<JobModel>>) {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      List<JobModel> jobs = List.from(resultApi.getResult);
      jobs.sort(
        (a, b) => dateFormat
            .parse(b.datePosted)
            .compareTo(dateFormat.parse(a.datePosted)),
      );
      emit(state.copyWith(
        getDataStatus: GetDataStatus.successful,
        jobs: jobs,
      ));
    } else {
      emit(state.copyWith(
        errorMassage: resultApi.getResult,
        getDataStatus: GetDataStatus.error,
      ));
    }
  }

  void moveToJobPage({required JobModel jobModel}) {
    dataTravel = jobModel;
    emit(state.copyWith(
      navigatorTypeHome: NavigatorTypeHome.jobPage,
    ));
  }

  void resetNavigatorType() {
    emit(state.copyWith(
      navigatorTypeHome: NavigatorTypeHome.init,
    ));
  }
}
