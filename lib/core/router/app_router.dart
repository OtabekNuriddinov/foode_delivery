import 'package:foode_delivery/feature/profile/favorites/favorites.dart';

import 'barrel.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final _findUrFoodRoute = GoRoute(
  parentNavigatorKey: rootNavigatorKey,
    path: 'find-ur-food',
    builder: (context, state) => const FindYourFood()
);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash1',
  routes: [
    GoRoute(
      path: '/splash1',
      builder: (context, state) => const SplashScreen1(),
    ),
    GoRoute(
      path: '/splash2',
      builder: (context, state) => const SplashScreen2(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
      routes: [
        GoRoute(
            path: 'forgot-password',
          builder: (context, state) => const ForgotPasswordScreen(),
          routes: [
            GoRoute(
                path: 'otp',
              builder: (context, state) => const OtpScreen(),
              routes: [
                GoRoute(
                    path: 'reset-password',
                  builder: (context, state) => const ResetPasswordScreen(),
                  routes: [
                    GoRoute(
                        path: 'congrats2',
                      builder: (context, state) => const Congrats2Screen()
                    )
                  ]
                )
              ]
            )
          ]
        )
      ]
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          path: 'fill-in-bio/:userId',
          builder: (context, state) => FillBioScreen(
            userId: state.pathParameters['userId']!,
          ),
          routes: [
            GoRoute(
              path: 'payment-method',
              builder: (context, state) => PaymentMethodScreen(
                userId: state.pathParameters['userId']!,
              ),
              routes: [
                GoRoute(
                  path: 'upload-photo',
                  builder: (context, state) => UploadPhotoScreen(
                    userId: state.pathParameters['userId']!,
                  ),
                  routes: [
                    GoRoute(
                      path: 'set-location',
                      builder: (context, state) => SetLocationScreen(
                        userId: state.pathParameters['userId']!,
                      ),
                      routes: [
                        GoRoute(
                          path: 'congrats',
                          builder: (context, state) => const CongratsScreen()
                        )
                      ]
                    )
                  ]
                )
              ]
            )
          ]
        )
      ]
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, child){
         return MainScreen(
           key: state.pageKey,
             currentIndex: switch(state.uri.path){
              final p when p.startsWith("/home") => 0,
               final p when p.startsWith("/order") => 1,
               final p when p.startsWith("/chat") => 2,
               final p when p.startsWith("/profile") => 3,
              _ => 0
             },
             child: child,
         );
        },
        routes: [
          GoRoute(
              path: '/home',
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                  path: 'popular-restaurants',
                builder: (context, state) => const PopularRestaurants(),
                routes: [
                  _findUrFoodRoute
                ]
              ),
              GoRoute(
                  path: 'popular-menus',
                builder: (context, state) => const PopularMenus(),
                routes: [
                  _findUrFoodRoute
                ]
              ),
              _findUrFoodRoute
            ]
          ),
          GoRoute(
              path: '/order',
            builder: (context, state) => const OrderScreen(),
          ),
          GoRoute(
              path: '/chat',
            builder: (context, state) => const ContactsScreen()
          ),
          GoRoute(
              path: '/profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: 'favorites',
                builder: (context, state) => const Favorites()
              )
            ]
          )
        ]
    )
  ],
);
