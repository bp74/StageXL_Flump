library example01;

import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'package:stagexl_flump/stagexl_flump.dart';

void main() {

  var canvas = html.querySelector('#stage');
  var stage = new Stage('myStage', canvas);
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var loader = FlumpLibrary.load('images/flumpLibrary.json');
  loader.then((flumpLibrary) {

    var idle = new FlumpMovie(flumpLibrary, 'idle');
    idle.x = 150;
    idle.y = 250;
    stage.addChild(idle);

    var walk = new FlumpMovie(flumpLibrary, 'walk');
    walk.x = 400;
    walk.y = 250;
    stage.addChild(walk);

    var attack = new FlumpMovie(flumpLibrary, 'attack');
    attack.x = 650;
    attack.y = 250;
    stage.addChild(attack);

    var defeat = new FlumpMovie(flumpLibrary, 'defeat');
    defeat.x = 400;
    defeat.y = 550;
    stage.addChild(defeat);

    stage.juggler.add(idle);
    stage.juggler.add(walk);
    stage.juggler.add(attack);
    stage.juggler.add(defeat);
  });

}

