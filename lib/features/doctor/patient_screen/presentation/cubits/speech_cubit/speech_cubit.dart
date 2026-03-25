import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:main_app/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  Timer? _silenceTimer;
  final double _silenceThreshold = -30.0;
  final Duration _silenceDuration = Duration(seconds: 2);

  SpeechCubit()
    : super(
        SpeechState(
          isListening: false,
          recognizedText: 'Initializing...',
          selectedLanguage: 'en-US',
        ),
      ) {
    _initSpeech();
  }
  final diagnosis = TextEditingController();
  void textToEdit() {
    diagnosis.text = state.recognizedText;
  }

  final languageMap = {'en-US': LangKeys.english, 'ar-SA': LangKeys.arabic};

  Future<void> _initSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          _silenceTimer?.cancel();
          _silenceTimer = null;
          if (!isClosed) {
            emit(state.copyWith(isListening: false));
          }
        }
      },
      onError: (error) => debugPrint('Error: $error'),
    );
    if (available) {
      if (!isClosed) {
        emit(
          state.copyWith(recognizedText: 'Press the button and start speaking'),
        );
      }
    } else {
      if (!isClosed) {
        emit(
          state.copyWith(recognizedText: 'Speech recognition not available'),
        );
      }
    }
  }

  void startListening() {
    if (!state.isListening &&
        state.recognizedText != 'Speech recognition not available') {
      _speech.listen(
        onResult: (result) {
          if (!isClosed) {
            emit(state.copyWith(recognizedText: result.recognizedWords));
          }
        },
        localeId: state.selectedLanguage,
        onSoundLevelChange: (level) {
          if (!isClosed) {
            _onSoundLevelChange(level);
          }
        },
      );
      if (!isClosed) {
        emit(state.copyWith(isListening: true));
      }
    }
  }

  void stopListening() {
    if (state.isListening) {
      _speech.stop();
      _silenceTimer?.cancel();
      _silenceTimer = null;
      if (!isClosed) {
        textToEdit();
        emit(state.copyWith(isListening: false));
      }
    }
  }

  void switchLanguage(String language) {
    if (state.isListening) {
      stopListening();
    }
    if (!isClosed) {
      emit(state.copyWith(selectedLanguage: language));
    }
  }

  void _onSoundLevelChange(double level) {
    if (level < _silenceThreshold) {
      _silenceTimer ??= Timer(_silenceDuration, () {
        stopListening();
      });
    } else {
      _silenceTimer?.cancel();
      _silenceTimer = null;
    }
  }

  @override
  Future<void> close() {
    _silenceTimer?.cancel();
    _speech.stop();
    return super.close();
  }
}
