import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:template_project/config/routes/app_route.dart';
import 'package:template_project/core/screens/base_screen/base_screen.dart';
import 'package:template_project/core/utilities/assets/app_assets.dart';
import 'package:template_project/core/utilities/enum/get_data_status.dart';
import 'package:template_project/core/utilities/enum/navigator_type_home.dart';
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/extension/num_extension.dart';
import 'package:template_project/core/widget/app_drop_down.dart';
import 'package:template_project/core/widget/app_icon.dart';
import 'package:template_project/core/widget/app_network_image.dart';
import 'package:template_project/core/widget/app_text.dart';
import 'package:template_project/data/model/item_drop_down.dart';
import 'package:template_project/data/model/job_model.dart';
import 'package:template_project/data/repository/job_repository.dart';
import 'package:template_project/feature/home/controller/home_controller_cubit.dart';
part 'widget/body_jobs.dart';
part 'widget/loading_jobs.dart';
part 'widget/list_jobs.dart';
part 'widget/error_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeControllerCubit>(
      create: (contextB) => HomeControllerCubit(
        jobRepository: JobRepository(),
        context: context,
      ),
      child: BlocListener<HomeControllerCubit, HomeControllerState>(
        listenWhen: (previous, current) =>
            previous.navigatorTypeHome != current.navigatorTypeHome,
        listener: (context, state) {
          switch (state.navigatorTypeHome) {
            case NavigatorTypeHome.jobPage:
              Navigator.pushNamed(
                context,
                AppRoute.jobPage,
                arguments: context.read<HomeControllerCubit>().dataTravel,
              ).whenComplete(
                () => context.read<HomeControllerCubit>().resetNavigatorType(),
              );

              break;
            default:
          }
        },
        child: const BaseScreen.withAppBar(
          title: 'Home',
          actions: [
            _ChangeLang(),
          ],
          body: _BodyJobs(),
        ),
      ),
    );
  }
}

class _ChangeLang extends StatelessWidget {
  const _ChangeLang({super.key})
      : langs = const [
          ItemDropDown(
            title: 'English',
            value: 'en',
          ),
          ItemDropDown(
            title: 'العربية',
            value: 'ar',
          ),
        ];
  final List<ItemDropDown> langs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 20.percentageWidth,
        child: AppDropDown(
          initValue: langs.firstWhere(
            (element) =>
                element.value ==
                context.appController.state.selectedLocale.languageCode,
          ),
          items: langs,
          onSelected: (value) {
            context.appController.changeLang(
              lang: Locale(value.value),
            );
          },
        ),
      ),
    );
  }
}
