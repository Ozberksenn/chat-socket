import 'package:get/route_manager.dart';
import 'package:opex/pages/home/home_view.dart';
import 'package:opex/pages/entry/entry_view.dart';
import 'package:opex/pages/rooms/rooms_view.dart';
import 'package:opex/utils/app_routes.dart';

routes() => [
      GetPage(name: AppRoutes.room, page: () => RoomsView()),
      GetPage(name: AppRoutes.entry, page: () => EntryView()),
      GetPage(name: AppRoutes.home, page: () => HomeView()),
    ];
