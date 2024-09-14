import 'package:equatable/equatable.dart';

class ItemDropDown<T> extends Equatable {
  final String title;
  final T value;
  const ItemDropDown({
    required this.title,
    required this.value,
  });

  @override
  List<Object?> get props => [title, value];
}
