// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/mixin/end_points.dart';
import 'package:template_project/data/api/api_method.dart';
import 'package:template_project/data/model/job_model.dart';
import 'package:template_project/data/model/result_api.dart';

class JobRepository with ApiMethod, EndPoints {
  JobRepository() {
    initialDio();
  }
  Future<ResultApi> getJobsList({
    required BuildContext context,
  }) async {
    bool isConnect = await context.appController.reCheckConnection();
    if (isConnect) {
      try {
        Response response = await getMethod(
          url: getJobsUrl,
        );
        if (response.statusCode == 200) {
          List dataJobs = response.data;
          List<JobModel> jobs = [];
          for (var data in dataJobs) {
            JobModel jobModel = JobModel.fromJson(data);
            jobs.add(jobModel);
          }
          return SucceedApi<List<JobModel>>(jobs);
        } else {
          return FailureApi(context.lang.connectionError);
        }
      } catch (e) {
        log(e.toString());
        return FailureApi(context.lang.connectionError);
      }
    } else {
      return FailureApi(context.lang.connectionError);
    }
  }
}
