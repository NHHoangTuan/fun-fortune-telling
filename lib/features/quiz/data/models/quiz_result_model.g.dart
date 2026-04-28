// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizResultModelAdapter extends TypeAdapter<QuizResultModel> {
  @override
  final int typeId = 0;

  @override
  QuizResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizResultModel(
      quizId: fields[0] as String,
      resultKey: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] as String,
      emoji: fields[4] as String,
      savedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QuizResultModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.quizId)
      ..writeByte(1)
      ..write(obj.resultKey)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.emoji)
      ..writeByte(5)
      ..write(obj.savedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResultModelImpl _$$QuizResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizResultModelImpl(
      quizId: json['quizId'] as String,
      resultKey: json['resultKey'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      emoji: json['emoji'] as String,
      savedAt: DateTime.parse(json['savedAt'] as String),
    );

Map<String, dynamic> _$$QuizResultModelImplToJson(
        _$QuizResultModelImpl instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'resultKey': instance.resultKey,
      'title': instance.title,
      'description': instance.description,
      'emoji': instance.emoji,
      'savedAt': instance.savedAt.toIso8601String(),
    };
