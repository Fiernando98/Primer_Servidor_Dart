import 'package:my_project/my_project.dart';

Future main() async {
  final app = Application<MyProjectChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);
}
