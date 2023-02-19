

part of 'check_index_bloc.dart';

class CheckIndexState {
  final int? index;
  CheckIndexState({
    this.index,
  });

  CheckIndexState copyWith({
    int? index,
  }) {
    return CheckIndexState(
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(index != null){
      result.addAll({'index': index});
    }
  
    return result;
  }

  factory CheckIndexState.fromMap(Map<String, dynamic> map) {
    return CheckIndexState(
      index: map['index']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckIndexState.fromJson(String source) => CheckIndexState.fromMap(json.decode(source));

  @override
  String toString() => 'CheckIndexState(index: $index)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CheckIndexState &&
      other.index == index;
  }

  @override
  int get hashCode => index.hashCode;
}

class CheckIndexInitial extends CheckIndexState {}
