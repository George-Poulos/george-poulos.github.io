
class initialize {
 
boolean inSetup;
color bg_default = color(197, 214, 224);
color bg;
color hover_tint = color(0, 153, 204);
float xmid;
float ymid;
float ybottom;
float scale;
float icon_size_small;
float icon_size_large;
float xheader;
float yheader;
float xheader_text;
float yheader_text;
float xfooter;
float yfooter;
PFont font;
String fnt = "MyriadPro-Regular.otf";
float font_size_large;
float font_size_small;
float spacing;
int wifi_instance;
String input_password;
int max_pass_length;

String [] arrName = {"super-wifi", "xfinity wifi", "FBI Surveillance Van"}; 
String [] strength = {"full", "low", "half"}; 
String [] password = {"abc123", "garbage", "password"}; 

class State{
  static final int OUT_OF_BOX = 0,
  SETUP = 1,
  SETUP_WIFI = 2,
  IDLE = 3,
  WIFI_ERROR = 4,
  CREATE_USER = 5;
  int v;
 
  public State(){
    v = 0;
  }
  int ordinal(){
    return v;
  }
}

class Setup {
  static final int LANGUAGE = 0,
  WIFI = 1,
  TIME = 2,
  DATE = 3,
  LOCATION = 4;
  int v;
 
  public Setup(){
    v = 0;
  }
  int ordinal(){
    return v;
  }
};

class Languages {
  static final int ENGLISH = 0,
  FRENCH = 1,
  SPANISH = 2;
  int v;
 
  public Languages(){
    v = 0;
  }
  int ordinal(){
    return v;
  }

};

String[] strLanguages = {
  "English",
  "Français",
  "Español"
};

String[] strLang = {
  "Language",
  "Langue",
  "Lengua"
};

String[] strWifi = {
  "Wi-fi",
  "Wi-fi",
  "Wi-fi"
};

String[] strTime = {
  "Time", 
  "Temps",
  "Hora"
};

String[] strDate = {
  "Date",
  "Date",
  "Fecha"
};

String[] strLocation = {
  "Location",
  "Position",
  "Posición"
};

String[] strNext = {
  "next",
  "continuer",
  "continuar"
};

String[] strSkip = {
  "skip wi-fi setup",
  "ignorer la configuration wi-fi",
  "saltar configuración wifi"
};

String[] strSSID = {
  "ssid:",
  "ssid:",
  "ssid:",
};

String[] strPassword = {
  "password:",
  "mot de passe:",
  "contraseña"
};

String[] strEnter = {
  "enter",
  "entrer",
  "entrar"
};

String[] strError = {
  "Wrong password, try again.",
  "Mot de passe erroné, réessayez.",
  "Contraseña incorrecta, vuelve a intentarlo."
};

String[] strBack = {
  "back",
  "reculer",
  "retroceder"
};

class Button {
  PImage icon;
  float x;
  float y;
  float size;
  boolean active;
  boolean isImg;
  String txt;

  Button(float xpos, float ypos, float sz, PImage pic, boolean clickable) {
    icon = pic;
    x = xpos;
    y = ypos;
    size = sz;
    active = clickable;
    isImg = true;
  }
  
  Button(float xpos, float ypos, float sz, PImage pic, String s, boolean clickable) {
    icon = pic;
    txt = s;
    x = xpos;
    y = ypos;
    size = sz;
    active = clickable;
    isImg = true;
  }
  
  Button(float xpos, float ypos, float sz, String t, boolean clickable) {
    txt = t;
    x = xpos;
    y = ypos;
    size = sz;
    active = clickable;
    isImg = false;
  }

  void display() {
    if(isImg) {
      imageMode(CENTER);
      if (isMouseOver() && active && isImg) {
        tint(hover_tint);
      } else {
        noTint();
      }
      image(icon, x, y, size, size);
    }
    else {
      if (isMouseOver() && active) {
        fill(hover_tint);
      } else {
        fill(255);
      }
      textSize(size);
      textAlign(LEFT);
      text(txt, x, y);
      fill(255);
    }
  }

  boolean isMouseOver() {
    float hsz = size/2;
    float x1 = x - hsz;
    float x2 = x + hsz;
    float y1 = y - hsz;
    float y2 = y + hsz;
    if(!isImg) {
      float adjustment = font_size_small*0.3;
      //x1 -= txt.length()*adjustment;
      x2 += txt.length()*1.8*adjustment;
      y1 -= 2*adjustment;
    }
    if (mouseX >= x1 && mouseX <= x2
      && mouseY >= y1 && mouseY <= y2) {
      return true;
    }
    else {
      return false;
    }
  }
  
