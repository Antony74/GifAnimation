/*
* Demonstrates the creation of gifs with ImageMagick.
 * Exports a GIF-File to the sketch folder if space
 * bar is pressed. Wow, feels like 90's! ;)
 */

import processing.opengl.*;

PImage logo;
float rotation = 0.0;

public void setup() {
  size(200, 200, OPENGL);
  frameRate(12);
  logo = loadImage("processing.png");
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotation+=.1;
  rotateY(rotation);
  image(logo, -logo.width/2,-logo.height/2);
  saveFrame("frames/frame-######.png");
}

void keyPressed() {
  try {
    String sCmd = "magick " + sketchPath() + "/frames/*.png -delay 0 -loop 0 -alpha set -dispose previous " + sketchPath() + "/export.gif";
    println(sCmd);
    Process pr = Runtime.getRuntime().exec(sCmd);
    pr.waitFor();
  } catch(Exception e) {
    println(e);
  }

  println("gif saved");
}