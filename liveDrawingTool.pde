/*
  Developped by Samy Barras
  samy.barras@gmail.com
  2018
  
  v1.0
  
*/

int size = 10;
boolean editMode = true;
boolean drawCursorPos = true;
PGraphics mask, consoleCanvas;
int areaSize = 0;

boolean gomme  = false;
boolean console  = true;
String mode = "pen";
 // syphon
import codeanticode.syphon.*;
int nServers = 2;
int frameNum = 0;
SyphonServer[] servers;

//
void setup() {
  //
  size(1280, 800, P3D);
  frameRate(24);
  noSmooth();
  blendMode(ADD);
  // canvas setup 
  mask = createGraphics(width,height);
  consoleCanvas = createGraphics(width,height);
  
  // Create syhpon servers to send frames out.
  servers = new SyphonServer[nServers];
  for (int i = 0; i < nServers; i++) { 
    servers[i] = new SyphonServer(this, "RIBOT - Syphon - "+i);
  }
  
}
//////////////Draw//////////////
void draw() {
  background(0);
  consoleCanvas.beginDraw();
    stroke(255);
    strokeWeight(1);
    if (console == true) {
      text(int(frameRate)+"fps", 40, 40);
      if (mode == "gomme") fill(255,0,0);
      else fill(255);
      text(mode + "      " + size, 40, 60);
      fill(255);
      text("shortcuts : ", 40, 100);
      text("e > drawing mode", 40, 120);
      text("i > show/hide infos", 40, 140);
      text("m > show mouse lines", 40, 160);
      text("g > switch pen/eraser", 40, 180);
      text("c > clear canvas", 40, 200);
      text("s > save mask", 40, 220);
      // draw cursor pos
    }
      if (drawCursorPos == true) {
        line(0, mouseY, width, mouseY); // y
        line(mouseX, 0, mouseX, height); // x
      }
      // draw cursor in edit mode
      if (editMode == true) {
        stroke(255,0,0);
        strokeWeight(1);
        //noFill();
        if (mode == "gomme") fill(255,0,0);
        else fill(255);
        ellipse(mouseX, mouseY, size, size);
        fill(255);
      }
  consoleCanvas.endDraw();
  /* -- */
  mask.beginDraw();
  mask.stroke(255);
  mask.strokeWeight(size);
  if (editMode == true){
    if (mousePressed == true) {      
      if(gomme == false) {
        mask.stroke(255);
      }
      else {
        mask.stroke(0);
      }
      mask.line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
  mask.endDraw();
  image(mask,0,0);
  // syphon output
  servers[0].sendScreen();
} 