//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;
import 'google/protobuf/wrappers.pb.dart' as $4;
import 'location.pb.dart' as $5;
import 'message.pbenum.dart';

export 'message.pbenum.dart';

enum Message_Struct {
  placesStruct, 
  routeStruct, 
  placeDetailsStruct, 
  notSet
}

class Message extends $pb.GeneratedMessage {
  factory Message() => create();
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Message_Struct> _Message_StructByTag = {
    9 : Message_Struct.placesStruct,
    10 : Message_Struct.routeStruct,
    11 : Message_Struct.placeDetailsStruct,
    0 : Message_Struct.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', createEmptyInstance: create)
    ..oo(0, [9, 10, 11])
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..e<Role>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Role.UNKNOWN, valueOf: Role.valueOf, enumValues: Role.values)
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'sentAt', subBuilder: $3.Timestamp.create)
    ..aOM<$4.StringValue>(5, _omitFieldNames ? '' : 'clientId', subBuilder: $4.StringValue.create)
    ..aOM<PlaceExtraction>(6, _omitFieldNames ? '' : 'placeExtraction', subBuilder: PlaceExtraction.create)
    ..aOS(7, _omitFieldNames ? '' : 'content')
    ..aOS(8, _omitFieldNames ? '' : 'structName')
    ..aOM<PlacesStruct>(9, _omitFieldNames ? '' : 'placesStruct', subBuilder: PlacesStruct.create)
    ..aOM<RouteStruct>(10, _omitFieldNames ? '' : 'routeStruct', subBuilder: RouteStruct.create)
    ..aOM<PlaceDetailsStruct>(11, _omitFieldNames ? '' : 'placeDetailsStruct', subBuilder: PlaceDetailsStruct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  Message_Struct whichStruct() => _Message_StructByTag[$_whichOneof(0)]!;
  void clearStruct() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(Role v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  $3.Timestamp get sentAt => $_getN(3);
  @$pb.TagNumber(4)
  set sentAt($3.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSentAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentAt() => clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureSentAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.StringValue get clientId => $_getN(4);
  @$pb.TagNumber(5)
  set clientId($4.StringValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasClientId() => $_has(4);
  @$pb.TagNumber(5)
  void clearClientId() => clearField(5);
  @$pb.TagNumber(5)
  $4.StringValue ensureClientId() => $_ensure(4);

  @$pb.TagNumber(6)
  PlaceExtraction get placeExtraction => $_getN(5);
  @$pb.TagNumber(6)
  set placeExtraction(PlaceExtraction v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPlaceExtraction() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlaceExtraction() => clearField(6);
  @$pb.TagNumber(6)
  PlaceExtraction ensurePlaceExtraction() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get structName => $_getSZ(7);
  @$pb.TagNumber(8)
  set structName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStructName() => $_has(7);
  @$pb.TagNumber(8)
  void clearStructName() => clearField(8);

  @$pb.TagNumber(9)
  PlacesStruct get placesStruct => $_getN(8);
  @$pb.TagNumber(9)
  set placesStruct(PlacesStruct v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPlacesStruct() => $_has(8);
  @$pb.TagNumber(9)
  void clearPlacesStruct() => clearField(9);
  @$pb.TagNumber(9)
  PlacesStruct ensurePlacesStruct() => $_ensure(8);

  @$pb.TagNumber(10)
  RouteStruct get routeStruct => $_getN(9);
  @$pb.TagNumber(10)
  set routeStruct(RouteStruct v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRouteStruct() => $_has(9);
  @$pb.TagNumber(10)
  void clearRouteStruct() => clearField(10);
  @$pb.TagNumber(10)
  RouteStruct ensureRouteStruct() => $_ensure(9);

  @$pb.TagNumber(11)
  PlaceDetailsStruct get placeDetailsStruct => $_getN(10);
  @$pb.TagNumber(11)
  set placeDetailsStruct(PlaceDetailsStruct v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasPlaceDetailsStruct() => $_has(10);
  @$pb.TagNumber(11)
  void clearPlaceDetailsStruct() => clearField(11);
  @$pb.TagNumber(11)
  PlaceDetailsStruct ensurePlaceDetailsStruct() => $_ensure(10);
}

class PlaceExtraction extends $pb.GeneratedMessage {
  factory PlaceExtraction() => create();
  PlaceExtraction._() : super();
  factory PlaceExtraction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaceExtraction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlaceExtraction', createEmptyInstance: create)
    ..pc<ExtractedPlace>(1, _omitFieldNames ? '' : 'places', $pb.PbFieldType.PM, subBuilder: ExtractedPlace.create)
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'processedAt', subBuilder: $3.Timestamp.create)
    ..aOM<$4.StringValue>(3, _omitFieldNames ? '' : 'error', subBuilder: $4.StringValue.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaceExtraction clone() => PlaceExtraction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaceExtraction copyWith(void Function(PlaceExtraction) updates) => super.copyWith((message) => updates(message as PlaceExtraction)) as PlaceExtraction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaceExtraction create() => PlaceExtraction._();
  PlaceExtraction createEmptyInstance() => create();
  static $pb.PbList<PlaceExtraction> createRepeated() => $pb.PbList<PlaceExtraction>();
  @$core.pragma('dart2js:noInline')
  static PlaceExtraction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaceExtraction>(create);
  static PlaceExtraction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ExtractedPlace> get places => $_getList(0);

  @$pb.TagNumber(2)
  $3.Timestamp get processedAt => $_getN(1);
  @$pb.TagNumber(2)
  set processedAt($3.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProcessedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearProcessedAt() => clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureProcessedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $4.StringValue get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($4.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  $4.StringValue ensureError() => $_ensure(2);
}

class ExtractedPlace extends $pb.GeneratedMessage {
  factory ExtractedPlace() => create();
  ExtractedPlace._() : super();
  factory ExtractedPlace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExtractedPlace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExtractedPlace', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOM<GeocodedPlace>(2, _omitFieldNames ? '' : 'geocodedPlace', subBuilder: GeocodedPlace.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExtractedPlace clone() => ExtractedPlace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExtractedPlace copyWith(void Function(ExtractedPlace) updates) => super.copyWith((message) => updates(message as ExtractedPlace)) as ExtractedPlace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtractedPlace create() => ExtractedPlace._();
  ExtractedPlace createEmptyInstance() => create();
  static $pb.PbList<ExtractedPlace> createRepeated() => $pb.PbList<ExtractedPlace>();
  @$core.pragma('dart2js:noInline')
  static ExtractedPlace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExtractedPlace>(create);
  static ExtractedPlace? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  GeocodedPlace get geocodedPlace => $_getN(1);
  @$pb.TagNumber(2)
  set geocodedPlace(GeocodedPlace v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGeocodedPlace() => $_has(1);
  @$pb.TagNumber(2)
  void clearGeocodedPlace() => clearField(2);
  @$pb.TagNumber(2)
  GeocodedPlace ensureGeocodedPlace() => $_ensure(1);
}

class GeocodedPlace extends $pb.GeneratedMessage {
  factory GeocodedPlace() => create();
  GeocodedPlace._() : super();
  factory GeocodedPlace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeocodedPlace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GeocodedPlace', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'googlePlaceId')
    ..aOM<$5.LatLng>(2, _omitFieldNames ? '' : 'latLng', subBuilder: $5.LatLng.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GeocodedPlace clone() => GeocodedPlace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GeocodedPlace copyWith(void Function(GeocodedPlace) updates) => super.copyWith((message) => updates(message as GeocodedPlace)) as GeocodedPlace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GeocodedPlace create() => GeocodedPlace._();
  GeocodedPlace createEmptyInstance() => create();
  static $pb.PbList<GeocodedPlace> createRepeated() => $pb.PbList<GeocodedPlace>();
  @$core.pragma('dart2js:noInline')
  static GeocodedPlace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeocodedPlace>(create);
  static GeocodedPlace? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get googlePlaceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set googlePlaceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGooglePlaceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGooglePlaceId() => clearField(1);

  @$pb.TagNumber(2)
  $5.LatLng get latLng => $_getN(1);
  @$pb.TagNumber(2)
  set latLng($5.LatLng v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatLng() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatLng() => clearField(2);
  @$pb.TagNumber(2)
  $5.LatLng ensureLatLng() => $_ensure(1);
}

class MessageChunk extends $pb.GeneratedMessage {
  factory MessageChunk() => create();
  MessageChunk._() : super();
  factory MessageChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageChunk', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..e<Role>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Role.UNKNOWN, valueOf: Role.valueOf, enumValues: Role.values)
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'sentAt', subBuilder: $3.Timestamp.create)
    ..aOM<$4.StringValue>(5, _omitFieldNames ? '' : 'clientId', subBuilder: $4.StringValue.create)
    ..aOB(6, _omitFieldNames ? '' : 'isLast')
    ..aOS(7, _omitFieldNames ? '' : 'content')
    ..aOS(8, _omitFieldNames ? '' : 'structName')
    ..aOS(9, _omitFieldNames ? '' : 'struct')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageChunk clone() => MessageChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageChunk copyWith(void Function(MessageChunk) updates) => super.copyWith((message) => updates(message as MessageChunk)) as MessageChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageChunk create() => MessageChunk._();
  MessageChunk createEmptyInstance() => create();
  static $pb.PbList<MessageChunk> createRepeated() => $pb.PbList<MessageChunk>();
  @$core.pragma('dart2js:noInline')
  static MessageChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageChunk>(create);
  static MessageChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(Role v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  $3.Timestamp get sentAt => $_getN(3);
  @$pb.TagNumber(4)
  set sentAt($3.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSentAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentAt() => clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureSentAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.StringValue get clientId => $_getN(4);
  @$pb.TagNumber(5)
  set clientId($4.StringValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasClientId() => $_has(4);
  @$pb.TagNumber(5)
  void clearClientId() => clearField(5);
  @$pb.TagNumber(5)
  $4.StringValue ensureClientId() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get isLast => $_getBF(5);
  @$pb.TagNumber(6)
  set isLast($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsLast() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsLast() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get structName => $_getSZ(7);
  @$pb.TagNumber(8)
  set structName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStructName() => $_has(7);
  @$pb.TagNumber(8)
  void clearStructName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get struct => $_getSZ(8);
  @$pb.TagNumber(9)
  set struct($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStruct() => $_has(8);
  @$pb.TagNumber(9)
  void clearStruct() => clearField(9);
}

class PlacesStruct extends $pb.GeneratedMessage {
  factory PlacesStruct() => create();
  PlacesStruct._() : super();
  factory PlacesStruct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlacesStruct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlacesStruct', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prologue')
    ..aOS(2, _omitFieldNames ? '' : 'epilogue')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlacesStruct clone() => PlacesStruct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlacesStruct copyWith(void Function(PlacesStruct) updates) => super.copyWith((message) => updates(message as PlacesStruct)) as PlacesStruct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlacesStruct create() => PlacesStruct._();
  PlacesStruct createEmptyInstance() => create();
  static $pb.PbList<PlacesStruct> createRepeated() => $pb.PbList<PlacesStruct>();
  @$core.pragma('dart2js:noInline')
  static PlacesStruct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlacesStruct>(create);
  static PlacesStruct? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prologue => $_getSZ(0);
  @$pb.TagNumber(1)
  set prologue($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrologue() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrologue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get epilogue => $_getSZ(1);
  @$pb.TagNumber(2)
  set epilogue($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEpilogue() => $_has(1);
  @$pb.TagNumber(2)
  void clearEpilogue() => clearField(2);
}

class RouteStruct extends $pb.GeneratedMessage {
  factory RouteStruct() => create();
  RouteStruct._() : super();
  factory RouteStruct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RouteStruct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RouteStruct', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prologue')
    ..aOS(2, _omitFieldNames ? '' : 'epilogue')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RouteStruct clone() => RouteStruct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RouteStruct copyWith(void Function(RouteStruct) updates) => super.copyWith((message) => updates(message as RouteStruct)) as RouteStruct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RouteStruct create() => RouteStruct._();
  RouteStruct createEmptyInstance() => create();
  static $pb.PbList<RouteStruct> createRepeated() => $pb.PbList<RouteStruct>();
  @$core.pragma('dart2js:noInline')
  static RouteStruct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RouteStruct>(create);
  static RouteStruct? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prologue => $_getSZ(0);
  @$pb.TagNumber(1)
  set prologue($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrologue() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrologue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get epilogue => $_getSZ(1);
  @$pb.TagNumber(2)
  set epilogue($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEpilogue() => $_has(1);
  @$pb.TagNumber(2)
  void clearEpilogue() => clearField(2);
}

class PlaceDetailsStruct extends $pb.GeneratedMessage {
  factory PlaceDetailsStruct() => create();
  PlaceDetailsStruct._() : super();
  factory PlaceDetailsStruct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaceDetailsStruct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlaceDetailsStruct', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prologue')
    ..aOS(2, _omitFieldNames ? '' : 'epilogue')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaceDetailsStruct clone() => PlaceDetailsStruct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaceDetailsStruct copyWith(void Function(PlaceDetailsStruct) updates) => super.copyWith((message) => updates(message as PlaceDetailsStruct)) as PlaceDetailsStruct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaceDetailsStruct create() => PlaceDetailsStruct._();
  PlaceDetailsStruct createEmptyInstance() => create();
  static $pb.PbList<PlaceDetailsStruct> createRepeated() => $pb.PbList<PlaceDetailsStruct>();
  @$core.pragma('dart2js:noInline')
  static PlaceDetailsStruct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaceDetailsStruct>(create);
  static PlaceDetailsStruct? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prologue => $_getSZ(0);
  @$pb.TagNumber(1)
  set prologue($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrologue() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrologue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get epilogue => $_getSZ(1);
  @$pb.TagNumber(2)
  set epilogue($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEpilogue() => $_has(1);
  @$pb.TagNumber(2)
  void clearEpilogue() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
