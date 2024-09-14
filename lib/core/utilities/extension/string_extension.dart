import '../constant/const_value.dart';

extension AppStringExtension on String {
  String get imgPng => '${AppConstValue.assetsImage}$this.png';
  String get baseUrl => '${AppConstValue.baseUrl}/$this';
  String get jobApi => 'jobs/$this'.baseUrl;
}
