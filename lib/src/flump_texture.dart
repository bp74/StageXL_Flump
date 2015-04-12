part of stagexl_flump;

class _FlumpTexture implements BitmapDrawable {

  RenderTextureQuad _renderTextureQuad;
  num _originX;
  num _originY;

  _FlumpTexture(RenderTexture renderTexture, Map json) {

    num originX = _ensureNum(json["origin"][0]);
    num originY = _ensureNum(json["origin"][1]);
    int textureX = _ensureInt(json["rect"][0]);
    int textureY = _ensureInt(json["rect"][1]);
    int textureWidth = _ensureInt(json["rect"][2]);
    int textureHeight = _ensureInt(json["rect"][3]);

    _originX = originX;
    _originY = originY;
    _renderTextureQuad = new RenderTextureQuad(renderTexture,
        new Rectangle<int>(textureX, textureY, textureWidth, textureHeight),
        new Rectangle<int>(0, 0, textureWidth, textureHeight), 0, 1.0);
  }

  num get originX => _originX;
  num get originY => _originY;

  RenderTextureQuad get renderTextureQuad => _renderTextureQuad;

  void render(RenderState renderState) {
    renderState.renderQuad(this.renderTextureQuad);
  }
}
