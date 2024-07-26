// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class quistionmodel {
  String quistion = '';
  num? id;
  bool? gende;
  bool? poir;

  bool? study;

  bool? merred;
  quistionmodel({
    required this.quistion,
    this.id,
    this.gende,
    this.poir,
    this.study,
    this.merred,
  });

  quistionmodel copyWith({
    String? quistion,
    num? id,
    bool? gende,
    bool? poir,
    bool? study,
    bool? merred,
  }) {
    return quistionmodel(
      quistion: quistion ?? this.quistion,
      id: id ?? this.id,
      gende: gende ?? this.gende,
      poir: poir ?? this.poir,
      study: study ?? this.study,
      merred: merred ?? this.merred,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quistion': quistion,
      'id': id,
      'gende': gende,
      'poir': poir,
      'study': study,
      'merred': merred,
    };
  }

  factory quistionmodel.fromMap(Map<String, dynamic> map) {
    return quistionmodel(
      quistion: map['quistion'] as String,
      id: map['id'] != null ? map['id'] as num : null,
      gende: map['gende'] != null ? map['gende'] as bool : null,
      poir: map['poir'] != null ? map['poir'] as bool : null,
      study: map['study'] != null ? map['study'] as bool : null,
      merred: map['merred'] != null ? map['merred'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory quistionmodel.fromJson(String source) =>
      quistionmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'quistionmodel(quistion: $quistion, id: $id, gende: $gende, poir: $poir, study: $study, merred: $merred)';
  }

  @override
  bool operator ==(covariant quistionmodel other) {
    if (identical(this, other)) return true;

    return other.quistion == quistion &&
        other.id == id &&
        other.gende == gende &&
        other.poir == poir &&
        other.study == study &&
        other.merred == merred;
  }

  @override
  int get hashCode {
    return quistion.hashCode ^
        id.hashCode ^
        gende.hashCode ^
        poir.hashCode ^
        study.hashCode ^
        merred.hashCode;
  }
}
