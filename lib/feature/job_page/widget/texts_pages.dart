part of '../job_page.dart';

class _TextsPage extends StatelessWidget {
  const _TextsPage({
    required this.jobModel,
  });
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(
                text: jobModel.title,
                fontSize: 15,
                isBold: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.percentageWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: context.lang.jobId(jobModel.jobId),
                    fontSize: 11,
                    isBold: true,
                  ),
                  AppText(
                    text: jobModel.datePosted,
                    fontSize: 11,
                    isBold: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.percentageHeight,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.percentageWidth,
              ),
              child: AppText(
                text: context.lang.company(jobModel.company),
                fontSize: 11,
                isBold: true,
              ),
            ),
            SizedBox(
              height: 0.5.percentageHeight,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.percentageWidth,
              ),
              child: AppText(
                text: context.lang.location(jobModel.location),
                fontSize: 11,
                isBold: true,
              ),
            ),
            SizedBox(
              height: 0.5.percentageHeight,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.percentageWidth,
              ),
              child: AppText(
                text: context.lang.salary(jobModel.salary),
                fontSize: 11,
                isBold: true,
              ),
            ),
            SizedBox(
              height: 2.percentageHeight,
            ),
            _TitleWithMassage(
              title: context.lang.description,
              massage: jobModel.description,
            ),
            SizedBox(
              height: 2.percentageHeight,
            ),
            _TitleWithMassage(
              massage: jobModel.longDescription,
              title: context.lang.longDescription,
            )
          ],
        ),
      ),
    );
  }
}

class _TitleWithMassage extends StatelessWidget {
  const _TitleWithMassage({
    required this.massage,
    required this.title,
  });
  final String title;
  final String massage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            fontSize: 13,
            isBold: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.percentageWidth),
            child: ReadMoreText(
              massage,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: context.theme.appMainColor,
              trimCollapsedText: context.lang.showMore,
              trimExpandedText: context.lang.showLess,
              style: TextStyle(
                fontSize: 10.fontSizeApp,
                color: context.theme.textAndIconColor,
                fontFamily: context.fontBaseOnLang,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
