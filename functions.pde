void saveMask() {
  mask.save("data/mask.jpg");
  println("mask file saved");
}
void loadMask () {
  PImage savedMask = loadImage("mask.jpg");
  mask.clear();
  mask.blend(savedMask, 0, 0, width, height, 0, 0, width, height, ADD);
  println("mask file loaded");
}
void clearMask () {
  mask.clear();
  println("mask cleared");
}