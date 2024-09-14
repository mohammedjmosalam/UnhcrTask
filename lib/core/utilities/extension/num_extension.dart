import 'package:template_project/config/app/service/app_size.dart';

extension AppResponsive on num {
  double get percentageHeight => (AppSize.appHeight / 100) * this;
  double get percentageWidth => (AppSize.appWidth / 100) * this;
  double get fontSizeApp => (AppSize.appWidth / 300) * this;
}
