///
//  Generated code. Do not modify.
//  source: protos/poi.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use poiRequestDescriptor instead')
const PoiRequest$json = const {
  '1': 'PoiRequest',
};

/// Descriptor for `PoiRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List poiRequestDescriptor = $convert.base64Decode('CgpQb2lSZXF1ZXN0');
@$core.Deprecated('Use poiReplyDescriptor instead')
const PoiReply$json = const {
  '1': 'PoiReply',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'lat', '3': 2, '4': 1, '5': 1, '10': 'lat'},
    const {'1': 'lon', '3': 3, '4': 1, '5': 1, '10': 'lon'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'open_now', '3': 5, '4': 1, '5': 8, '10': 'openNow'},
    const {'1': 'website', '3': 6, '4': 1, '5': 9, '10': 'website'},
  ],
};

/// Descriptor for `PoiReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List poiReplyDescriptor = $convert.base64Decode('CghQb2lSZXBseRIOCgJpZBgBIAEoA1ICaWQSEAoDbGF0GAIgASgBUgNsYXQSEAoDbG9uGAMgASgBUgNsb24SEgoEbmFtZRgEIAEoCVIEbmFtZRIZCghvcGVuX25vdxgFIAEoCFIHb3Blbk5vdxIYCgd3ZWJzaXRlGAYgASgJUgd3ZWJzaXRl');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginReplyDescriptor instead')
const LoginReply$json = const {
  '1': 'LoginReply',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `LoginReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReplyDescriptor = $convert.base64Decode('CgpMb2dpblJlcGx5EhQKBXRva2VuGAEgASgJUgV0b2tlbg==');
const $core.Map<$core.String, $core.dynamic> PoiLocatorServiceBase$json = const {
  '1': 'PoiLocator',
  '2': const [
    const {'1': 'GetPois', '2': '.poi.PoiRequest', '3': '.poi.PoiReply', '6': true},
  ],
};

@$core.Deprecated('Use poiLocatorServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> PoiLocatorServiceBase$messageJson = const {
  '.poi.PoiRequest': PoiRequest$json,
  '.poi.PoiReply': PoiReply$json,
};

/// Descriptor for `PoiLocator`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List poiLocatorServiceDescriptor = $convert.base64Decode('CgpQb2lMb2NhdG9yEisKB0dldFBvaXMSDy5wb2kuUG9pUmVxdWVzdBoNLnBvaS5Qb2lSZXBseTAB');
const $core.Map<$core.String, $core.dynamic> AuthenticationServiceBase$json = const {
  '1': 'Authentication',
  '2': const [
    const {'1': 'Login', '2': '.poi.LoginRequest', '3': '.poi.LoginReply'},
  ],
};

@$core.Deprecated('Use authenticationServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> AuthenticationServiceBase$messageJson = const {
  '.poi.LoginRequest': LoginRequest$json,
  '.poi.LoginReply': LoginReply$json,
};

/// Descriptor for `Authentication`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List authenticationServiceDescriptor = $convert.base64Decode('Cg5BdXRoZW50aWNhdGlvbhIrCgVMb2dpbhIRLnBvaS5Mb2dpblJlcXVlc3QaDy5wb2kuTG9naW5SZXBseQ==');
