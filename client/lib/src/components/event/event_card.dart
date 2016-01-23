/*
 * Copyright (c) 2016. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

@HtmlImport("event_card.html")
library enthusiast.polymer.components.event.card;

import 'package:web_components/html_import_annotation.dart';
import 'package:polymer/polymer.dart';
import 'package:enthusiast_polymer/src/model/data.dart' as app show Event;
import 'dart:html';

const EVENT_CARD_TAG = "event-card";

@PolymerRegister(EVENT_CARD_TAG)
class EventCard extends PolymerElement {

  ///event this card displays info about
  @property app.Event event;

  @property var joinevent;
  @property var detailsevent;

  EventCard.created() : super.created();

  @reflectable
  onDetailsClick(dynamic e, dynamic details) {
    dispatchEvent(new CustomEvent(detailsevent, detail: event.name));
  }

}