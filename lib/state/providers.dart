

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'authState.dart';

final auth = ChangeNotifierProvider((_) => AuthenticationState());