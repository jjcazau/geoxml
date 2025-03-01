import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:geoxml/src/model/kml_tag.dart';
import 'package:quiver/core.dart';

import 'geo_object.dart';
import 'gpx_tag.dart';
import 'link.dart';
import 'trkseg.dart';
import 'wpt.dart';

/// Polygon represents a simple polygon - an ordered list of points describing a shape.
class Polygon implements GeoObject {
  /// Name of Polygon.
  @override
  String? name;

  /// GPS comment for track.
  @override
  String? cmt;

  /// User description of track.
  @override
  String? desc;

  /// Source of data. Included to give user some idea of reliability and
  /// accuracy of data.
  @override
  String? src;

  /// Links to external information about the track.
  @override
  List<Link> links;

  /// GPS track number.
  @override
  int? number;

  /// Type (classification) of track.
  @override
  String? type;

  /// You can add extend GPX by adding your own elements from another schema
  /// here.
  @override
  Map<String, String> extensions;

  // Element tag.
  @override
  String tag = KmlTag.polygon;

  /// A Track Segment holds a list of Track Points which are logically connected
  /// in order. To represent a single GPS track where GPS reception was lost, or
  /// the GPS receiver was turned off, start a new Track Segment for each
  /// continuous span of track data.
  List<Wpt> points;

  Color fillColor;
  Color outlineColor;

  int outlineWidth;

  /// Construct a new [Trk] object.
  Polygon(
      {this.name,
      this.cmt,
      this.desc,
      this.src,
      List<Link>? links,
      this.number,
      this.type,
      Map<String, String>? extensions,
      List<Wpt>? points,
      Color fillColor = Colors.black,
      this.outlineColor = Colors.black,
      this.outlineWidth = 1})
      : links = links ?? [],
        extensions = extensions ?? <String, String>{},
        fillColor = fillColor.withOpacity(0.8),
        points = points ?? [];

  @override
  // ignore: type_annotate_public_apis
  bool operator ==(other) {
    if (other is Polygon) {
      return other.name == name &&
          other.cmt == cmt &&
          other.desc == desc &&
          other.src == src &&
          const ListEquality().equals(other.links, links) &&
          other.number == number &&
          other.type == type &&
          const MapEquality().equals(other.extensions, extensions) &&
          const ListEquality().equals(other.points, points);
    }

    return false;
  }

  @override
  String toString() => "Polygon[${[name, type, extensions, points].join(",")}]";

  @override
  int get hashCode => hashObjects([
        name,
        cmt,
        desc,
        src,
        number,
        type,
        ...links,
        ...extensions.keys,
        ...extensions.values,
        ...points
      ]);
}
