// ignore_for_file: sdk_version_since

import 'package:flutter/material.dart';
import 'package:template_project/core/utilities/extension/app_theme.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';
import 'package:template_project/core/utilities/extension/num_extension.dart';
import 'package:template_project/core/widget/app_icon.dart';
import 'package:template_project/core/widget/app_text.dart';
import 'package:template_project/data/model/item_drop_down.dart';

class AppDropDown extends StatefulWidget {
  const AppDropDown({
    super.key,
    required this.items,
    required this.onSelected,
    this.initValue,
    this.width,
    this.title,
    this.onChangeValue,
    this.isExpanded,
    this.selectedItemBuilder,
    this.colorIcon,
    this.isWithBorder = true,
    this.colorBorder,
    this.keyTitle,
    this.widthTitle,
    this.borderRadius,
    this.ignoreValue,
  });
  final List<ItemDropDown> items;
  final ItemDropDown? initValue;
  final ValueChanged<ItemDropDown> onSelected;
  final double? width;
  final String? title;
  final bool? isExpanded;
  final ValueNotifier<ItemDropDown>? onChangeValue;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final bool isWithBorder;
  final Color? colorIcon;
  final Color? colorBorder;
  final GlobalKey? keyTitle;
  final double? widthTitle;
  final double? borderRadius;
  final dynamic ignoreValue;

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  late ItemDropDown value;
  @override
  void initState() {
    value = widget.initValue ??
        widget.items.firstOrNull ??
        const ItemDropDown(title: '', value: '');

    widget.onChangeValue?.addListener(valueChangeListener);
    super.initState();
  }

  void valueChangeListener() {
    if (widget.onChangeValue?.value.value != null) {
      setState(() {
        value = widget.onChangeValue!.value;
      });
    }
  }

  @override
  void dispose() {
    widget.onChangeValue?.removeListener(valueChangeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.items.contains(value) && widget.items.isNotEmpty) {
      value = widget.items.first;
    }
    return SizedBox(
      width: widget.width,
      child: Row(
        children: [
          if (widget.title != null)
            SizedBox(
              width: widget.widthTitle,
              child: Padding(
                key: widget.keyTitle,
                padding: widget.widthTitle != null
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Center(child: AppText(text: widget.title!)),
              ),
            ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 6.percentageHeight,
              decoration: widget.isWithBorder
                  ? BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 10),
                      border: Border.all(
                        color: widget.colorBorder ??
                            context.theme.dropDownBorderColor,
                      ),
                    )
                  : null,
              child: widget.items.isEmpty
                  ? Center(child: AppText(text: context.lang.noChoses))
                  : DropdownButton<ItemDropDown>(
                      isExpanded: widget.isExpanded ?? widget.width != null,
                      dropdownColor: context.theme.bodyColorApp,
                      underline: const SizedBox(),
                      value: value,
                      selectedItemBuilder: widget.selectedItemBuilder,
                      items: widget.items
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: AppText(
                                text: e.title,
                                isNeedFormateNumber: false,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value1) {
                        widget.onSelected(value1 ?? widget.items.first);
                        if (widget.ignoreValue != value1?.value) {
                          setState(() {
                            value = value1 ?? widget.items.first;
                          });
                        }
                      },
                      icon: AppIcon.iconSystem(
                        iconData: Icons.arrow_drop_down,
                        iconColor: widget.colorIcon ??
                            context.theme.dropDownBorderColor,
                        sizeIcon: 28,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
