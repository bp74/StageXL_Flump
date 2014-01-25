part of stagexl_flump;

class _FlumpTexture implements BitmapDrawable {

  final RenderTextureQuad renderTextureQuad;
  final num originX;
  final num originY;

  _FlumpTexture(RenderTexture renderTexture, Map json) :
    this.originX = _ensureNum(json["origin"][0]),
    this.originY = _ensureNum(json["origin"][1]),
    this.renderTextureQuad = new RenderTextureQuad(renderTexture, 0, 0, 0,
        _ensureInt(json["rect"][0]), _ensureInt(json["rect"][1]),
        _ensureInt(json["rect"][2]), _ensureInt(json["rect"][3]));

  void render(RenderState renderState) {
    renderState.renderQuad(this.renderTextureQuad);
  }
}
