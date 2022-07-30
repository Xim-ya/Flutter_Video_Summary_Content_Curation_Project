import 'package:device_preview/device_preview.dart';
import 'package:movie_curation/app/di/app_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:movie_curation/ui/screens/root/root_paged_view.dart';
import 'utilities/index.dart';

// Device Preview 셋업 (반응형 레이아웃 확인)
// void main() async {
//   // FRouter.setupRouter();
//   WidgetsFlutterBinding.ensureInitialized(); // Firebase 셋팅
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

void main() async {
  // FRouter.setupRouter();
  WidgetsFlutterBinding.ensureInitialized(); // Firebase 셋팅
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      print('responsive Font ${6.5.sp}');
      return GetMaterialApp(
        title: 'New Project',
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        initialBinding: AppBinding(),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPagedView(),
      );
    });
  }
}
