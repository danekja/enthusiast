/*
 * Copyright (c) 2016. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */
@HtmlImport("src/spa.html")
library spa;

import 'package:polymer/polymer.dart';
import 'package:web_components/html_import_annotation.dart';

import 'src/spa_data.dart';
import 'dart:html';

export 'content.dart';
export 'navbar.dart';

/// Entry element for a single page application.  Automatically generates menu
/// and main page content.
///
/// Requires application title and set of Page instances to be passed in on dom ready.
///
/// Example, inside your main app polymer element class:
///
///
///     SinglePageApplication get _spa => $["spa"];
///
///     ready() {
///       _spa.set("appPages", pages);
///       _spa.set("appTitle", title);
///     }
///
///
@PolymerRegister("single-page-app")
class SinglePageApplication extends PolymerElement {

  ///List of views in this application
  @property List<Page> appPages;

  ///Title of this application
  @property String appTitle;

  ///currently selected view path
  @property var route;


  SinglePageApplication.created() : super.created();

}