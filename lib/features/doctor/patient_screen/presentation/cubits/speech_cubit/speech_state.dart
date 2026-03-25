part of 'speech_cubit.dart';

class SpeechState {
  final bool isListening;
  final String recognizedText;
  final String selectedLanguage;

  SpeechState({
    required this.isListening,
    required this.recognizedText,
    required this.selectedLanguage,
  });

  SpeechState copyWith({
    bool? isListening,
    String? recognizedText,
    String? selectedLanguage,
  }) {
    return SpeechState(
      isListening: isListening ?? this.isListening,
      recognizedText: recognizedText ?? this.recognizedText,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
