import 'package:pokedex/controller/pokedex_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static final List<SingleChildWidget> list = [
    //general providers
    ChangeNotifierProvider<PokedexController>(
      create: (_) => PokedexController(),
    ),
  ];
}
