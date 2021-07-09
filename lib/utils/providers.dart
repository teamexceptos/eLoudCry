import 'package:eloudcry/views/view_model/permission_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final permissionProvider = StateNotifierProvider((ref) => PermissionViewModel());