import 'package:beauty_skin/app_view.dart';
import 'package:beauty_skin/configs/size_config.dart';
import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/presentations/common_blocs/common_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  GoogleFonts.config.allowRuntimeFetching = false;

  await Boxes.initBoxes();

  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Boxes.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CommonBloc.blocProviders,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return const AppView();
            },
          );
        },
      ),
    );
  }
}
