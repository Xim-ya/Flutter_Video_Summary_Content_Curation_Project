import 'dart:math';
import 'package:movie_curation/utilities/index.dart';

class RandomPosterBackground extends StatelessWidget {
  const RandomPosterBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        gradientLayerBox(),
      ],
    );
  }

  // 모바일 디바이스에서 사용되는 Background Layer
  Container darkLayerBox() {
    return Container(
      color: AppColor.darkGrey.withOpacity(0.86),
    );
  }

  // 테블릿 디바이스에서 사용되는 Background GradientLayer
  Container gradientLayerBox() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.linearSearchBackground,
      ),
    );
  }

  // Gradient Background 뒤로 보여지는 컨텐츠 Background Image (Random Constant Image)
  Widget backgroundImage() {
    final randomNum = Random().nextInt(2);
    return Image.asset(
      posterList[randomNum],
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