  String getText() {
    return txt;
  }
  
  void setPos(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
  
  void changeText(String new_t) {
    txt = new_t;
  }
}

class Keyrow {
  Button[] keys;
  String mapping;
  int n;
  int x;
  int y;
  Keyrow(String s) {
    n = s.length();
    keys = new Button[n];
    mapping = s;
    for(int i = 0; i < n; i++) {
      String letter = "" + mapping.charAt(i);
      String letterext = letter + ".png";
      keys[i] = new Button(0, 0, icon_size_small, loadImage(letterext), letter, true);
    }
  }
  
  void setKey(int i, float xpos, float ypos) {
    keys[i].setPos(xpos, ypos);
  }
  
  void display() {
    for(int i = 0; i < n; i++) {
      keys[i].display();
    }
  }
  
  int getLength() {
    return n;
  }
  
  void update() {
    for(int i = 0; i < n; i++) {
      if(keys[i].isMouseOver()) {
        if(input_password.length() < max_pass_length) {
          input_password += keys[i].getText();
        }
      }
    }
  }
}

class kb {
  float x;
  float y;
  Keyrow[] rows;
  int nrows;
  
  kb(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    float x2;
    float y2;
    nrows = 4;
    rows = new Keyrow[nrows];
    rows[0] = new Keyrow("0123456789");
    x2 = x;
    y2 = y;
    for(int i = 0; i < rows[0].getLength(); i++) {
      rows[0].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
    rows[1] = new Keyrow("qwertyuiop");
    x2 = x;
    y2 += icon_size_small;
    for(int i = 0; i < rows[1].getLength(); i++) {
      rows[1].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
    y2 += icon_size_small;
    x2 = x + 0.5*icon_size_small;
    rows[2] = new Keyrow("asdfghjkl");
    for(int i = 0; i < rows[2].getLength(); i++) {
      rows[2].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
    y2 += icon_size_small;
    x2 = x + icon_size_small;
    rows[3] = new Keyrow("zxcvbnm");
    for(int i = 0; i < rows[3].getLength(); i++) {
      rows[3].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
  }
  
  void update() {
    max_pass_length = 17;
    for(int i = 0; i < nrows; i++) {
      rows[i].update();
    }
  }
  
  void display() {
    for(int i = 0; i < nrows; i++) {
      rows[i].display();
    }
  }
}


class np {
  float x;
  float y;
  Keyrow[] rows;
  int nrows;
  
  np(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    float x2;
    float y2;
    nrows = 4;
    rows = new Keyrow[nrows];
    rows[0] = new Keyrow("789");
    x2 = x;
    y2 = y;
    for(int i = 0; i < rows[0].getLength(); i++) {
      rows[0].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
    x2 = x;
    y2 += icon_size_small;
    rows[1] = new Keyrow("456");
    for(int i = 0; i < rows[1].getLength(); i++) {
      rows[1].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
    y2 += icon_size_small;
    rows[2] = new Keyrow("123");
    x2 = x;
    for(int i = 0; i < rows[2].getLength(); i++) {
      rows[2].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
    y2 += icon_size_small;
    x2 = x + icon_size_small;
    rows[3] = new Keyrow("0");
    for(int i = 0; i < rows[3].getLength(); i++) {
      rows[3].setKey(i, x2, y2);
      x2 += icon_size_small;
    }
  }
  
  void display() {
    for(int i = 0; i < nrows; i++) {
      rows[i].display();
    }
  }
}


kb osk;
np osnp;
Button power_button;
Button setup_language_icon;
Button setup_wifi_icon;
Button setup_time_icon;
Button setup_date_icon;
Button setup_location_icon;
Button setup_status_icon_fill;
Button setup_status_icon_empty;
Button next_menu;
Button[] setup_language_texts;
Button[] setup_wifi_texts;
Button[] setup_wifi_icons;
Button enter_input;
Button back_button;
Button skip_wifi_button;




State state = new State();
Setup setup = new Setup();
Languages lang = new Languages();

public initialize() {
  inSetup = true;
  // for testing purposes
  
  float scale = 1.0;      // set this to 1 to maximize resolution
  float newX = 2732*scale;
  float newY = 1536*scale;
  //surface.setResizable(true);
  //surface.setSize(int(newX), int(newY));
  // end of testing purposes
 
  
  icon_size_small = 70*scale;
  icon_size_large = 120*scale;
  font = createFont(fnt, 200);
  font_size_small = 60*scale;
  font_size_large = 120*scale;
  lang.v = Languages.ENGLISH;
  spacing = 200*scale;
  

  xmid = width/2;
  ymid = height/2;
  ybottom = height*0.95;

  bg = bg_default;
  background(bg);
  state.v = State.OUT_OF_BOX;
  power_button = new Button(xmid, ybottom, icon_size_small, loadImage("Data/power-512.png"), true);

  
  xheader = width*0.39;
  yheader = height*0.273;
  xheader_text = width*0.43;
  yheader_text = height*0.3;
  xfooter = xmid;
  yfooter = height*0.9;
  
  setup.v = Setup.LANGUAGE;
  setup_language_icon = new Button(xheader, yheader, icon_size_large, loadImage("Data/language-512.png"), false);
  setup_wifi_icon = new Button(xheader, yheader, icon_size_large, loadImage("Data/wifi-512.png"), false);
  setup_time_icon = new Button(xheader, yheader, icon_size_large, loadImage("Data/clock-512.png"), false);
  setup_date_icon = new Button(xheader, yheader, icon_size_large, loadImage("Data/calendar-512.png"), false);
  setup_location_icon = new Button(xheader, yheader, icon_size_large, loadImage("Data/location-512.png"), false);
  setup_status_icon_fill = new Button(0, 0, icon_size_small, loadImage("Data/circle-fill-512.png"), false);
  setup_status_icon_empty = new Button(0, 0, icon_size_small, loadImage("Data/circle-empty-512.png"), false);
  next_menu = new Button(xfooter + 2.5*spacing, yfooter*1.01, font_size_small, "ERROR", true);
  
  setup_language_texts = new Button[strLanguages.length];
  for(int i = 0; i < strLanguages.length; i++) {
    setup_language_texts[i] = new Button(0, 0, font_size_small, strLanguages[i], true);
  }
  
  int wifi_count = arrName.length;
  setup_wifi_texts = new Button[wifi_count];
  setup_wifi_icons = new Button[wifi_count];
  for(int i = 0; i < wifi_count; i++) {
    setup_wifi_texts[i] = new Button(0, 0, font_size_small, arrName[i], true);
    String s = "Data/wifi-signal-" + strength[i] + "-512.png";
    setup_wifi_icons[i] = new Button(0, 0, icon_size_small, loadImage(s), false);
  }
  
  input_password = "";
  osk = new kb(xheader, height*0.6);
  osnp = new np(width*0.6, height*0.6);
  enter_input = new Button(xfooter + 2.5*spacing, height*0.6 + 3.3*icon_size_small, font_size_small, strEnter[lang.ordinal()], true);
  
  back_button = new Button(xfooter + 2.5*spacing, height*0.7, font_size_small, strBack[lang.ordinal()], true);
  skip_wifi_button = new Button(xfooter + 2.5*spacing, yfooter*1.01, font_size_small*0.7, "ERROR", true);
}

void draw_status_bar(int step) {
  int i;
  float x = xfooter - 2*spacing;
  for(i = 0; i < 5; i++) {
    if(i == step) {
      setup_status_icon_fill.setPos(x, yfooter);
      setup_status_icon_fill.display();
    }
    else {
      setup_status_icon_empty.setPos(x, yfooter);
      setup_status_icon_empty.display();
    }
    x += spacing;
  }
}

void draw_out_of_box() {
  background(bg);
  power_button.display();
}

void draw_language_content() {
  int n = strLang.length;
  float x = xheader_text;
  float y = yheader_text + spacing;
  textSize(font_size_small);
  for(int i = 0; i < n; i++) {
    setup_language_texts[i].setPos(x, y);
    setup_language_texts[i].display();
    y += 0.7*spacing;
  }
}

void draw_wifi_content() {
  int n = setup_wifi_texts.length;
  float xicon = xheader;
  float yicon = yheader + 1.1*spacing;
  float x = xheader_text;
  float y = yheader_text + spacing;
  textSize(font_size_small);
  for(int i = 0; i < n; i++) {
    setup_wifi_texts[i].setPos(x, y);
    setup_wifi_texts[i].display();
    setup_wifi_icons[i].setPos(xicon, yicon);
    setup_wifi_icons[i].display();
    yicon += 0.7*spacing;
    y += 0.7*spacing;
  }
}

boolean check_wifi() {
  String pw = password[wifi_instance];
  
  if(pw.equals(input_password)) {
    return true;
  }
  else {
    return false;
  }
}

void draw_setup(Setup s) {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  switch(s.v) {
    case Setup.LANGUAGE:
      setup_language_icon.display();
      text(strLang[lang.ordinal()], xheader_text, yheader_text);
      next_menu.changeText(strNext[lang.ordinal()]);
      enter_input.changeText(strEnter[lang.ordinal()]);
      skip_wifi_button.changeText(strSkip[lang.ordinal()]);
      draw_language_content();
      break;
    case Setup.WIFI:
      text(strWifi[lang.ordinal()], xheader_text, yheader_text);
      setup_wifi_icon.display();
      draw_wifi_content();
      break;
    case Setup.TIME:
      text(strTime[lang.ordinal()], xheader_text, yheader_text);
      setup_time_icon.display();
      break;
    case Setup.DATE:
      text(strDate[lang.ordinal()], xheader_text, yheader_text);
      setup_date_icon.display();
      break;
    case Setup.LOCATION:
      text(strLocation[lang.ordinal()], xheader_text, yheader_text);
      setup_location_icon.display();
      break;
  }
  draw_status_bar(s.ordinal());
  if(s.v != Setup.WIFI) {
    next_menu.display();
  }
  else {
    skip_wifi_button.display();
  }
}

void draw_idle() {
  background(bg);
}

void draw_wifi_error() {
  background(bg);
  textAlign(CENTER);
  textSize(font_size_small);
  text(strError[lang.ordinal()], xmid, ymid);
  back_button.display();
  input_password = "";
}

void draw_create_user() {

}

void draw_state(State s) {
  switch(s.v) {
    case State.OUT_OF_BOX:
      draw_out_of_box();
      break;
    case State.SETUP:
      draw_setup(setup);
      break;
    case State.SETUP_WIFI:
      draw_wifi_instance(wifi_instance);
      break;
    case State.IDLE:
      draw_idle();
      break;
    case State.WIFI_ERROR:
      draw_wifi_error();
      break;
    case State.CREATE_USER:
      draw_create_user();
      break;
  }
}

void drawBegin() {
  draw_state(state);
}

void draw_pass(String s, float xpos, float y) {
  int n = s.length();
  String salted = "";
  for(int i = 0; i < n; i++) {
    salted += "*";
  }
  textSize(font_size_small);
  textAlign(LEFT);
  text(salted, xpos, y);
}

void draw_wifi_instance(int i) {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strWifi[lang.ordinal()], xheader_text, yheader_text);
  setup_wifi_icon.display();
  draw_status_bar(setup.ordinal());
  
  float x = xheader_text;
  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  setup_wifi_texts[i].setPos(x, y);
  setup_wifi_texts[i].display();
  textAlign(RIGHT);
  textSize(font_size_small*0.5);
  text(strSSID[lang.ordinal()], xicon, y);
  y += 0.7 * spacing;
  text(strPassword[lang.ordinal()], xicon, y);
  draw_pass(input_password, x, y);
  osk.display();
  //osnp.display();
  enter_input.display();
}

void mousePressed() {
  if(state.v == State.OUT_OF_BOX) { //<>//
    if(power_button.isMouseOver()) { //<>//
      state.v = State.SETUP;
    }
  }
  if(state.v == State.SETUP && setup.v == Setup.LANGUAGE) {
    for(int i = 0; i < strLanguages.length; i++) {
      if(setup_language_texts[i].isMouseOver()) {
        lang.v = i;
      }
    }
  }
  if(state.v == State.SETUP && setup.v == Setup.WIFI) {
    for(int i = 0; i < setup_wifi_texts.length; i++) {
      if(setup_wifi_texts[i].isMouseOver()) {
        state.v = State.SETUP_WIFI;
        wifi_instance = i;
      }
    }
  }
  if(state.v == State.SETUP && (next_menu.isMouseOver() || skip_wifi_button.isMouseOver())) {
    switch(setup.v) {
      case Setup.LANGUAGE:
        setup.v = Setup.WIFI;
        break;
      case Setup.WIFI:
        setup.v = Setup.TIME;
        break;
      case Setup.TIME:
        setup.v = Setup.DATE;
        break;
      case Setup.DATE:
        setup.v = Setup.LOCATION;
        break;
      case Setup.LOCATION:
        state.v = State.IDLE;
        break;
    }
  }
  if(state.v == State.SETUP_WIFI) {
    osk.update();
    if(enter_input.isMouseOver()) {
      if(check_wifi()) {
        state.v = State.IDLE;
      }
      else {
        state.v = State.WIFI_ERROR;
      }
    }
  }
  if(state.v == State.WIFI_ERROR && back_button.isMouseOver()) {
    state.v = State.SETUP;
  }
}
}