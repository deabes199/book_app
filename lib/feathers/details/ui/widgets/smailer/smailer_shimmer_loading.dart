
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SmailerShimmer extends StatelessWidget {
  const SmailerShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) {
          return const Padding(padding: EdgeInsets.only(right: 10));
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 70,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 70,
                    height: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
