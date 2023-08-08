import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranslationsRecord extends FirestoreRecord {
  TranslationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "languageCode" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  bool hasLanguageCode() => _languageCode != null;

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "translationText" field.
  String? _translationText;
  String get translationText => _translationText ?? '';
  bool hasTranslationText() => _translationText != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "createdOn" field.
  DateTime? _createdOn;
  DateTime? get createdOn => _createdOn;
  bool hasCreatedOn() => _createdOn != null;

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  bool hasPublic() => _public != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _languageCode = snapshotData['languageCode'] as String?;
    _audioUrl = snapshotData['audioUrl'] as String?;
    _translationText = snapshotData['translationText'] as String?;
    _text = snapshotData['text'] as String?;
    _createdOn = snapshotData['createdOn'] as DateTime?;
    _public = snapshotData['public'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('translations');

  static Stream<TranslationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TranslationsRecord.fromSnapshot(s));

  static Future<TranslationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TranslationsRecord.fromSnapshot(s));

  static TranslationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TranslationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TranslationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TranslationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TranslationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TranslationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranslationsRecordData({
  String? languageCode,
  String? audioUrl,
  String? translationText,
  String? text,
  DateTime? createdOn,
  bool? public,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'languageCode': languageCode,
      'audioUrl': audioUrl,
      'translationText': translationText,
      'text': text,
      'createdOn': createdOn,
      'public': public,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class TranslationsRecordDocumentEquality
    implements Equality<TranslationsRecord> {
  const TranslationsRecordDocumentEquality();

  @override
  bool equals(TranslationsRecord? e1, TranslationsRecord? e2) {
    return e1?.languageCode == e2?.languageCode &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.translationText == e2?.translationText &&
        e1?.text == e2?.text &&
        e1?.createdOn == e2?.createdOn &&
        e1?.public == e2?.public &&
        e1?.user == e2?.user;
  }

  @override
  int hash(TranslationsRecord? e) => const ListEquality().hash([
        e?.languageCode,
        e?.audioUrl,
        e?.translationText,
        e?.text,
        e?.createdOn,
        e?.public,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is TranslationsRecord;
}
