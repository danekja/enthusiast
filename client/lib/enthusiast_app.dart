/*
 * Copyright (c) 2016. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

@HtmlImport('src/enthusiast_app.html')
library enthusiast.client.app;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';


//component imports
import './src/imports.dart';

/// A Polymer `<main-app>` element.
@PolymerRegister('enthusiast-app')
class EnthusiastApp extends PolymerElement {

  final List<Page> pages = [
    new Page.defaultPage("eventList", "List Events", EVENT_LIST_TAG),
  ];

  final String title = "Enthusiast";

  SinglePageApplication get _spa => $["spa"];

  /// Constructor used to create instance of MainApp.
  EnthusiastApp.created() : super.created();


  ready() {
    _spa.set("appPages", pages);
    _spa.set("appTitle", title);
  }


 /*



  /// The [Router] that controls the app.
  final Router router = new Router(useFragment: true);

  /// The current selected [Page].
  @Property() Page selectedPage;

  NeonAnimatedPages get _corePages => $['pages'];
  var _previousRoute;

  domReady() {
    // Set up the routes for all the pages.
    for (var page in pages) {
      router.root.addRoute(
          name: page.name, path: page.path,
          defaultRoute: page.isDefault,
          enter: enterRoute);
    }
    router.listen();

    handlePageElementsOnRouteTransition();
  }

  /// Updates [selectedPage] and the current route whenever
  /// the route changes.
  void routeChanged() {
    if (route is! String) return;
    if (route.isEmpty) {
      selectedPage = pages.firstWhere((page) => page.isDefault);
    } else {
      // Preserve path for page transition animation.
      if (selectedPage != null) _previousRoute = selectedPage.path;
      selectedPage = pages.firstWhere((page) => page.path == route);
    }
    router.go(selectedPage.name, {});
  }

  void handlePageElementsOnRouteTransition() {
    // Clear previous route's content on the transition end.
    // Following app-router's solution.
    // https://github.com/erikringsmuth/app-router/blob/master/src/app-router.js#L80
    // TODO: This doesn't work well when another transition starts before a transition ends. Needs another hook.
    _corePages.onTransitionEnd.listen((TransitionEvent e) {
      if (_previousRoute != null && _previousRoute != route) {
        _corePages.querySelector('section[path="$_previousRoute"]').children.clear();
      }
    });
  }


  /// Updates [route] whenever we enter a new route.
  void enterRoute(RouteEvent e) {
    route = e.path;
    //if (selectedPage == null) selectedPage = pages.firstWhere((page) => page.path == route);
    // Ensure to clear page element, and add the page element corresponding to route.
    if (route != null && route != "") {
      _corePages.querySelector('section[path="$route"]').children
        ..clear()
        ..add(selectedPage.create());
    }
  }*/

}
