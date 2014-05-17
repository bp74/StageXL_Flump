part of stagexl_flump;

class _FlumpTextureGroupAtlas {

  final RenderTexture renderTexture;
  final Map<String, _FlumpTexture> flumpTextures;

  _FlumpTextureGroupAtlas(RenderTexture renderTexture, Map json) :
    this.renderTexture = renderTexture,
    this.flumpTextures = new Map.fromIterable(json["textures"],
        key: (jsonTexture) => _ensureString(jsonTexture["symbol"]),
        value: (jsonTexture) => new _FlumpTexture(renderTexture, jsonTexture));

  static Future<_FlumpTextureGroupAtlas> load(FlumpLibrary flumpLibrary, Map json) {

    var file = _ensureString(json["file"]);
    var regex = new RegExp(r"^(.*/)?(?:$|(.+?)(?:(\.[^.]*$)|$))");
    var match = regex.firstMatch(flumpLibrary._url);
    var path = match.group(1);
    var url = (path == null) ? file : "$path$file";

    return BitmapData.load(url).then((bitmapData) {
      var renderTexture = bitmapData.renderTexture;
      return new _FlumpTextureGroupAtlas(renderTexture, json);
    });
  }

}