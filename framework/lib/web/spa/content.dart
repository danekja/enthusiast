/*
 * Copyright (c) 2016. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

@HtmlImport('src/content.html')
library spa.content;

import 'package:polymer/polymer.dart';
import 'package:web_components/html_import_annotation.dart';
import './src/spa_data.dart';

export './src/spa_data.dart';

///Single page view based on iron-pages element. Only one is displayed at
///a time.
@PolymerRegister('spa-content')
class SpaContent extends PolymerElement {

  ///list of supported views
  @property List<Page> pages;
  ///currently selected view
  @Property(observer: 'onRouteChanged') var selected;

  SpaContent.created() : super.created();


  @reflectable
  onRouteChanged(var newRoute, var oldRoute) {
    var selectedPage = pages.firstWhere((page) => page.path == newRoute);

    querySelector('#$newRoute')
          .children
            ..clear()
            ..add(selectedPage.create());
  }

}