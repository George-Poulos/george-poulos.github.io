class Keyboard extends Module {
  ArrayList<KeyboardKey> keys = new ArrayList<KeyboardKey>(27);
  int keyW;
  int keyH;
  int padding;
  int numKeys = 27; // 26 letters + backspace
  String keyMap = "qwertyuiopasdfghjklzxcvbnm";
  
  // Keyboard size if automatically calculated based on the key width and height
  public Keyboard(float locationX, float locationY, int keyWidth, int keyHeight, int p) {
    super(keyWidth * 10 + p*11, keyHeight * 3 + p*4, locationX, locationY);
    keyW = keyWidth;
    keyH = keyHeight;
    padding = p;
  }
  
  public void displayModule(){
    if (visibility) {
      // Draw keyboard base
      fill(128);
      rect(locationX, locationY, sizeX, sizeY);
      
      // Draw each key
      drawKeys();
    }
  }
  
  private void drawKeys() {
    calculateKeyLayout();
    
    for (KeyboardKey k : keys) {
      k.drawKey();
    }
  }
  
  private void calculateKeyLayout() {
    // Iterate thru keys array & set the proper key from the key map
    // We use the keyboard location as the origin for the keys
    for (int i = 0; i < numKeys; i++) {
      int row = 0; // Row on standard keyboard
      int column = i; // Used to keep the keys from drawing on one long line
      int paddingx = (i+1) * padding; // Allow first key to have padding
      int paddingy = padding;
      
      // Compute row & column based on what key we're on
      if (i >= 10) {
        row = 1;
        column = i % 10; // Start back at the beginning
        paddingx = (column + 1) * padding + keyW/2; // Resets padding back to small values & indents by half a key
        paddingy = 2*padding; // Second row needs extra vertical padding
      }
      if (i >= 19) {
        row = 2;
        column = i % 19; // Start back at the beginning
        paddingx = (column + 1) * padding + keyW; // Resets padding back to small values & indents by and additional half key
        paddingy = 3*padding; // Third row needs extra vertical padding
      }
      
      // Store calculated key
      if (i < numKeys - 1) {
        keys.add(i,
          new KeyboardKey(
            (int) locationX + column*keyW + paddingx,
            (int) locationY + row*keyH + paddingy,
            keyW,
            keyH,
            "" + keyMap.charAt(i),
            20
          )
        );
      }
      // Backspace key
      else {
        keys.add(i,
          new KeyboardKey(
            (int) locationX + column*keyW + paddingx,
            (int) locationY + row*keyH + paddingy,
            keyW*2,
            keyH,
            "<",
            20
          )
        );
      } 
    }
  }
}

class KeyboardKey extends Panel implements ActionListener {
  String letter;
  int fontSize;
  
  public KeyboardKey(int x, int y, int w, int h, String c, int f) {
    super(x, y, w, h);
    letter = c;
    fontSize = f;
  }
  
  public void drawKey() {
    // Draw shape
    stroke(152);
    fill(160);
    rect(locX, locY, szWidth, szHeight, 5);
    
    // Draw text
    fill(255);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    // Backspace
    if (letter.equals("<")) {
      text("DEL", locX + szWidth/2, locY + szHeight/2);  
    }
    // Regular letters
    else {
      text(letter, locX + szWidth/2, locY + szHeight/2);
    }
  }
  
  public void on_Click() {
    if (is_MouseOverItem())
      println(letter);
  }
}