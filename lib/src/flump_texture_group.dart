part of stagexl_flump;

class _FlumpTextureGroup {
  final List<_FlumpTextureGroupAtlas> flumpTextureGroupAtlases;
  final Map<String, _FlumpTexture> flumpTextures;

  _FlumpTextureGroup(this.flumpTextureGroupAtlases, this.flumpTextures);

  static Future<_FlumpTextureGroup> load(FlumpLibrary flumpLibrary, Map json) {
    var loaders = (json['atlases'] as List).map(
        (jsonAtlas) => _FlumpTextureGroupAtlas.load(flumpLibrary, jsonAtlas));

    return Future.wait(loaders).then((atlases) {
      var flumpTextures = <String, _FlumpTexture>{};
      atlases.forEach((atlas) => flumpTextures.addAll(atlas.flumpTextures));
      return _FlumpTextureGroup(atlases, flumpTextures);
    });
  }
}
