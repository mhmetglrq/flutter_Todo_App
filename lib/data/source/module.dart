import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean/data/source/files_memory_impl.dart';

import 'files.dart';

final filesProvider = Provider<Files>((ref) => FilesMemoryImpl());
