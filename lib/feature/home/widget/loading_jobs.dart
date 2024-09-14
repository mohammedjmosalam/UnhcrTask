part of '../home.dart';

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => SizedBox(
        height: 1.percentageHeight,
      ),
      itemBuilder: (context, index) => Card(
        color: Colors.grey.shade300,
        child: SizedBox(
          height: 20.percentageHeight,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Row(
              children: [
                Container(
                  width: 35.percentageWidth,
                  height: 20.percentageHeight,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.percentageWidth),
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 3.percentageHeight,
                        width: 25.percentageWidth,
                        color: Colors.red,
                      ),
                      Container(
                        height: 3.percentageHeight,
                        width: 40.percentageWidth,
                        color: Colors.red,
                      ),
                      Container(
                        height: 3.percentageHeight,
                        width: 55.percentageWidth,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      itemCount: 15,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
