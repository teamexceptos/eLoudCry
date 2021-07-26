import 'package:eloudcry/screens/auth/auth_viewmodel.dart';
import 'package:eloudcry/screens/permissions/permission_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final permissionProvider = StateNotifierProvider((ref) => PermissionViewModel());
final authProvider = StateNotifierProvider((ref) => AuthViewModel());