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

class Role extends $pb.ProtobufEnum {
  static const Role ROLE_UNKNOWN = Role._(0, _omitEnumNames ? '' : 'ROLE_UNKNOWN');
  static const Role USER = Role._(1, _omitEnumNames ? '' : 'USER');
  static const Role OTOMO = Role._(2, _omitEnumNames ? '' : 'OTOMO');

  static const $core.List<Role> values = <Role> [
    ROLE_UNKNOWN,
    USER,
    OTOMO,
  ];

  static final $core.Map<$core.int, Role> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Role? valueOf($core.int value) => _byValue[value];

  const Role._($core.int v, $core.String n) : super(v, n);
}

class Transportation extends $pb.ProtobufEnum {
  static const Transportation TRANSPORTATION_UNKNOWN = Transportation._(0, _omitEnumNames ? '' : 'TRANSPORTATION_UNKNOWN');
  static const Transportation TRAIN = Transportation._(1, _omitEnumNames ? '' : 'TRAIN');
  static const Transportation AIRPLANE = Transportation._(2, _omitEnumNames ? '' : 'AIRPLANE');
  static const Transportation CAR = Transportation._(3, _omitEnumNames ? '' : 'CAR');
  static const Transportation SHIP = Transportation._(4, _omitEnumNames ? '' : 'SHIP');
  static const Transportation BUS = Transportation._(5, _omitEnumNames ? '' : 'BUS');
  static const Transportation BICYCLE = Transportation._(6, _omitEnumNames ? '' : 'BICYCLE');
  static const Transportation MOTORCYCLE = Transportation._(7, _omitEnumNames ? '' : 'MOTORCYCLE');
  static const Transportation WALKING = Transportation._(8, _omitEnumNames ? '' : 'WALKING');
  static const Transportation TAXI = Transportation._(9, _omitEnumNames ? '' : 'TAXI');
  static const Transportation OTHER = Transportation._(10, _omitEnumNames ? '' : 'OTHER');

  static const $core.List<Transportation> values = <Transportation> [
    TRANSPORTATION_UNKNOWN,
    TRAIN,
    AIRPLANE,
    CAR,
    SHIP,
    BUS,
    BICYCLE,
    MOTORCYCLE,
    WALKING,
    TAXI,
    OTHER,
  ];

  static final $core.Map<$core.int, Transportation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transportation? valueOf($core.int value) => _byValue[value];

  const Transportation._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
