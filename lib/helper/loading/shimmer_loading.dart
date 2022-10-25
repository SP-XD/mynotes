import 'package:flutter/material.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class SkeletonNotes extends StatelessWidget {
  const SkeletonNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListView.separated(
          controller: ScrollController(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return buildShimmer();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 7,
        ),
      ),
    );
  }

  Widget buildShimmer() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ShimmerWidget.circular(
                  height: screenHeight(87),
                  width: 150,
                  shapeBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth(7),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(
                        height: screenHeight(10),
                        width: screenWidth(110),
                      ),
                      SizedBox(
                        height: screenHeight(13.9),
                      ),
                      ShimmerWidget.rectangular(
                        height: screenHeight(8),
                        width: screenWidth(95.6),
                      ),
                      SizedBox(
                        height: screenHeight(13.9),
                      ),
                      Row(
                        children: [
                          ShimmerWidget.rectangular(
                            height: screenHeight(7),
                            width: screenWidth(85.6),
                          ),
                          SizedBox(
                            width: screenHeight(15.9),
                          ),
                          Icon(
                            Icons.file_download,
                            color: AppColors.textColor2,
                          ),
                        ],
                      )
                    ],
                  ).px8(),
                )
              ],
            )
          ],
        ),
      );
}

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular({
    super.key,
    required this.height,
    required this.width,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: AppColors.shimmerLoading,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: AppColors.textColor2,
          ),
        ),
      );
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double? height, width;
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[400]!,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: height,
          width: width,
          color: AppColors.textColor2,
        ),
      );
}
