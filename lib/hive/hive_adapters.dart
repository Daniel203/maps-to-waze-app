import 'package:hive_ce/hive.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Conversion>(),
])

class HiveAdapters {}
