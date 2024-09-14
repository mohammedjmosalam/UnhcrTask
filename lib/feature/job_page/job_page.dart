import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:template_project/core/screens/base_screen/base_screen.dart';
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/extension/num_extension.dart';
import 'package:template_project/core/widget/app_icon.dart';
import 'package:template_project/core/widget/app_network_image.dart';
import 'package:template_project/core/widget/app_text.dart';
import 'package:template_project/data/model/job_model.dart';
part 'widget/images_and_back.dart';
part 'widget/texts_pages.dart';

class JobPage extends StatelessWidget {
  const JobPage({
    super.key,
    required this.jobModel,
  });
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return BaseScreen.emptyPage(
      body: SizedBox(
        height: 100.percentageHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageAndBack(
              jobModel: jobModel,
            ),
            _TextsPage(
              jobModel: jobModel,
            ),
          ],
        ),
      ),
    );
  }
}
