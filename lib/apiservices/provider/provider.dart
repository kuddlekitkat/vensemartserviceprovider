import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../screens/provider/provider_services.dart';


class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<ProviderServices>(
        create: (_) => ProviderServices()),
  ];
}