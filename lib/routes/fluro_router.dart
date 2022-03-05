import 'package:movie_curation/utilities/index.dart';

class FRouter {
  static FluroRouter router = FluroRouter();

  static var homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RootScreen();
  });
  static var temp2Handler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TempScreen2();
  });
  static var temp3Handler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TempScreen3();
  });

  static var temp4Handler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TempScreen4();
  });

  static void setupRouter() {
    router.define('/',
        handler: homeHandler, transitionType: TransitionType.fadeIn);
    router.define('/temp2',
        handler: temp2Handler, transitionType: TransitionType.fadeIn);
    router.define('/temp3',
        handler: temp3Handler, transitionType: TransitionType.fadeIn);
    router.define('/temp4',
        handler: temp4Handler, transitionType: TransitionType.fadeIn);
  }
}
