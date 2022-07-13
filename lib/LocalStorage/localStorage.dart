import 'package:localstorage/localstorage.dart';

class localstorageCustom {
  final LocalStorage LoginSideBarStorage = LocalStorage('LoginSideBar');
  final LocalStorage LoginBottomNavBarStorage =
      LocalStorage('LoginBottomNavbar');
  final LocalStorage SideBarStorage = LocalStorage('SideBar');
  final LocalStorage BottomNavBarStorage = LocalStorage('BottomNavBar');
  LocalStorage UserInfoStorage = LocalStorage('UserInfo');
}
