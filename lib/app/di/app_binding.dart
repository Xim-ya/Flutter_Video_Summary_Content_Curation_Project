import 'package:movie_curation/app/di/modules/data_modules.dart';
import 'package:movie_curation/app/di/modules/domain_modules.dart';
import 'package:movie_curation/app/di/modules/presentation_modules.dart';
import '../../utilities/index.dart';

/* 의존성 주입을 하는 모듈
* Data (Api, DataSource, Repository)
* Domain (UseCase)
* Presentation (ViewModel)
* 로 구성됨.
*  */

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    DataModules.dependencies();
    DomainModules.dependencies();
    PresentationModules.dependencies();
  }
}
