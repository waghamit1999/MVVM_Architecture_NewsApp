import 'package:go_router/go_router.dart';
import 'package:news_app/routes/router_list.dart';
import 'package:news_app/ui/views/home_view.dart';
import 'package:news_app/ui/views/news_web_view.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeView(),
            ),
            GoRoute(
              path: Routes.webView,
              builder: (context, state) {
                assert(state.extra != null &&
                    state.extra is String &&
                    (state.extra as String).isNotEmpty);
                return NewsWebsiteView(webUrl: state.extra as String);
              },
            ),
          ],
        );
}
