

class ResponseModel {
  String? _word;
  String? _phonetic;
  List<Phonetics>? _phonetics;
  List<Meanings>? _meanings;
  License? _license;
  List<String>? _sourceUrls;

  ResponseModel(
      {String? word,
        String? phonetic,
        List<Phonetics>? phonetics,
        List<Meanings>? meanings,
        License? license,
        List<String>? sourceUrls}) {
    if (word != null) {
      this._word = word;
    }
    if (phonetic != null) {
      this._phonetic = phonetic;
    }
    if (phonetics != null) {
      this._phonetics = phonetics;
    }
    if (meanings != null) {
      this._meanings = meanings;
    }
    if (license != null) {
      this._license = license;
    }
    if (sourceUrls != null) {
      this._sourceUrls = sourceUrls;
    }
  }

  String? get word => _word;
  set word(String? word) => _word = word;
  String? get phonetic => _phonetic;
  set phonetic(String? phonetic) => _phonetic = phonetic;
  List<Phonetics>? get phonetics => _phonetics;
  set phonetics(List<Phonetics>? phonetics) => _phonetics = phonetics;
  List<Meanings>? get meanings => _meanings;
  set meanings(List<Meanings>? meanings) => _meanings = meanings;
  License? get license => _license;
  set license(License? license) => _license = license;
  List<String>? get sourceUrls => _sourceUrls;
  set sourceUrls(List<String>? sourceUrls) => _sourceUrls = sourceUrls;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    _word = json['word'];
    _phonetic = json['phonetic'];
    if (json['phonetics'] != null) {
      _phonetics = <Phonetics>[];
      json['phonetics'].forEach((v) {
        _phonetics!.add(new Phonetics.fromJson(v));
      });
    }
    if (json['meanings'] != null) {
      _meanings = <Meanings>[];
      json['meanings'].forEach((v) {
        _meanings!.add(new Meanings.fromJson(v));
      });
    }
    _license =
    json['license'] != null ? new License.fromJson(json['license']) : null;
    _sourceUrls = json['sourceUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this._word;
    data['phonetic'] = this._phonetic;
    if (this._phonetics != null) {
      data['phonetics'] = this._phonetics!.map((v) => v.toJson()).toList();
    }
    if (this._meanings != null) {
      data['meanings'] = this._meanings!.map((v) => v.toJson()).toList();
    }
    if (this._license != null) {
      data['license'] = this._license!.toJson();
    }
    data['sourceUrls'] = this._sourceUrls;
    return data;
  }
}

class Phonetics {
  String? _text;
  String? _audio;
  String? _sourceUrl;

  Phonetics({String? text, String? audio, String? sourceUrl}) {
    if (text != null) {
      this._text = text;
    }
    if (audio != null) {
      this._audio = audio;
    }
    if (sourceUrl != null) {
      this._sourceUrl = sourceUrl;
    }
  }

  String? get text => _text;
  set text(String? text) => _text = text;
  String? get audio => _audio;
  set audio(String? audio) => _audio = audio;
  String? get sourceUrl => _sourceUrl;
  set sourceUrl(String? sourceUrl) => _sourceUrl = sourceUrl;

  Phonetics.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _audio = json['audio'];
    _sourceUrl = json['sourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['audio'] = this._audio;
    data['sourceUrl'] = this._sourceUrl;
    return data;
  }
}

class Meanings {
  String? _partOfSpeech;
  List<Definitions>? _definitions;
  List<String>? _synonyms;
  List<String>? _antonyms;

  Meanings(
      {String? partOfSpeech,
        List<Definitions>? definitions,
        List<String>? synonyms,
        List<String>? antonyms}) {
    if (partOfSpeech != null) {
      this._partOfSpeech = partOfSpeech;
    }
    if (definitions != null) {
      this._definitions = definitions;
    }
    if (synonyms != null) {
      this._synonyms = synonyms;
    }
    if (antonyms != null) {
      this._antonyms = antonyms;
    }
  }

  String? get partOfSpeech => _partOfSpeech;
  set partOfSpeech(String? partOfSpeech) => _partOfSpeech = partOfSpeech;
  List<Definitions>? get definitions => _definitions;
  set definitions(List<Definitions>? definitions) => _definitions = definitions;
  List<String>? get synonyms => _synonyms;
  set synonyms(List<String>? synonyms) => _synonyms = synonyms;
  List<String>? get antonyms => _antonyms;
  set antonyms(List<String>? antonyms) => _antonyms = antonyms;

  Meanings.fromJson(Map<String, dynamic> json) {
    _partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      _definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        _definitions!.add(new Definitions.fromJson(v));
      });
    }
    _synonyms = json['synonyms'].cast<String>();
    _antonyms = json['antonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partOfSpeech'] = this._partOfSpeech;
    if (this._definitions != null) {
      data['definitions'] = this._definitions!.map((v) => v.toJson()).toList();
    }
    data['synonyms'] = this._synonyms;
    data['antonyms'] = this._antonyms;
    return data;
  }
}

class Definitions {
  String? _definition;
  List<String>? _synonyms;
  List<String>? _antonyms;
  String? _example;

  Definitions(
      {String? definition,
        List<String>? synonyms,
        List<String>? antonyms,
        String? example}) {
    if (definition != null) {
      this._definition = definition;
    }
    if (synonyms != null) {
      this._synonyms = synonyms;
    }
    if (antonyms != null) {
      this._antonyms = antonyms;
    }
    if (example != null) {
      this._example = example;
    }
  }

  String? get definition => _definition;
  set definition(String? definition) => _definition = definition;
  List<String>? get synonyms => _synonyms;
  set synonyms(List<String>? synonyms) => _synonyms = synonyms;
  List<String>? get antonyms => _antonyms;
  set antonyms(List<String>? antonyms) => _antonyms = antonyms;
  String? get example => _example;
  set example(String? example) => _example = example;

  Definitions.fromJson(Map<String, dynamic> json) {
    _definition = json['definition'];
    _synonyms = json['synonyms'].cast<String>();
    _antonyms = json['antonyms'].cast<String>();
    _example = json['example'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this._definition;
    data['synonyms'] = this._synonyms;
    data['antonyms'] = this._antonyms;
    data['example'] = this._example;
    return data;
  }
}

class License {
  String? _name;
  String? _url;

  License({String? name, String? url}) {
    if (name != null) {
      this._name = name;
    }
    if (url != null) {
      this._url = url;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get url => _url;
  set url(String? url) => _url = url;

  License.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['url'] = this._url;
    return data;
  }
}
