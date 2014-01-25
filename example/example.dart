library example01;

import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'package:stagexl_flump/stagexl_flump.dart';

void main() {

  var stage = new Stage(html.querySelector('#stage'), webGL: true);
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  FlumpLibrary.load('images/flumpLibrary.json').then((flumpLibrary) {

    var idle = new FlumpMovie(flumpLibrary, 'idle');
    idle.x = 150;
    idle.y = 250;
    stage.addChild(idle);
    stage.juggler.add(idle);

    var walk = new FlumpMovie(flumpLibrary, 'walk');
    walk.x = 400;
    walk.y = 250;
    stage.addChild(walk);
    stage.juggler.add(walk);

    var attack = new FlumpMovie(flumpLibrary, 'attack');
    attack.x = 650;
    attack.y = 250;
    stage.addChild(attack);
    stage.juggler.add(attack);

    var defeat = new FlumpMovie(flumpLibrary, 'defeat');
    defeat.x = 400;
    defeat.y = 550;
    stage.addChild(defeat);
    stage.juggler.add(defeat);
  });

}

