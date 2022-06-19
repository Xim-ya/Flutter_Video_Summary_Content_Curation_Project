import 'package:movie_curation/app/di/modules/domain_modules.dart';
import '../../utilities/index.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    DomainModules.dependencies();
  }
}
