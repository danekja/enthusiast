/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

library spa.navig;

import 'package:polymer/polymer.dart';
import 'dart:html';

///View description class. Allows declarative specification
///of supported views in the application.
class Page extends JsProxy {

  ///path (url) of this view. must be unique within the application
  @reflectable String path;
  ///Displayable name of the view - used in menus
  @reflectable String name;
  ///Custom tag representing the view. Used to display the view content.
  final String tagName;
  ///default view if true (landing page)
  final bool isDefault;

  Page(this.path, this.name, this.tagName) : isDefault = false;

  Page.defaultPage(this.path, this.name, this.tagName) : isDefault = true;

  Element create() => new Element.tag("$tagName");
}
