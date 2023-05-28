import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter/material.dart';

typedef ImageList = List<String>;

class ProductImagesWidget extends StatefulWidget {
  final ImageList images;

  const ProductImagesWidget({Key? key, required this.images}) : super(key: key);

  @override
  ProductImagesWidgetState createState() => ProductImagesWidgetState();
}

class ProductImagesWidgetState extends State<ProductImagesWidget> {
  ImageList get images => widget.images;

  // Local states
  int currentPage = 0;

  void onPageChanged(index) => setState(() => currentPage = index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Product image preview
        SizedBox(
          height: SizeConfig.defaultSize * 30,
          child: PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   AppRouter.DETAIL_IMAGE,
                  //   arguments: images[index],
                  // );
                },
                child: Image.network(images[index], fit: BoxFit.contain),
              );
            },
            onPageChanged: onPageChanged,
          ),
        ),

        /// Indicators
        Positioned(
          bottom: 0,
          width: SizeConfig.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(images.length, (index) => _buildIndicator(index)),
          ),
        ),
      ],
    );
  }

  _buildIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 3,
      width: currentPage == index
          ? SizeConfig.defaultSize * 6
          : SizeConfig.defaultSize * 3,
      decoration: BoxDecoration(
        color: currentPage == index
            ? COLOR_CONST.primaryColor
            : const Color(0xFFD8D8D8),
      ),
    );
  }
}
