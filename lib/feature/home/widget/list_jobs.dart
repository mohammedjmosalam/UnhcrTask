part of '../home.dart';

class _ListJobs extends StatelessWidget {
  const _ListJobs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeControllerCubit, HomeControllerState>(
      buildWhen: (previous, current) => previous.jobs != current.jobs,
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.jobs.length,
          itemBuilder: (context, index) => _SingleJob(
            jobModel: state.jobs.elementAt(index),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 1.percentageHeight,
          ),
        );
      },
    );
  }
}

class _SingleJob extends StatelessWidget {
  const _SingleJob({required this.jobModel});
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomeControllerCubit>().moveToJobPage(
            jobModel: jobModel,
          ),
      child: Card(
        color: context.theme.appCardColor,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(5.percentageWidth),
        )),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 22.percentageHeight,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: jobModel.jobId,
                    child: AppNetworkImage(
                      imageUrl: jobModel.imageUrl,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppText(
                        text: jobModel.title,
                        fontSize: 15,
                        maxLine: 2,
                      ),
                      SizedBox(
                        height: 0.5.percentageHeight,
                      ),
                      AppText(
                        text: jobModel.description,
                        maxLine: 3,
                      ),
                      SizedBox(
                        height: 0.5.percentageHeight,
                      ),
                      AppText(
                        text: jobModel.company,
                        fontSize: 11,
                        maxLine: 1,
                      ),
                      SizedBox(
                        height: 0.5.percentageHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: jobModel.datePosted,
                            fontSize: 11,
                            fontFamily: AppAssets.fonts.englishFont,
                          ),
                          Row(
                            children: [
                              AppText(text: context.lang.more),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.5.percentageHeight),
                                child: const AppIcon.iconSystem(
                                  iconData: Icons.arrow_forward,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
