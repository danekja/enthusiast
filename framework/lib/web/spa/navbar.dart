/*
 * Copyright (c) 2016. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

@HtmlImport('src/navbar.html')
library spa.navbar;

import 'package:polymer/polymer.dart';
import 'package:web_components/html_import_annotation.dart';

import './src/spa_data.dart';

export './src/spa_data.dart';

///Automatically generated sidebar with menu based on
///passed list of views ([pages])
@PolymerRegister('spa-navbar')
class SpaNavbar extends PolymerElement {

  ///List of views for the application
  @property List<Page> pages;
  ///currently selected view
  @Property(notify: true) var selected;

  SpaNavbar.created() : super.created();

}