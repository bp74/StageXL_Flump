part of stagexl_flump;

class FlumpLibrary {

  String _url;
  String _md5;
  int _frameRate;
  final List<_FlumpMovieData> _movieDatas = new List<_FlumpMovieData>();
  final List<_FlumpTextureGroup> _textureGroups = new List<_FlumpTextureGroup>();

  static Future<FlumpLibrary> load(String url) {

    var completer = new Completer<FlumpLibrary>();

    HttpRequest.getString(url).then((flumpJson) {

      var data = json.parse(flumpJson) as Map;
      var textureGroupLoaders = new List();
      var flumpLibrary = new FlumpLibrary();

      flumpLibrary._url = url;
      flumpLibrary._md5 = data["md5"];
      flumpLibrary._frameRate = data["frameRate"].toInt();

      for(var movieJson in data["movies"] as List) {
        var flumpMovieData = new _FlumpMovieData(movieJson, flumpLibrary);
        flumpLibrary._movieDatas.add(flumpMovieData);
      }

      for(var textureGroupJson in data["textureGroups"] as List) {
        var flumpTextureGroup = new _FlumpTextureGroup(textureGroupJson, flumpLibrary);
        flumpLibrary._textureGroups.add(flumpTextureGroup);
        textureGroupLoaders.add(flumpTextureGroup.completer.future);
      }

      Future.wait(textureGroupLoaders).then((value) {
        completer.complete(flumpLibrary);
      }).catchError((error) {
        completer.completeError(new StateError("Failed to load image."));
      });

    }).catchError((error) {

      completer.completeError(new StateError("Failed to load json file."));

    });

    return completer.future;
  }

  _FlumpMovieData _getFlumpMovieData(String name) {
    for(var movie in _movieDatas)
      if (movie.id == name)
        return movie;

    throw new ArgumentError("The movie '$name' is not available.");
  }

  BitmapDrawable _createSymbol(String name) {
    for(var textureGroup in _textureGroups) {
      if (textureGroup.flumpTextures.containsKey(name)) {
        return textureGroup.flumpTextures[name];
      }
    }

    for(var movieData in _movieDatas) {
      if (movieData.id == name) {
        return new FlumpMovie(this, name);
      }
    }

    throw new ArgumentError("The symbol '$name' is not available.");
  }
}
