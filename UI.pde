void keyPressed() {
  switch(keyCode) {
    case UP :
      size++;
      break;
    case DOWN :
      if (size > 1) size--;
      break;
  }
  switch(key) {
    case 'e':
      editMode = !editMode;
      break;
    case 'g':
      gomme = !gomme;
      if (gomme == true) mode = "gomme";
      else mode = "pen";
      break;
    case 'l' :
      loadMask();
      break;
    case 'c' :
      clearMask();
      break;
    case 'i' :
      // show/hide infos console
      console = !console;
      break;
    case 's' :
      saveMask();
      break;
    case 'm' :
      drawCursorPos = !drawCursorPos;
      break;
  }
  
}

void mousePressed() {
  if(editMode == true) {
  }
}