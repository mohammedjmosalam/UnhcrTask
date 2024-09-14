part of '../job_page.dart';

class _ImageAndBack extends StatelessWidget {
  const _ImageAndBack({required this.jobModel});
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.percentageHeight,
      child: Stack(
        children: [
          SizedBox(
            height: 35.percentageHeight,
            child: AppNetworkImage(
              imageUrl: jobModel.imageUrl,
              boxFit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: context.theme.appMainColor,
                child: const AppIcon.iconSystem(
                  iconData: Icons.arrow_back,
                  iconColor: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
