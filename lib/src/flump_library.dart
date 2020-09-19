part of stagexl_flump;

class FlumpLibrary {
  final List<_FlumpMovieData> _movieDatas = <_FlumpMovieData>[];
  final List<_FlumpTextureGroup> _textureGroups = <_FlumpTextureGroup>[];

  String _url;
  String _md5;
  int _frameRate;

  static Future<FlumpLibrary> load(String url) async {
    var jsonString = await HttpRequest.getString(url);
    var jsonFlump = json.decode(jsonString);
    var textureGroupLoaders = <Future<_FlumpTextureGroup>>[];
    var flumpLibrary = FlumpLibrary();

    flumpLibrary._url = _ensureString(url);
    flumpLibrary._md5 = _ensureString(jsonFlump['md5']);
    flumpLibrary._frameRate = _ensureInt(jsonFlump['frameRate']);

    for (var jsonMovie in jsonFlump['movies'] as List) {
      var flumpMovieData = _FlumpMovieData(flumpLibrary, jsonMovie);
      flumpLibrary._movieDatas.add(flumpMovieData);
    }

    for (var jsonTextureGroup in jsonFlump['textureGroups'] as List) {
      var future = _FlumpTextureGroup.load(flumpLibrary, jsonTextureGroup);
      textureGroupLoaders.add(future);
    }

    var textureGroups = await Future.wait(textureGroupLoaders);
    flumpLibrary._textureGroups.addAll(textureGroups);
    return flumpLibrary;
  }

  //---------------------------------------------------------------------------

  String get url => _url;
  String get md5 => _md5;
  int get frameRate => _frameRate;

  //---------------------------------------------------------------------------

  _FlumpMovieData _getFlumpMovieData(String name) {
    for (var i = 0; i < _movieDatas.length; i++) {
      var movieData = _movieDatas[i];
      if (movieData.id == name) return movieData;
    }

    throw ArgumentError("The movie '$name' is not available.");
  }

  BitmapDrawable _createSymbol(String name) {
    for (var i = 0; i < _textureGroups.length; i++) {
      var flumpTextures = _textureGroups[i].flumpTextures;
      if (flumpTextures.containsKey(name)) return flumpTextures[name];
    }

    for (var i = 0; i < _movieDatas.length; i++) {
      var movieData = _movieDatas[i];
      if (movieData.id == name) return FlumpMovie(this, name);
    }

    throw ArgumentError("The symbol '$name' is not available.");
  }
}
