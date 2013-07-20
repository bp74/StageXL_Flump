part of stagexl_flump;

class _FlumpTextureGroup {

  FlumpLibrary flumpLibrary;
  Map<String, _FlumpTexture> flumpTextures;
  Completer completer;

  _FlumpTextureGroup(Map json, this.flumpLibrary) {

    this.flumpTextures = new Map<String, _FlumpTexture>();
    this.completer = new Completer();

    var imageLoadCount = 0;

    for(var atlas in json["atlases"] as List) {
      var file = atlas["file"] as String;
      var url = _replaceFilename(flumpLibrary._url, file);

      imageLoadCount++;

      var imageElement = new ImageElement();

      imageElement.onLoad.listen((event) {
        if (--imageLoadCount == 0)
          this.completer.complete(this);
      });

      imageElement.onError.listen((event) {
        this.completer.completeError(new StateError("Failed to load image."));
      });

      imageElement.src = url;

      for(var texture in atlas["textures"] as List) {
        var symbol = texture["symbol"] as String;
        var rect = texture["rect"] as List;
        var origin = texture["origin"] as List;

        var flumpTexture = new _FlumpTexture(
          rect[0], rect[1], rect[2], rect[3],
          origin[0], origin[1],
          imageElement);

        this.flumpTextures[symbol] = flumpTexture;
      }
    }
  }

  //-----------------------------------------------------------------------------------------------

  String _replaceFilename(String url, String filename) {

    RegExp regex = new RegExp(r"^(.*/)?(?:$|(.+?)(?:(\.[^.]*$)|$))", multiLine:false, caseSensitive:false);
    Match match = regex.firstMatch(url);
    String path = match.group(1);
    return (path == null) ? filename : "$path$filename";
  }
}
