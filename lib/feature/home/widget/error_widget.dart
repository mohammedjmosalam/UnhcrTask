part of '../home.dart';

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeControllerCubit, HomeControllerState>(
      buildWhen: (previous, current) =>
          previous.errorMassage != current.errorMassage,
      builder: (context, state) {
        return Column(
          children: [
            AppText(
              text: state.errorMassage,
              fontSize: 13,
            ),
            SizedBox(
              height: 20.percentageHeight,
            ),
            AppIcon.iconSystem(
              iconData: Icons.refresh,
              sizeIcon: 10.percentageWidth,
              onTap: () => context.read<HomeControllerCubit>().initData(),
            )
          ],
        );
      },
    );
  }
}
