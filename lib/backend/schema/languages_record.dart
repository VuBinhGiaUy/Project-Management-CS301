import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguagesRecord extends FirestoreRecord {
  LanguagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "languageCode" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  bool hasLanguageCode() => _languageCode != null;

  // "flagUrl" field.
  String? _flagUrl;
  String get flagUrl => _flagUrl ?? '';
  bool hasFlagUrl() => _flagUrl != null;

  void _initializeFields() {
    _language = snapshotData['language'] as String?;
    _languageCode = snapshotData['languageCode'] as String?;
    _flagUrl = snapshotData['flagUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('languages');

  static Stream<LanguagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LanguagesRecord.fromSnapshot(s));

  static Future<LanguagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LanguagesRecord.fromSnapshot(s));

  static LanguagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LanguagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LanguagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LanguagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LanguagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LanguagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLanguagesRecordData({
  String? language,
  String? languageCode,
  String? flagUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'language': language,
      'languageCode': languageCode,
      'flagUrl': flagUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class LanguagesRecordDocumentEquality implements Equality<LanguagesRecord> {
  const LanguagesRecordDocumentEquality();

  @override
  bool equals(LanguagesRecord? e1, LanguagesRecord? e2) {
    return e1?.language == e2?.language &&
        e1?.languageCode == e2?.languageCode &&
        e1?.flagUrl == e2?.flagUrl;
  }

  @override
  int hash(LanguagesRecord? e) =>
      const ListEquality().hash([e?.language, e?.languageCode, e?.flagUrl]);

  @override
  bool isValidKey(Object? o) => o is LanguagesRecord;
}
