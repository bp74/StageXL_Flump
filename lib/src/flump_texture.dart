part of stagexl_flump;

class _FlumpTexture implements BitmapDrawable {
  RenderTextureQuad _renderTextureQuad;
  num _originX;
  num _originY;

  _FlumpTexture(RenderTexture renderTexture, Map json) {
    var originX = _ensureNum(json['origin'][0]);
    var originY = _ensureNum(json['origin'][1]);
    var textureX = _ensureInt(json['rect'][0]);
    var textureY = _ensureInt(json['rect'][1]);
    var textureWidth = _ensureInt(json['rect'][2]);
    var textureHeight = _ensureInt(json['rect'][3]);

    _originX = originX;
    _originY = originY;
    _renderTextureQuad = RenderTextureQuad(
        renderTexture,
        Rectangle<int>(textureX, textureY, textureWidth, textureHeight),
        Rectangle<int>(0, 0, textureWidth, textureHeight),
        0,
        1.0);
  }

  num get originX => _originX;
  num get originY => _originY;

  RenderTextureQuad get renderTextureQuad => _renderTextureQuad;

  @override
  void render(RenderState renderState) {
    renderState.renderTextureQuad(renderTextureQuad);
  }
}
