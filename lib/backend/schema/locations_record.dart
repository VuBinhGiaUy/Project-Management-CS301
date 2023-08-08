import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsRecord extends FirestoreRecord {
  LocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "locationCountry" field.
  String? _locationCountry;
  String get locationCountry => _locationCountry ?? '';
  bool hasLocationCountry() => _locationCountry != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "LatLong" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  bool hasLatLong() => _latLong != null;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _locationCountry = snapshotData['locationCountry'] as String?;
    _name = snapshotData['name'] as String?;
    _latLong = snapshotData['LatLong'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locations');

  static Stream<LocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationsRecord.fromSnapshot(s));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationsRecord.fromSnapshot(s));

  static LocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationsRecordData({
  String? address,
  String? locationCountry,
  String? name,
  LatLng? latLong,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'locationCountry': locationCountry,
      'name': name,
      'LatLong': latLong,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationsRecordDocumentEquality implements Equality<LocationsRecord> {
  const LocationsRecordDocumentEquality();

  @override
  bool equals(LocationsRecord? e1, LocationsRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.locationCountry == e2?.locationCountry &&
        e1?.name == e2?.name &&
        e1?.latLong == e2?.latLong;
  }

  @override
  int hash(LocationsRecord? e) => const ListEquality()
      .hash([e?.address, e?.locationCountry, e?.name, e?.latLong]);

  @override
  bool isValidKey(Object? o) => o is LocationsRecord;
}
