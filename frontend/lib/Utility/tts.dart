import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:language/Models/words.dart';
import 'package:language/Utility/utils.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({required this.language, required this.word});

  final String language;
  final Word word;
  @override
  State<TTSButton> createState() => _TTSButtonState();
}

class _TTSButtonState extends State<TTSButton> {
  FlutterTts tts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (widget.language != '') {
            setTTS(widget.language, widget.word);
          } else {
            showSnackBar(context, 'You need to select a language.');
          }
        },
        icon: const Icon(Icons.volume_up_rounded));
  }

  setTTS(String language, Word word) async {
    String ttsLanguage = '';
    String toSpeak = '';
    switch (language) {
      case 'Chinese':
        ttsLanguage = 'zh-CN';
        toSpeak = word.chineseTranslation;
        break;
      case 'German':
        ttsLanguage = 'de-DE';
        toSpeak = word.germanTranslation;
        break;
      case 'Korean':
        ttsLanguage = 'ko-KR';
        toSpeak = word.koreanTranslation;
        break;
      case 'Spanish':
        ttsLanguage = 'es-ES';
        toSpeak = word.spanishTranslation;
        break;
      default:
    }
    await tts.setLanguage(ttsLanguage);
    await tts.setSpeechRate(1.0);
    await tts.speak(toSpeak);
  }
}
