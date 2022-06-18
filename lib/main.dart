import 'package:device_preview/device_preview.dart';
import 'package:movie_curation/app/di/app_binding.dart';
import 'package:movie_curation/app/routes/app_pages.dart';
import 'package:movie_curation/ui/screens/root/root_screen_tablet.dart';
import 'utilities/index.dart';

// Device Preview 셋업 (반응형 확인)
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(),
//       ),
//     );

void main() {
  // FRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
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
        home: RootScreenT(),
      );
    });
  }
}
