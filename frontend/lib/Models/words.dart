class Word {
  Word({
    required this.unit,
    required this.part,
    required this.name,
    required this.chineseTranslation,
    required this.chineseTranslationPinyin,
    required this.germanTranslation,
    required this.koreanTranslation,
    required this.koreanTranslationRomanized,
    required this.spanishTranslation,
    this.image,
  });
  int unit;
  int part;
  String name;
  String chineseTranslation;
  String chineseTranslationPinyin;
  String germanTranslation;
  String koreanTranslation;
  String koreanTranslationRomanized;
  String spanishTranslation;
  String? image;

  /*
  Map<String, dynamic> toJson() => {
        'name': name,
        'chinese': chineseTranslation,
        'german': germanTranslation,
        'korean': koreanTranslation,
        'spanish': spanishTranslation,
        'favorite': favorite
      };

  static Word fromJson(Map<String, dynamic> json) => Word(
      name: json['name'],
      chineseTranslation: json['chinese'],
      germanTranslation: json['german'],
      koreanTranslation: json['korean'],
      spanishTranslation: json['spanish'],
      favorite: json['favorite']);
  */
}
