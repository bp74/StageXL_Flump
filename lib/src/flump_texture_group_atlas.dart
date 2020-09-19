part of stagexl_flump;

class _FlumpTextureGroupAtlas {
  final RenderTexture renderTexture;
  final Map<String, _FlumpTexture> flumpTextures;

  _FlumpTextureGroupAtlas(RenderTexture renderTexture, Map json)
      : renderTexture = renderTexture,
        flumpTextures = {
          for (var jsonTexture in json['textures'])
            _ensureString(jsonTexture['symbol']):
                _FlumpTexture(renderTexture, jsonTexture)
        };

  static Future<_FlumpTextureGroupAtlas> load(
      FlumpLibrary flumpLibrary, Map json) {
    var file = _ensureString(json['file']);
    var regex = RegExp(r'^(.*/)?(?:$|(.+?)(?:(\.[^.]*$)|$))');
    var match = regex.firstMatch(flumpLibrary._url);
    var path = match.group(1);
    var url = (path == null) ? file : '$path$file';

    return BitmapData.load(url).then((bitmapData) {
      var renderTexture = bitmapData.renderTexture;
      return _FlumpTextureGroupAtlas(renderTexture, json);
    });
  }
}
