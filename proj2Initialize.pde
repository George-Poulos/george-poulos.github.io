

color bg_default = color(197, 214, 224);
color bg_flux = color(224, 207, 197);
color dark_gray = color(169, 169, 169);
color light_gray = color(211, 211, 211);
color bg;
color hover_tint = color(0, 153, 204);
color selected_tint = color(169, 169, 169);
float xmid;
float ymid;
float xrightmid;
float xleftmid;
float ybottom;
float scale = 1.0;
float icon_size_small;
float icon_size_large;
float xheader;
float yheader;
float xheaderleft;
float xheaderright;
float xheader_text;
float xheaderleft_text;
float xheaderright_text;
float yheader_panel_text;
float yheader_text;
float xfooter;
float yfooter;
PFont font;
String fnt = "MyriadPro-Regular.otf";
String fileDirectory = "Data/";
float font_size_large;
float font_size_small;
float spacing;
int wifi_instance;
String[] input_password = {"", "", ""};
int activeKb = 2;  // 0 is left, 1 is right, 2 is center
String[] panel_inputs = {"", ""};
String input_username;
String input_location;
int max_pass_length;
String strExt = "-512.png";
int length_input = 12;
int length_pin = 4;
int nUsers = 0;
boolean[] takenSpot;
int nPasswords = 0;
int maxUsers = 4;
int userOnLeft = -1;
int userOnRight = -1;
String[] usernames = {};
String[] passwords = {};
int freeUser = 0;
String location = "chicago";
int[] selectedApp = {-1, -1};
int nHour = 0;
int nDay;
int nMonth;
int nYear;
int nMinute = 0;
int offsetHour = 0;
int offsetMinute = 0;
boolean isAM = true;
boolean wasTimeSet = false;
String[] daysInMonth = {"31", "29", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"};
boolean[] isPanelActive = {false, false};
boolean[] isDockActive = {false, false};
boolean isFluxOn = true;
boolean isActiveCenter = false;
float ytop;
String[] strTemperature = {"61", "16"};
String[] strTempUnit = {" F", " C"};
boolean isFahr = true;
float cornerRadius = 5;
float[] xOffset = {0, 0};
int[] loggedUser = {-1, -1};
float lastSecond;
int progressBar;
String[][] userModules;
int nModules = 3;
int nUsableModules = 10;
int nCycleLimit = 3;
int[][] randomModule;

String[][] wifi_spots = {
  {"super-wifi", "full", ""},
  {"xfinity wifi", "low", "garbage"},
  {"FBI Surveillance Van", "half", "password"}
};

String[] strOverwrite = {
  "overwrite",
  "écraser",
  "exagerar"
};

String[] strOpen = {
  "open",
  "libre",
  "válido"
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

String[] strSettings = {
  "Settings",
  "Paramètres",
  "Ajustes"
};

String[] strLocation = {
  "Location", 
  "Position", 
  "Posición"
};

String[] strCity = {
  "city:", 
  "vill:", 
  "ciudad:"
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

String[] strSkip2 = {
  "skip", 
  "ignorer", 
  "saltar"
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

String[] strName = {
  "name:", 
  "nom:", 
  "nombre:"
};

String[] strPIN = {
  "pin:", 
  "pin:", 
  "pin:"
};

String[] strError = {
  "Wrong password, try again.", 
  "Mot de passe erroné, réessayez.", 
  "Contraseña incorrecta, vuelve a intentarlo."
};

String[] strError2 = {
  "Wrong PIN, try again.", 
  "Mauvais code PIN, essayez à nouveau.", 
  "PIN incorrecto, intente de nuevo."
};

String[] strBack = {
  "back", 
  "reculer", 
  "retroceder"
};

String[] strUsers = {
  "Users", 
  "Utilisateurs", 
  "Usuarios"
};

String[] strAreaSelection = {
  "select an area to place",
  "sélectionnez une zone à placer",
  "seleccione un área para colocar"
};

String[] strCreateUser = {
  "Create new user", 
  "Créer un nouvel utilisateur", 
  "Crear nuevo usuario"
};

String[] strClear = {
  "clear", 
  "effacer", 
  "borrar"
};

String[] strHour = {
  "hour:", 
  "heure:", 
  "hora:"
};

String[] strMinute = {
  "minute:", 
  "minute:", 
  "minuto:"
};

String[] strMonth = {
  "month:", 
  "mois:", 
  "mes:"
};

String[] strDay = {
  "day:", 
  "jour:", 
  "día:"
};

String[] strYear = {
  "year:", 
  "an:", 
  "año:"
};

String[] strYes = {
  "yes", 
  "oui",
  "sí"
};

String[] strNo = {
  "no",
  "non",
  "no"
};

String[] strColorShift = {
  "F.lux color",
  "F.lux couleur",
  "F.lux color "
};

String[] strChangeUnits = {
  "Units of measurement",
  "Unités de mesure",
  "Unidades de medida"
};

String[] strDeleteUser = {
  "Delete user",
  "Supprimer l'utilisateur",
  "Borrar usuario"
};

String[] strDeleteUser2 = {
  "Are you sure you want to delete user?",
  "Êtes-vous sûr de vouloir supprimer l'utilisateur?",
  "¿Seguro que quieres eliminar el usuario?"
};

String[] strImperial = {
  "Imperial",
  "Impériales",
  "Imperiales"
};

String[] strMetric = {
  "Metric",
  "Métriques",
  "Metricas"
};

String[] strOn = {
  "On",
  "Allume",
  "Encender"
};

String[] strOff = {
  "Off",
  "Éteindre",
  "Apague"
};



String[] strLogout = {
  "Are you sure you want to log out?",
  "Êtes-vous sûr de vouloir vous déconnecter?",
  "¿Seguro que quieres salir?"
};

String[][] strMonths = {
  {"Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sept.", "Oct.", "Nov.", "Dec."}, 
  {"janv.", "févr.", "mars", "avril", "mai", "mai", "juin", "juil.", "août", "sept.", "oct.", "nov.", "déc."}, 
  {"enero", "feb.", "marzo", "abr.", "mayo", "jun.", "jul.", "agosto", "sept.", "oct.", "nov.", "dic."}
};

String[] strDockApps = {
  "dock_facebook", "dock_instagram", "dock_twitter", "dock_youtube", "dock_news", "dock_email",
  "dock_map", "dock_schedule", "dock_health", "dock_music", "dock_settings", "dock_logout"
};

String[] strLoading = {
  "Automatically setting time, date, and location...",
  "Réglage automatique du temps, de la date et de l'emplacement ...",
  "Ajuste automático de hora, fecha y ubicación ..."
};

boolean[][] activeApps;
int nApps;
int appDockWidth = 4;  // number of icons per row in app dock

class bt {
  PImage icon;
  float x;
  float y;
  float size;
  boolean active;
  boolean isImg;
  String txt;

  bt(float xpos, float ypos, float sz, String pic, boolean clickable, boolean isPic) {
    pic = fileDirectory + pic;
    icon = loadImage(pic);
    x = xpos;
    y = ypos;
    size = sz;
    active = clickable;
    isImg = true;
  }

  bt(float xpos, float ypos, float sz, String pic, String s, boolean clickable, boolean isPic) {
    pic = fileDirectory + pic;
    icon = loadImage(pic);
    txt = s;
    x = xpos;
    y = ypos;
    size = sz;
    active = clickable;
    isImg = true;
  }
  
  bt(float xpos, float ypos, float sz, String t, boolean clickable) {
    txt = t;
    x = xpos;
    y = ypos;
    size = sz;
    active = clickable;
    isImg = false;
  }

  void disp(boolean emp, float transp) {
    if (isImg) {
      imageMode(CENTER);
      if (isMouseOver() && active && isImg) {
        tint(hover_tint);
      } else {
        tint(255, transp);
      }
      image(icon, x, y, size, size);
      tint(255, 255);
    } else {
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
    noTint();
  }

  void disp() {
    if (isImg) {
      imageMode(CENTER);
      if (isMouseOver() && active && isImg) {
        tint(hover_tint);
      } else {
        noTint();
      }
      image(icon, x, y, size, size);
    } else {
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
    noTint();
  }

  void disp(color c) {
    if (isImg) {
      imageMode(CENTER);
      if (isMouseOver() && active && isImg) {
        tint(hover_tint);
      } else {
        noTint();
      }
      image(icon, x, y, size, size);
    } else {
      if (isMouseOver() && active) {
        fill(hover_tint);
      } else {
        fill(c);
      }
      textSize(size);
      textAlign(LEFT);
      text(txt, x, y);
      fill(255);
    }
    noTint();
  }

  boolean isMouseOver() {
    float hsz = size/2;
    float x1 = x - hsz;
    float x2 = x + hsz;
    float y1 = y - hsz;
    float y2 = y + hsz;
    if (!isImg) {
      float adjustment = font_size_small*0.3;
      x2 += txt.length()*1.8*adjustment;
      y1 -= 2*adjustment;
    }
    if (mouseX >= x1 && mouseX <= x2
      && mouseY >= y1 && mouseY <= y2) {
      return true;
    } else {
      return false;
    }
  }

  String getText() {
    return txt;
  }

  float getX() {
    return x;
  }
  
  float getY() {
    return y;
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
  bt[] keys;
  String mapping;
  int n;
  int x;
  int y;
  float sz;
  
  Keyrow(String s) {
    n = s.length();
    keys = new bt[n];
    mapping = s;
    for (int i = 0; i < n; i++) {
      String letter = "" + mapping.charAt(i);
      String letterext = letter + ".png";
      sz = icon_size_small;
      keys[i] = new bt(0, 0, sz, letterext, letter, true, true);
    }
  }

  void setKey(int i, float xpos, float ypos) {
    keys[i].setPos(xpos, ypos);
  }

  void disp() {
    for (int i = 0; i < n; i++) {
      rectMode(CENTER);
      fill(bg);
      stroke(255);
      rect(keys[i].getX(), keys[i].getY(), sz, sz, cornerRadius, cornerRadius, cornerRadius, cornerRadius);
      keys[i].disp();
      fill(255);
    }
  }

  int getLength() {
    return n;
  }

  void update() {
    for (int i = 0; i < n; i++) {
      if (keys[i].isMouseOver()) {
        if (input_password[activeKb].length() < max_pass_length) {
          input_password[activeKb] += keys[i].getText();
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
  int id;

  kb(float xpos, float ypos, int whichKb) {
    id = whichKb;
    float padding = icon_size_small*1.1;
    x = xpos;
    y = ypos;
    float x2;
    float y2;
    nrows = 4;
    rows = new Keyrow[nrows];
    rows[0] = new Keyrow("0123456789");
    x2 = x;
    y2 = y;
    for (int i = 0; i < rows[0].getLength(); i++) {
      rows[0].setKey(i, x2, y2);
      x2 += padding;
    }
    rows[1] = new Keyrow("qwertyuiop");
    x2 = x;
    y2 += padding;
    for (int i = 0; i < rows[1].getLength(); i++) {
      rows[1].setKey(i, x2, y2);
      x2 += padding;
    }
    y2 += padding;
    x2 = x + 0.5*icon_size_small;
    rows[2] = new Keyrow("asdfghjkl");
    for (int i = 0; i < rows[2].getLength(); i++) {
      rows[2].setKey(i, x2, y2);
      x2 += padding;
    }
    y2 += padding;
    x2 = x + padding;
    rows[3] = new Keyrow("zxcvbnm");
    for (int i = 0; i < rows[3].getLength(); i++) {
      rows[3].setKey(i, x2, y2);
      x2 += padding;
    }
  }

  void update() {
    activeKb = id;
    max_pass_length = length_input;
    for (int i = 0; i < nrows; i++) {
      rows[i].update();
    }
  }

  void disp() {
    for (int i = 0; i < nrows; i++) {
      rows[i].disp();
    }
  }
}


class np {
  float x;
  float y;
  Keyrow[] rows;
  int nrows;
  int id;

  np(float xpos, float ypos, int whichNp) {
    id = whichNp;
    x = xpos;
    y = ypos;
    float x2;
    float y2;
    float padding = icon_size_small*1.1;
    nrows = 4;
    rows = new Keyrow[nrows];
    rows[0] = new Keyrow("123");
    x2 = x;
    y2 = y;
    for (int i = 0; i < rows[0].getLength(); i++) {
      rows[0].setKey(i, x2, y2);
      x2 += padding;
    }
    x2 = x;
    y2 += padding;
    rows[1] = new Keyrow("456");
    for (int i = 0; i < rows[1].getLength(); i++) {
      rows[1].setKey(i, x2, y2);
      x2 += padding;
    }
    y2 += padding;
    rows[2] = new Keyrow("789");
    x2 = x;
    for (int i = 0; i < rows[2].getLength(); i++) {
      rows[2].setKey(i, x2, y2);
      x2 += padding;
    }
    y2 += padding;
    x2 = x + padding;
    rows[3] = new Keyrow("0");
    for (int i = 0; i < rows[3].getLength(); i++) {
      rows[3].setKey(i, x2, y2);
      x2 += padding;
    }
  }

  void disp() {
    for (int i = 0; i < nrows; i++) {
      rows[i].disp();
    }
  }

  void update() {
    activeKb = id;
    max_pass_length = length_pin;
    for (int i = 0; i < nrows; i++) {
      rows[i].update();
    }
  }
}

class appRow {
  bt[] dockButtons;
  int n;
  int x;
  int y;
  float sz;
  int firstLoc;
  int sd;
  
  appRow(int idx, int side) {
    sd = side;
    firstLoc = idx*appDockWidth;
    n = nApps - (idx + 1)*appDockWidth >= 0 ? appDockWidth : nApps % appDockWidth;
    dockButtons = new bt[n];
    sz = icon_size_small;
    int currentApp = firstLoc;
    for(int i = 0; i < n; i++) {
      String filePath = strDockApps[currentApp] + ".png";
      currentApp++;
      dockButtons[i] = new bt(0, 0, sz, filePath, true, true);
    }
  }
  
  void setKey(int i, float xpos, float ypos) {
    dockButtons[i].setPos(xpos, ypos);
  }
  
  void disp() {
    if(loggedUser[sd] != -1)
    {
      for(int i = 0; i < n; i++) {
        if(activeApps[loggedUser[sd]][i + firstLoc])
        {
          dockButtons[i].disp();
        }
        else {
          dockButtons[i].disp(true, 70);
        }
      }
    }
  }
  
  void update() {
    for(int i = 0; i < n; i++) {
      if(dockButtons[i].isMouseOver()) {
        activeApps[loggedUser[sd]][i + firstLoc] = !activeApps[loggedUser[sd]][i + firstLoc];
        if(activeApps[loggedUser[sd]][i + firstLoc]) {
          if(i+firstLoc < 10) {  // any icon before dock_settings
            selectedApp[sd] = i+firstLoc;
            panels[sd] = ePanel.SELECT_PANE;
          }
        }
        else {
          // toggled off
          for(int j = 0; j < 3; j++) {
            if(userModules[loggedUser[sd]][j].equals(strDockApps[i + firstLoc])) {
              userModules[loggedUser[sd]][j] = "";
            }
          }
        }
      }
    }
    if(activeApps[loggedUser[sd]][findApp("dock_logout")]) {
      panels[sd] = ePanel.LOG_OUT;
    }
    else if (activeApps[loggedUser[sd]][findApp("dock_settings")]) {
      panels[sd] = ePanel.SETTINGS;
    }
  }
}

int findApp(String s) {
  for(int i = 0; i < nApps; i++) {
    if(s.equals(strDockApps[i])) {
      return i;
    }
  }
  return -1;
}

class dock {
  float x;
  float y;
  appRow[] rows;
  int nrows;
  int id;
  boolean isActive;
  
  dock(float xpos, float ypos, int whichDock) {
    id = whichDock;
    isActive = false;
    float padding = icon_size_small*1.1;
    x = xpos;
    y = ypos;
    float x2;
    float y2 = y;
    nrows = ceil((nApps+0.0) / appDockWidth);
    rows = new appRow[nrows];
    for(int i = 0; i < nrows; i++) {
      x2 = x;
      rows[i] = new appRow(i, id);
      for(int j = 0; j < appDockWidth; j++) {
        if(i*appDockWidth + j < nApps) {
          rows[i].setKey(j, x2, y2);
        }
        x2 += padding;
      }
      y2 += padding;
    }
  }
  
  void update() {
    for (int i = 0; i < nrows; i++) {
      rows[i].update();
    }
  }
  
  void disp() {
    for (int i = 0; i < nrows; i++) {
      rows[i].disp();
    }
  }
}

dock[] dks;

kb osk;
kb[] panel_kbs;
np osnp;
np[] panel_nps;
bt power_button;
bt power_button_left;
bt power_button_right;
bt setup_language_icon;
bt setup_wifi_icon;
bt setup_time_icon;
bt setup_date_icon;
bt setup_location_icon;
bt setup_status_icon_fill;
bt setup_status_icon_empty;
bt setup_user_icon;
bt next_menu;
bt back_menu;
bt[] setup_language_texts;
bt[] setup_wifi_texts;
bt[] setup_wifi_icons;
bt enter_input;
bt back_button;
bt skip_wifi_button;
bt skip_button;
bt create_new_user;
bt clear_button;
bt button_am;
bt button_pm;
bt weather_icon;

bt[] panel_user_icon;
bt[] panel_create_user_text;
bt[] panel_skip_user_text;
bt[][] panel_usernames_text;
bt[] panel_enter_button;
bt[] panel_clear_button;
bt[] panel_back_button;
bt[] panel_apps_button;
bt[] panel_yes_button;
bt[] panel_no_button;
bt[] panel_settings_icon;
bt[] panel_delete_user;
bt[] panel_lang_toggle;
bt[] panel_flux_toggle;
bt[] panel_units_toggle;

PImage[][] appCycle;

class ePanel {
  final static int OFF = 0;
  final static int SELECT_USER = 1;
  final static int SELECT_USER_PIN = 2;
  final static int SELECT_USER_PIN_ERROR = 3;
  final static int CREATE_USER = 4;
  final static int CREATE_USER_PIN = 5;
  final static int ACTIVE = 6;
  final static int LOG_OUT = 7;
  final static int SETTINGS = 8;
  final static int DELETE_USER = 9;
  final static int SELECT_PANE = 10;
  
  ePanel() {
    // empty
  }
}
ePanel panel;
int[] panels = {ePanel.OFF, ePanel.OFF};

class eState {
  final static int SETUP_LANGUAGE = 0;
  final static int SETUP_WIFI = 1;
  final static int SETUP_TIME = 2;
  final static int SETUP_DATE = 3;
  final static int SETUP_LOCATION = 4;
  final static int OUT_OF_BOX = 5;
  final static int SETUP_WIFI2 = 6;
  final static int SETUP_TIME_HOUR = 7;
  final static int SETUP_TIME_MINUTE = 9;
  final static int SETUP_TIME_AMPM = 10;
  final static int SETUP_DATE_MONTH = 11;
  final static int SETUP_DATE_DAY = 12;
  final static int SETUP_DATE_YEAR = 13;
  final static int IDLE = 14;
  final static int WIFI_ERROR = 15;
  final static int CREATE_USER = 16;
  final static int CREATE_USER2 = 17;
  final static int CREATE_USER3 = 18;
  final static int SETUP_WIFI_LOAD = 19;
  
  eState() {
    // empty
  }
}
eState state;
int st;

class eLanguage {
  final static int ENGLISH = 0;
  final static int FRENCH = 1;
  final static int SPANISH = 2;
  
  eLanguage() {
    // empty
  }
}
eLanguage language;
int lang;
int userLang[];

void setup() {
  size(2732, 1536);
  language = new eLanguage();
  state = new eState();
  panel = new ePanel();

/*
  // for testing purposes
  scale = 0.7;      // set this to 1 to maximize resolution
  float newX = 2732*scale;
  float newY = 1536*scale;
  surface.setResizable(true);
  surface.setSize(int(newX), int(newY));
  // end of testing purposes
*/

  usernames = new String[maxUsers];
  passwords = new String[maxUsers];
  for(int i = 0; i < maxUsers; i++) {
    usernames[i] = "";
    passwords[i] = "";
  }
  icon_size_small = 70*scale;
  icon_size_large = 120*scale;
  fnt = fileDirectory + fnt;
  font = createFont(fnt, 200);
  font_size_small = 60*scale;
  font_size_large = 120*scale;
  lang = eLanguage.ENGLISH;
  userLang = new int[maxUsers];
  spacing = 200*scale;


  xmid = width/2;
  ymid = height/2;
  xrightmid = width*0.75;
  xleftmid = width*0.25;
  ybottom = height*0.95;
  ytop = height*0.065;

  bg = bg_default;
  background(bg);
  st = eState.OUT_OF_BOX;
  
  power_button = new bt(xmid, ybottom, icon_size_small, "power-512.png", true, true);
  power_button_left = new bt(xleftmid, ybottom, icon_size_small, "power-512.png", true, true);
  power_button_right = new bt(xrightmid, ybottom, icon_size_small, "power-512.png", true, true);

  xheader = width*0.39;
  yheader = height*0.273;
  xheader_text = width*0.43;
  yheader_text = height*0.3;
  yheader_panel_text = height*0.295;
  xfooter = xmid;
  yfooter = height*0.9;

  next_menu = new bt(xfooter + 2.5*spacing, yfooter*1.016, font_size_small, "ERROR", true);
  back_menu = new bt(xfooter - 2.5*spacing, yfooter*1.016, font_size_small, "ERROR", true);
  
  setup_language_icon = new bt(xheader, yheader, icon_size_large, "language-512.png", false, true);
  setup_wifi_icon = new bt(xheader, yheader, icon_size_large, "wifi-512.png", false, true);
  setup_time_icon = new bt(xheader, yheader, icon_size_large, "clock-512.png", false, true);
  setup_date_icon = new bt(xheader, yheader, icon_size_large, "calendar-512.png", false, true);
  setup_location_icon = new bt(xheader, yheader, icon_size_large, "location-512.png", false, true);
  setup_status_icon_fill = new bt(0, 0, icon_size_small, "circle-fill-512.png", false, true);
  setup_status_icon_empty = new bt(0, 0, icon_size_small, "circle-empty-512.png", false, true);
  setup_user_icon = new bt(xheader, yheader, icon_size_large, "user-512.png", false, true);

  setup_language_texts = new bt[strLanguages.length];
  for (int i = 0; i < strLanguages.length; i++) {
    setup_language_texts[i] = new bt(0, 0, font_size_small, strLanguages[i], true);
  }

  int wifi_count = wifi_spots.length;
  setup_wifi_texts = new bt[wifi_count];
  setup_wifi_icons = new bt[wifi_count];
  for (int i = 0; i < wifi_count; i++) {
    String s = "wifi-signal-" + wifi_spots[i][1] + strExt;
    setup_wifi_texts[i] = new bt(0, 0, font_size_small, wifi_spots[i][0], true);
    setup_wifi_icons[i] = new bt(0, 0, icon_size_small, s, false, true);
  }

  osk = new kb(xheader, height*0.6, 2);
  osnp = new np(xheader_text, height*0.6, 2);
  enter_input = new bt(xfooter + 2.5*spacing, height*0.6 + 3.3*icon_size_small, font_size_small, strEnter[lang], true);
  clear_button = new bt(xfooter + 2.5*spacing, height*0.5 + 3.3*icon_size_small, font_size_small, strClear[lang], true);

  back_button = new bt(xfooter + 2.5*spacing, height*0.7, font_size_small, strBack[lang], true);
  skip_wifi_button = new bt(xfooter + 2.5*spacing, yfooter*1.01, font_size_small*0.7, "ERROR", true);
  skip_button = new bt(xfooter + 2.5*spacing, height*0.7, font_size_small*0.7, "ERROR", true);
  create_new_user = new bt(xheader_text, yheader_text+spacing, font_size_small, "ERROR", true);

  button_am = new bt(xmid-spacing, ymid, font_size_large, "AM", true);
  button_pm = new bt(xmid+spacing, ymid, font_size_large, "PM", true);
  weather_icon = new bt(xmid+0.90*spacing, height*0.07, icon_size_large*1.5, "partly-cloudy-512.png", false, true);
  
  takenSpot = new boolean[maxUsers];
  for(int i = 0; i < maxUsers; i++) {
    takenSpot[i] = false;
  }
  
  userModules = new String[maxUsers][nModules];
  for(int i = 0; i < maxUsers; i++) {
    for(int j = 0; j < nModules; j++) {
      userModules[i][j] = "";
    }
  }
  
  panel_user_icon = new bt[2];
  panel_settings_icon = new bt[2];
  panel_create_user_text = new bt[2];
  panel_skip_user_text = new bt[2];
  panel_usernames_text = new bt[2][maxUsers];
  panel_kbs = new kb[2];
  panel_nps = new np[2];
  panel_enter_button = new bt[2];
  panel_clear_button = new bt[2];
  panel_back_button = new bt[2];
  panel_apps_button = new bt[2];
  panel_lang_toggle = new bt[2];
  panel_flux_toggle = new bt[2];
  panel_units_toggle = new bt[2];
  nApps = strDockApps.length;
  dks = new dock[2];
  panel_yes_button = new bt[2];
  panel_no_button = new bt[2];
  panel_delete_user = new bt[2];
  activeApps = new boolean[maxUsers][nApps];
  xOffset[0] = -(width/4);  // left side offset
  xOffset[1] = width/4;  // right side offset
  for(int i = 0; i < 2; i++) {
    panel_user_icon[i] = new bt(xheader + xOffset[i], yheader, icon_size_large, "user-512.png", false, true);
    panel_settings_icon[i] = new bt(xheader + xOffset[i], yheader, icon_size_large, "settings-512.png", false, true);
    panel_create_user_text[i] = new bt(xheader_text + xOffset[i], yheader_text+3.5*spacing, font_size_small*0.7, "ERROR", true);
    panel_skip_user_text[i] = new bt(xheader_text + 3.0*spacing + xOffset[i], yheader_text+3.5*spacing, font_size_small*0.7, "ERROR", true);
    float y = yheader_text+0.7*spacing;
    for(int j = 0; j < maxUsers; j++) {
      panel_usernames_text[i][j] = new bt(xheader_text + xOffset[i], y, font_size_small, "ERROR", true);
      y += 0.6*spacing;
    }
    panel_kbs[i] = new kb(xheader - spacing + xOffset[i], height*0.6, i);
    panel_nps[i] = new np(xheader_text + xOffset[i], height*0.6, i);
    panel_enter_button[i] = new bt(xfooter + 1.5*spacing + xOffset[i], height*0.6 + 3.3*icon_size_small, font_size_small, "ERROR", true);
    panel_clear_button[i] = new bt(xfooter + 1.5*spacing + xOffset[i], height*0.5 + 3.3*icon_size_small, font_size_small, "ERROR", true);
    panel_back_button[i] = new bt(xheader + xOffset[i], height*0.6 + 3.3*icon_size_small, font_size_small, "ERROR", true);
    panel_apps_button[i] = new bt(xmid + xOffset[i], ybottom, icon_size_small, "dock_home.png", true, true);
    dks[i] = new dock(xmid - (icon_size_small*1.65) + xOffset[i], height*0.8, i);
    panel_yes_button[i] = new bt(xmid-spacing + xOffset[i]-width*0.02, height*0.7, font_size_small, "ERROR", true);
    panel_no_button[i] = new bt(xmid+spacing + xOffset[i]-width*0.02, height*0.7, font_size_small, "ERROR", true);
    panel_delete_user[i] = new bt(xheader-(icon_size_small/2)+xOffset[i], yheader_panel_text+2.5*spacing, font_size_small*0.6, "ERROR", true);
    panel_lang_toggle[i] = new bt(xheader+2.5*spacing+xOffset[i], yheader_panel_text+1.0*spacing, font_size_small*0.6, "ERROR", true);;
    panel_flux_toggle[i] = new bt(xheader+2.5*spacing+xOffset[i], yheader_panel_text+1.5*spacing, font_size_small*0.6, "ERROR", true);
    panel_units_toggle[i] = new bt(xheader+2.5*spacing+xOffset[i], yheader_panel_text+2.0*spacing, font_size_small*0.6, "ERROR", true);
  }
  
  appCycle = new PImage[nUsableModules][nCycleLimit];
  for(int i = 0; i < nUsableModules; i++) {
    for(int j = 0; j < nCycleLimit; j++) {
      String s = fileDirectory + strDockApps[i] + str(j) + ".png";
      appCycle[i][j] = loadImage(s);
    }
  }
  randomModule = new int[maxUsers][nUsableModules];
  for(int i = 0; i < maxUsers; i++) {
    for(int j = 0; j < nUsableModules; j++) {
      randomModule[i][j] = int(floor(random(0, float(nCycleLimit)-0.001)));
    }
  }
}

void draw_status_bar(int step) {
  int i;
  float x = xfooter - 2*spacing;
  for (i = 0; i < 5; i++) {
    if (i == step) {
      setup_status_icon_fill.setPos(x, yfooter);
      setup_status_icon_fill.disp();
    } else {
      setup_status_icon_empty.setPos(x, yfooter);
      setup_status_icon_empty.disp();
    }
    x += spacing;
  }
}

void draw_out_of_box() {
  background(bg);
  power_button.disp();
}

void draw_language_content() {
  int n = strLang.length;
  float x = xheader_text;
  float y = yheader_text + spacing;
  textSize(font_size_small);
  for (int i = 0; i < n; i++) {
    setup_language_texts[i].setPos(x, y);
    if (i == lang) {
      setup_language_texts[i].disp(selected_tint);
    } else {
      setup_language_texts[i].disp();
    }
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
  for (int i = 0; i < n; i++) {
    setup_wifi_texts[i].setPos(x, y);
    setup_wifi_texts[i].disp();
    setup_wifi_icons[i].setPos(xicon, yicon);
    setup_wifi_icons[i].disp();
    yicon += 0.7*spacing;
    y += 0.7*spacing;
  }
}


boolean check_wifi() {
  String pw = wifi_spots[wifi_instance][2];
  if (pw.equals(input_password[activeKb])) {
    return true;
  } else {
    return false;
  }
}

boolean check_password(int sd) {
  String pp = passwords[loggedUser[sd]];
  if(pp.equals(input_password[sd])) {
    return true;
  }
  else {
    return false;
  }
}

void changeLanguage() {
  for(int i = 0; i < 2; i++) {
      panel_create_user_text[i].changeText(strCreateUser[lang]);
      panel_skip_user_text[i].changeText(strSkip2[lang]);
      panel_enter_button[i].changeText(strEnter[lang]);
      panel_clear_button[i].changeText(strClear[lang]);
      panel_back_button[i].changeText(strBack[lang]);
      panel_yes_button[i].changeText(strYes[lang]);
      panel_no_button[i].changeText(strNo[lang]);
      panel_delete_user[i].changeText(strDeleteUser[lang]);
      panel_lang_toggle[i].changeText(strLanguages[lang]);
      if(isFluxOn) {
        panel_flux_toggle[i].changeText(strOn[lang]);
      }
      else {
        panel_flux_toggle[i].changeText(strOff[lang]);
      }
      if(isFahr) {
        panel_units_toggle[i].changeText(strImperial[lang]);
      }
      else {
        panel_units_toggle[i].changeText(strMetric[lang]);
      }
  }
}

void draw_setup(int s) {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  switch(s) {
  case eState.SETUP_LANGUAGE:
    // CHANGE LANGUAGE FOR BUTTONS HERE!
    setup_language_icon.disp();
    text(strLang[lang], xheader_text, yheader_text);
    next_menu.changeText(strNext[lang]);
    back_menu.changeText(strBack[lang]);
    back_menu.setPos(xfooter - (2.65*spacing + strBack[lang].length()*0.43*font_size_small), yfooter*1.016);
    enter_input.changeText(strEnter[lang]);
    skip_wifi_button.changeText(strSkip[lang]);
    skip_button.changeText(strSkip2[lang]);
    draw_language_content();
    create_new_user.changeText(strCreateUser[lang]);
    next_menu.disp();
    back_menu.disp();
    changeLanguage();
    break;
  case eState.SETUP_WIFI:
    text(strWifi[lang], xheader_text, yheader_text);
    setup_wifi_icon.disp();
    draw_wifi_content();
    skip_wifi_button.disp();
    back_menu.disp();
    break;
  case eState.SETUP_TIME:
    next_menu.disp();
    back_menu.disp();
    break;
  case eState.SETUP_DATE:
    text(strDate[lang], xheader_text, yheader_text);
    next_menu.disp();
    setup_date_icon.disp();
    back_menu.disp();
    break;
  case eState.SETUP_LOCATION:
    text(strLocation[lang], xheader_text, yheader_text);
    setup_location_icon.disp();
    float y = yheader_text + spacing;
    float xicon = xheader*1.05;
    textAlign(RIGHT);
    textSize(font_size_small*0.5);
    text(strCity[lang], xicon, y);
    textAlign(LEFT);
    textSize(font_size_small);
    text(input_password[activeKb], xheader_text, y);
    osk.disp();
    if (input_password[activeKb].length() > 0) {
      enter_input.disp();
      clear_button.disp();
    }
    back_menu.disp();
    break;
  }
  draw_status_bar(s);
}

void draw_time_and_date() {
  float y = ytop + 0.25*spacing;
  String timeString = "";
  String dateString = "";
  String endString = "";
  String minuteString;
  
  int m = (minute() + offsetMinute) % 60;
  int h = (hour() + offsetHour) % 24;
  if(m < nMinute) {
    h = (h+1)%60;
  }
  minuteString = m < 10 ? ("0" + m) : ("" + m);
  if (h < 12) {
    endString = "am";
  }
  else {
    endString = "pm";
    h -= 12;
  }
  h = h == 0 ? 12 : h;
  if (wasTimeSet) {  // user set time and date
    dateString = strMonths[lang][nMonth] + " " + nDay + ", " + nYear;
  }
  else {
    dateString = strMonths[lang][month()-1] + " " + day() + ", " + year();
  }
  
  timeString = h + ":" + minuteString;
  textSize(font_size_small*1.2);
  textAlign(RIGHT);
  text(timeString, xmid-1.47*spacing, ytop);
  textSize(font_size_small*0.6);
  text(dateString, xmid-1.05*spacing, y);
  textSize(font_size_small*0.8);
  text(endString, xmid-1.05*spacing, ytop);
}

void draw_weather() {
  float y = ytop + 0.25*spacing;
  float x = xmid + 1.85*spacing;
  textSize(font_size_small*1.2);
  textAlign(RIGHT);
  if(isFahr) {
    text(strTemperature[0], x, ytop);
  }
  else {
    text(strTemperature[1], x, ytop);
  }
  textAlign(LEFT);
  textSize(font_size_small*0.8);
  if(isFahr) {
    text(strTempUnit[0], x, ytop-0.09*spacing);
  }
  else {
    text(strTempUnit[1], x, ytop-0.09*spacing);
  }
  textSize(font_size_small*0.4);
  text("o", x, height*0.038);
  textAlign(LEFT);
  textSize(font_size_small*0.6);
  text(location, x-0.435*spacing, y);
  weather_icon.disp();
}

void draw_top_pane() {
  draw_time_and_date();
  draw_weather();
}

void draw_panel_select_user(int sd) {
  textSize(font_size_small*1.3);
  float y = yheader_panel_text;
  text(strUsers[lang], xheader_text+xOffset[sd], y);
  panel_user_icon[sd].disp();
  if (nUsers < maxUsers) {
    panel_create_user_text[sd].disp();
  }
  panel_skip_user_text[sd].disp();
  int otherUser = sd == 0 ? loggedUser[1] : loggedUser[0];
  
  y = yheader_text+0.7*spacing;
  for(int i = 0; i < maxUsers; i++) {
    if(i != otherUser && takenSpot[i]) {
      panel_usernames_text[sd][i].changeText(usernames[i]);
      panel_usernames_text[sd][i].setPos(xheader_text + xOffset[sd], y);
      y += 0.6*spacing;
      panel_usernames_text[sd][i].disp();
    }
  }
  
}

void draw_panel_create_user(int sd) {
  panel_enter_button[sd].setPos(xfooter + 1.5*spacing + xOffset[sd], height*0.6 + 3.3*icon_size_small);
  panel_clear_button[sd].setPos(xfooter + 1.5*spacing + xOffset[sd], height*0.5 + 3.3*icon_size_small);
  textSize(font_size_small*1.3);
  float y = yheader_panel_text;
  text(strUsers[lang], xheader_text+xOffset[sd], y);
  panel_user_icon[sd].disp();
  panel_kbs[sd].disp();
  y += spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small*0.8);
  text(strName[lang], xicon+xOffset[sd], y);
  textAlign(LEFT);
  textSize(font_size_small);
  text(input_password[sd], xheader_text + xOffset[sd], y);
  if(input_password[sd].length() > 0) {
    panel_enter_button[sd].disp();
    panel_clear_button[sd].disp();
  }
}

void draw_panel_create_user_pin(int sd) {
  panel_enter_button[sd].setPos(xfooter + 0.7*spacing + xOffset[sd], height*0.6 + 3.3*icon_size_small);
  panel_clear_button[sd].setPos(xfooter + 0.7*spacing + xOffset[sd], height*0.5 + 3.3*icon_size_small);
  textSize(font_size_small*1.3);
  float y = yheader_panel_text;
  text(strUsers[lang], xheader_text+xOffset[sd], y);
  panel_user_icon[sd].disp();
  panel_nps[sd].disp();
  y += spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small*0.8);
  text(strPIN[lang], xicon+xOffset[sd], y);
  textAlign(LEFT);
  textSize(font_size_small);
  text(input_password[sd], xheader_text + xOffset[sd], y);
  if(input_password[sd].length() > 0) {
    panel_clear_button[sd].disp();
  }
  panel_enter_button[sd].disp();
}

void draw_panel_select_user_pin(int sd) {
  panel_enter_button[sd].setPos(xfooter + 0.7*spacing + xOffset[sd], height*0.6 + 3.3*icon_size_small);
  panel_clear_button[sd].setPos(xfooter + 0.7*spacing + xOffset[sd], height*0.5 + 3.3*icon_size_small);
  textSize(font_size_small*1.3);
  float y = yheader_panel_text;
  text(strUsers[lang], xheader_text+xOffset[sd], y);
  panel_user_icon[sd].disp();
  panel_nps[sd].disp();
  y += spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small*0.8);
  text(strPIN[lang], xicon+xOffset[sd], y);
  textAlign(LEFT);
  textSize(font_size_small);
  draw_pass(input_password[sd], xheader_text + xOffset[sd], y);
  if(input_password[sd].length() > 0) {
    panel_clear_button[sd].disp();
  }
  panel_enter_button[sd].disp();
}

void draw_panel_select_user_pin_error(int sd) {
  panel_back_button[sd].setPos(xheader_text+spacing+xOffset[sd], height*0.7);
  textSize(font_size_small*1.3);
  float y = yheader_panel_text;
  text(strUsers[lang], xheader_text+xOffset[sd], y);
  panel_user_icon[sd].disp();
  y += spacing;
  float xicon = xheader*1.05;
  textSize(font_size_small*0.7);
  text(strError2[lang], xicon+xOffset[sd], y);
  panel_back_button[sd].disp();
}

void draw_app_dock(int sd) {
  if(isDockActive[sd]) {
    dks[sd].disp();
  }
}

void draw_rects(int sd) {
  rectMode(CENTER);
  rect(xmid+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
  rect(xmid-(5.0/32)*width+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
  rect(xmid+(5.0/32)*width+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
  textAlign(CENTER);
  text(strAreaSelection[lang], xmid+xOffset[sd], height*0.85);
  textAlign(LEFT);
}

void draw_module(int sd, int md, String ap) {
  int whichApp = findApp(ap);
  if(whichApp == -1) {
    return;
  }
  stroke(0);
  imageMode(CENTER);
  textAlign(CENTER);
  if(md == 0) {
    image(appCycle[whichApp][randomModule[loggedUser[sd]][whichApp]], xmid-(5.0/32)*width+xOffset[sd], ymid);
  }
  else if(md == 1) {
    image(appCycle[whichApp][randomModule[loggedUser[sd]][whichApp]], xmid+xOffset[sd], ymid);
  }
  else {
    image(appCycle[whichApp][randomModule[loggedUser[sd]][whichApp]], xmid+(5.0/32)*width+xOffset[sd], ymid);
  }
  textAlign(LEFT);
  noStroke();
}

void draw_modules(int sd) {
  for(int i = 0; i < nModules; i++) {
    String s = userModules[loggedUser[sd]][i];
    draw_module(sd, i, s);
  }
}

void draw_panel_active(int sd) {
  textSize(font_size_small*0.7);
  if(sd == 0) { // left user
    textAlign(LEFT);
    text(usernames[loggedUser[sd]], 0.013*width, height*0.05);
  }
  else if (sd == 1) { // right user
    textAlign(RIGHT);
    text(usernames[loggedUser[sd]], 0.983*width, height*0.05);
  }
  textAlign(LEFT);
  panel_apps_button[sd].disp();
  
  draw_app_dock(sd);
  //draw_rects(sd);
  draw_modules(sd);
}

void draw_panel_log_out(int sd) {
  textSize(font_size_small*0.7);
  if(sd == 0) { // left user
    textAlign(LEFT);
    text(usernames[loggedUser[sd]], 0.013*width, height*0.05);
    textAlign(CENTER);
    text(strLogout[lang], width*0.25, height*0.5);
  }
  else if (sd == 1) { // right user
    textAlign(RIGHT);
    text(usernames[loggedUser[sd]], 0.983*width, height*0.05);
    textAlign(CENTER);
    text(strLogout[lang], width*0.75, height*0.5);
  }
  textAlign(LEFT);
  panel_yes_button[sd].disp();
  panel_no_button[sd].disp();
  panel_apps_button[sd].disp();
}

void draw_panel_settings(int sd) {
  textSize(font_size_small*1.3);
  float y = yheader_panel_text;
  text(strSettings[lang], xheader_text+xOffset[sd], y);
  panel_settings_icon[sd].disp();
  textAlign(LEFT);
  textSize(font_size_small*0.6);
  y += 1.0*spacing;
  text(strLang[lang], xheader-(icon_size_small/2)+xOffset[sd], y);
  y += 0.5*spacing;
  text(strColorShift[lang], xheader-(icon_size_small/2)+xOffset[sd], y);
  y += 0.5*spacing;
  text(strChangeUnits[lang], xheader-(icon_size_small/2)+xOffset[sd], y);
  y += 0.5*spacing;
  panel_back_button[sd].setPos(xheader+2.5*spacing+xOffset[sd], height*0.7); 
  panel_back_button[sd].disp();
  panel_delete_user[sd].disp();
  panel_lang_toggle[sd].disp();
  panel_flux_toggle[sd].disp();
  panel_units_toggle[sd].disp();
}

void draw_delete_user(int sd) {
  textSize(font_size_small*0.7);
  if(sd == 0) { // left user
    textAlign(LEFT);
    text(usernames[loggedUser[sd]], 0.013*width, height*0.05);
    textAlign(CENTER);
    text(strDeleteUser2[lang], width*0.25, height*0.5);
  }
  else if (sd == 1) { // right user
    textAlign(RIGHT);
    text(usernames[loggedUser[sd]], 0.983*width, height*0.05);
    textAlign(CENTER);
    text(strDeleteUser2[lang], width*0.75, height*0.5);
  }
  textAlign(LEFT);
  panel_yes_button[sd].disp();
  panel_no_button[sd].disp();
  panel_apps_button[sd].disp();
}

void draw_select_pane(int sd) {
  stroke(255);
  rectMode(CENTER);
  textSize(font_size_small*0.6);
  textAlign(CENTER);
  if(userModules[loggedUser[sd]][0].length() != 0) {
    fill(dark_gray);
    rect(xmid-(5.0/32)*width+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
    fill(bg);
    text(strOverwrite[lang], xmid-(5.0/32)*width+xOffset[sd], ymid);
  }
  else {
    fill(bg);
    rect(xmid-(5.0/32)*width+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
    fill(255);
    text(strOpen[lang], xmid-(5.0/32)*width+xOffset[sd], ymid);
  }
  if(userModules[loggedUser[sd]][1].length() != 0) {
    fill(dark_gray);
    rect(xmid+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
    fill(bg);
    text(strOverwrite[lang], xmid+xOffset[sd], ymid);
  }
  else {
    fill(bg);
    rect(xmid+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
    fill(255);
    text(strOpen[lang], xmid+xOffset[sd], ymid);
  }
  if(userModules[loggedUser[sd]][2].length() != 0) {
    fill(dark_gray);
    rect(xmid+(5.0/32)*width+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
    fill(bg);
    text(strOverwrite[lang], xmid+(5.0/32)*width+xOffset[sd], ymid);
  }
  else {
    fill(bg);
    rect(xmid+(5.0/32)*width+xOffset[sd], ymid, width/8, height/2, height/100, height/100, height/100, height/100);
    fill(255);
    text(strOpen[lang], xmid+(5.0/32)*width+xOffset[sd], ymid);
  }
  
  
  text(strAreaSelection[lang], xmid+xOffset[sd], height*0.85);
  textAlign(LEFT);
  fill(255);
  stroke(bg);
}

void draw_panes(int sd) {
  if(isPanelActive[sd]) {
    switch(panels[sd]) {
      case ePanel.OFF:
        break;
      case ePanel.SELECT_USER:
        draw_panel_select_user(sd);
        break;
      case ePanel.SELECT_USER_PIN:
        draw_panel_select_user_pin(sd);
        break;
      case ePanel.SELECT_USER_PIN_ERROR:
        draw_panel_select_user_pin_error(sd);
        break;
      case ePanel.CREATE_USER:
        if(nUsers >= maxUsers) {
          panels[sd] = ePanel.SELECT_USER;
        }
        draw_panel_create_user(sd);
        break;
      case ePanel.CREATE_USER_PIN:
        draw_panel_create_user_pin(sd);
        break;
      case ePanel.ACTIVE:
        draw_panel_active(sd);
        break;
      case ePanel.LOG_OUT:
        draw_panel_log_out(sd);
        break;
      case ePanel.SETTINGS:
        draw_panel_settings(sd);
        break;
      case ePanel.DELETE_USER:
        draw_delete_user(sd);
        break;
      case ePanel.SELECT_PANE:
        draw_select_pane(sd);
        break;
    }
  }
}

void draw_center_pane() {
}

void set_flux() {
  if(isFluxOn) {
    if(hour() < 7 || hour() > 20) {
      bg = bg_flux;
    }
    else {
      bg = bg_default;
    }
  }
  else {
    bg = bg_default;
  }
}

void draw_idle() {
  set_flux();
  background(bg);
  draw_top_pane();
  if (isActiveCenter) {
    draw_center_pane();
  } else {
    draw_panes(0);
    draw_panes(1);
  }
  if(!isPanelActive[0]) {
    power_button_left.disp();
  }
  if(!isPanelActive[1]) {
    power_button_right.disp();
  }
}

void draw_wifi_error() {
  background(bg);
  textAlign(CENTER);
  textSize(font_size_small);
  text(strError[lang], xmid, ymid);
  back_button.disp();
  input_password[activeKb] = "";
}

void draw_create_user() {
  background(bg);
  textSize(font_size_large);
  text(strUsers[lang], xheader_text, yheader_text);
  setup_user_icon.disp();
  skip_button.disp();
  create_new_user.disp();
}

void draw_create_user2() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strUsers[lang], xheader_text, yheader_text);
  setup_user_icon.disp();

  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small*0.8);
  text(strName[lang], xicon, y);
  textAlign(LEFT);
  textSize(font_size_small);
  text(input_password[activeKb], xheader_text, y);
  osk.disp();
  if (input_password[activeKb].length() > 0) {
    enter_input.disp();
    clear_button.disp();
  }
}

void draw_create_user3() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strUsers[lang], xheader_text, yheader_text);
  setup_user_icon.disp();

  float x = xheader_text;
  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small*0.8);
  text(strPIN[lang], xicon, y);
  osnp.disp();
  textAlign(LEFT);
  textSize(font_size_small);
  text(input_password[2], x, y);
  if (input_password[activeKb].length() > 0) {
    clear_button.disp();
  }
  enter_input.disp();
}

void draw_setup_time_hour() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strTime[lang], xheader_text, yheader_text);
  setup_time_icon.disp();
  draw_status_bar(eState.SETUP_TIME);

  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small);
  text(strHour[lang], xicon, y);
  textAlign(LEFT);
  textSize(font_size_large);
  if (parseInt(input_password[activeKb]) > 12) {
    input_password[activeKb] = "12";
  }
  text(input_password[activeKb], xheader_text, y);
  osnp.disp();
  if (input_password[activeKb].length() > 0) {
    enter_input.disp();
    clear_button.disp();
  }
  back_menu.disp();
}

void draw_setup_time_minute() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strTime[lang], xheader_text, yheader_text);
  setup_time_icon.disp();
  draw_status_bar(eState.SETUP_TIME);

  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small);
  text(strMinute[lang], xicon, y);
  textAlign(LEFT);
  textSize(font_size_large);
  if (parseInt(input_password[activeKb]) > 59) {
    input_password[activeKb] = "59";
  }
  text(input_password[activeKb], xheader_text, y);
  osnp.disp();
  if (input_password[activeKb].length() > 0) {
    enter_input.disp();
    clear_button.disp();
  }
  back_menu.disp();
}

void draw_setup_time_ampm() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strTime[lang], xheader_text, yheader_text);
  setup_time_icon.disp();
  draw_status_bar(eState.SETUP_TIME);
  if (isAM) {
    button_am.disp(selected_tint);
    button_pm.disp();
  } else {
    button_am.disp();
    button_pm.disp(selected_tint);
  }
  next_menu.disp();
  back_menu.disp();
}

void draw_setup_date_month() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strDate[lang], xheader_text, yheader_text);
  setup_date_icon.disp();
  draw_status_bar(eState.SETUP_DATE);

  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small);
  text(strMonth[lang], xicon, y);
  textAlign(LEFT);
  textSize(font_size_large);
  if (parseInt(input_password[activeKb]) > 12) {
    input_password[activeKb] = "12";
  }
  if(input_password[activeKb].length() > 0) {
    text(input_password[activeKb] + " (" + strMonths[lang][parseInt(input_password[activeKb])-1] + ")", xheader_text, y);
  }
  osnp.disp();
  if (input_password[activeKb].length() > 0) {
    enter_input.disp();
    clear_button.disp();
  }
  back_menu.disp();
}

void draw_setup_date_day() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strDate[lang], xheader_text, yheader_text);
  setup_date_icon.disp();
  draw_status_bar(eState.SETUP_DATE);

  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small);
  text(strDay[lang], xicon, y);
  textAlign(LEFT);
  textSize(font_size_large);
  if (parseInt(input_password[activeKb]) > parseInt(daysInMonth[nMonth-1])) {
    input_password[activeKb] = daysInMonth[nMonth-1];
  }
  text(input_password[activeKb], xheader_text, y);
  osnp.disp();
  if (input_password[activeKb].length() > 0) {
    enter_input.disp();
    clear_button.disp();
  }
  back_menu.disp();
}

void draw_setup_date_year() {
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strDate[lang], xheader_text, yheader_text);
  setup_date_icon.disp();
  draw_status_bar(eState.SETUP_DATE);

  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  textAlign(RIGHT);
  textSize(font_size_small);
  text(strYear[lang], xicon, y);
  textAlign(LEFT);
  textSize(font_size_large);
  if (parseInt(input_password[activeKb]) > 9999) {
    input_password[activeKb] = "9999";
  }
  text(input_password[activeKb], xheader_text, y);
  osnp.disp();
  if (input_password[activeKb].length() > 0) {
    enter_input.disp();
    clear_button.disp();
  }
  back_menu.disp();
}

void draw_setup_wifi_load() {
  background(bg);
  textAlign(CENTER);
  textSize(font_size_small);
  text(strLoading[lang], xmid, ymid);
  text(""+str(progressBar)+"%", xmid, height*0.7);
  if(second() != lastSecond) {
    lastSecond = second();
    progressBar += int(random(1, 50));
  }
  if(progressBar >= 100) {
    st = eState.CREATE_USER;
    textAlign(LEFT);
  }
}

void draw_state(int s) {
  switch(s) {
  case eState.OUT_OF_BOX:
    draw_out_of_box();
    break;
  case eState.SETUP_LANGUAGE:
    draw_setup(st);
    break;
  case eState.SETUP_WIFI:
    draw_setup(st);
    break;
  case eState.SETUP_TIME:
    draw_setup(st);
    break;
  case eState.SETUP_DATE:
    draw_setup(st);
    break;
  case eState.SETUP_LOCATION:
    draw_setup(st);
    break;
  case eState.SETUP_WIFI2:
    draw_wifi_instance(wifi_instance);
    break;
  case eState.SETUP_TIME_HOUR:
    draw_setup_time_hour();
    break;
  case eState.SETUP_TIME_MINUTE:
    draw_setup_time_minute();
    break;
  case eState.SETUP_TIME_AMPM:
    draw_setup_time_ampm();
    break;
  case eState.SETUP_DATE_MONTH:
    draw_setup_date_month();
    break;
  case eState.SETUP_DATE_DAY:
    draw_setup_date_day();
    break;
  case eState.SETUP_DATE_YEAR:
    draw_setup_date_year();
    break;
  case eState.IDLE:
    draw_idle();
    break;
  case eState.WIFI_ERROR:
    draw_wifi_error();
    break;
  case eState.CREATE_USER:
    draw_create_user();
    break;
  case eState.CREATE_USER2:
    draw_create_user2();
    break;
  case eState.CREATE_USER3:
    draw_create_user3();
    break;
  case eState.SETUP_WIFI_LOAD:
    draw_setup_wifi_load();
    break;
  }
}

void draw() {
  draw_state(st);
}

void draw_pass(String s, float x, float y) {
  int n = s.length();
  String salted = "";
  for (int i = 0; i < n; i++) {
    salted += "*";
  }
  textSize(font_size_small);
  textAlign(LEFT);
  text(salted, x, y);
}

void draw_wifi_instance(int i) {
  enter_input.setPos(xfooter + 2.5*spacing, height*0.6 + 3.3*icon_size_small);
  clear_button.setPos(xfooter + 2.5*spacing, height*0.5 + 3.3*icon_size_small);
  background(bg);
  textSize(font_size_large);
  textAlign(LEFT);
  text(strWifi[lang], xheader_text, yheader_text);
  setup_wifi_icon.disp();
  draw_status_bar(eState.SETUP_WIFI);

  float x = xheader_text;
  float y = yheader_text + spacing;
  float xicon = xheader*1.05;
  setup_wifi_texts[i].setPos(x, y);
  setup_wifi_texts[i].disp();
  textAlign(RIGHT);
  textSize(font_size_small*0.5);
  text(strSSID[lang], xicon, y);
  y += 0.7 * spacing;
  text(strPassword[lang], xicon, y);
  enter_input.disp();
  textAlign(LEFT);
  textSize(font_size_small);
  text(input_password[activeKb], xheader_text, y);
  osk.disp();
  if (input_password[activeKb].length() > 0) {
    clear_button.disp();
  }
  back_menu.disp();
}

void mousePressed() {
  for(int i = 0; i < 2; i++) {
    if(isPanelActive[i]) {
      switch(panels[i]) {
        case ePanel.SELECT_USER:
          if(panel_create_user_text[i].isMouseOver()) {
            panels[i] = ePanel.CREATE_USER;
          }
          else if(panel_skip_user_text[i].isMouseOver()) {
            isPanelActive[i] = false;
            panels[i] = ePanel.OFF;
          }
          else {
            int otherUser = i == 0 ? loggedUser[1] : loggedUser[0];
            for(int j = 0; j < maxUsers; j++) {
              if(panel_usernames_text[i][j].isMouseOver()) {
                if(otherUser != j && takenSpot[j]) {
                  panels[i] = ePanel.SELECT_USER_PIN;
                  loggedUser[i] = j;
                }
              }
            }
          }
          break;
        case ePanel.SELECT_USER_PIN:
          panel_nps[i].update();
          if(panel_clear_button[i].isMouseOver()) {
            input_password[i] = "";
          }
          else if(panel_enter_button[i].isMouseOver()) {
            if(check_password(i)) {
              panels[i] = ePanel.ACTIVE;
            }
            else {
              panels[i] = ePanel.SELECT_USER_PIN_ERROR;
            }
            input_password[i] = "";
          }
          break;
        case ePanel.SELECT_USER_PIN_ERROR:
          if(panel_back_button[i].isMouseOver()) {
            panels[i] = ePanel.SELECT_USER;
          }
          break;
        case ePanel.CREATE_USER:
          panel_kbs[i].update();
          if(panel_clear_button[i].isMouseOver()) {
            input_password[i] = "";
          }
          else if(panel_enter_button[i].isMouseOver()) {
            //usernames = append(usernames, input_password[i]);
            usernames[freeUser] = input_password[i];
            nUsers++;
            input_password[i] = "";
            panels[i] = ePanel.CREATE_USER_PIN;
          }
          break;
        case ePanel.CREATE_USER_PIN:
          panel_nps[i].update();
          if(panel_clear_button[i].isMouseOver()) {
            input_password[i] = "";
          }
          else if(panel_enter_button[i].isMouseOver()) {
            //passwords = append(passwords, input_password[i]);
            passwords[freeUser] = input_password[i];
            nPasswords++;
            for(int j = 0; j < nApps; j++) {
              activeApps[nUsers-1][j] = false;
            }
            input_password[i] = "";
            takenSpot[freeUser] = true;
            while(freeUser < maxUsers && takenSpot[freeUser]) {
              freeUser++;
            }
            panels[i] = ePanel.SELECT_USER;
          }
          break;
        case ePanel.ACTIVE:
          dks[i].update();
          if(panel_apps_button[i].isMouseOver()) {
            isDockActive[i] = !isDockActive[i];
          }
          else if(mouseY <= ymid+height/4 && mouseY >= ymid-height/4) {
            if(mouseX <= xmid+xOffset[i]+width/16 && mouseX >= xmid+xOffset[i]-width/16) {
              int idx = findApp(userModules[loggedUser[i]][1]);
              if (findApp(userModules[loggedUser[i]][1]) != -1) {
                randomModule[loggedUser[i]][idx] = (randomModule[loggedUser[i]][idx] + 1)%nCycleLimit;
              }
            }
            else if (mouseX <= xmid-(5.0/32)*width+xOffset[i]+width/16 && mouseX >= xmid-(5.0/32)*width+xOffset[i]-width/16) {
              int idx = findApp(userModules[loggedUser[i]][0]);
              if (findApp(userModules[loggedUser[i]][0]) != -1) {
                randomModule[loggedUser[i]][idx] = (randomModule[loggedUser[i]][idx] + 1)%nCycleLimit;
              }
            }
            else if (mouseX <= xmid+(5.0/32)*width+xOffset[i]+width/16 && mouseX >= xmid+(5.0/32)*width+xOffset[i]-width/16) {
              int idx = findApp(userModules[loggedUser[i]][2]);
              if (findApp(userModules[loggedUser[i]][2]) != -1) {
                randomModule[loggedUser[i]][idx] = (randomModule[loggedUser[i]][idx] + 1)%nCycleLimit;
              }
            }
          }
          break;
        case ePanel.LOG_OUT:
          if(panel_yes_button[i].isMouseOver()) {
            activeApps[loggedUser[i]][findApp("dock_logout")] = false;
            panels[i] = ePanel.ACTIVE;
            loggedUser[i] = -1;
            isPanelActive[i] = false;
            isDockActive[i] = false;
          }
          else if(panel_no_button[i].isMouseOver()) {
            activeApps[loggedUser[i]][findApp("dock_logout")] = false;
            panels[i] = ePanel.ACTIVE;
          }
          break;
        case ePanel.SETTINGS:
          if(panel_back_button[i].isMouseOver()) {
            activeApps[loggedUser[i]][findApp("dock_settings")] = false;
            panels[i] = ePanel.ACTIVE;
          }
          else if(panel_lang_toggle[i].isMouseOver()) {
            lang = (lang + 1) % strLanguages.length;
            changeLanguage();
          }
          else if(panel_flux_toggle[i].isMouseOver()) {
            isFluxOn = !isFluxOn;
            changeLanguage();
          }
          else if(panel_units_toggle[i].isMouseOver()) {
            isFahr = !isFahr;
            changeLanguage();
          }
          else if(panel_delete_user[i].isMouseOver()) {
            panels[i] = ePanel.DELETE_USER;
          }
          break;
        case ePanel.DELETE_USER:
          if(panel_yes_button[i].isMouseOver()) {
            for(int j = 0; j < nApps; j++) {
              activeApps[loggedUser[i]][j] = false;
            }
            takenSpot[loggedUser[i]] = false;
            usernames[loggedUser[i]] = "";
            passwords[loggedUser[i]] = "";
            freeUser = loggedUser[i];
            loggedUser[i] = -1;
            isPanelActive[i] = false;
            isDockActive[i] = false;
            nUsers--;
            nPasswords--;
          }
          else if(panel_no_button[i].isMouseOver()) {
            panels[i] = ePanel.SETTINGS;
          }
          break;
        case ePanel.SELECT_PANE:
          if(mouseY <= ymid+height/4 && mouseY >= ymid-height/4) {
            if(mouseX <= xmid+xOffset[i]+width/16 && mouseX >= xmid+xOffset[i]-width/16) {
              if (findApp(userModules[loggedUser[i]][1]) != -1) {
                activeApps[loggedUser[i]][findApp(userModules[loggedUser[i]][1])] = false;
              }
              userModules[loggedUser[i]][1] = strDockApps[selectedApp[i]];
              panels[i] = ePanel.ACTIVE;
            }
            else if (mouseX <= xmid-(5.0/32)*width+xOffset[i]+width/16 && mouseX >= xmid-(5.0/32)*width+xOffset[i]-width/16) {
              if (findApp(userModules[loggedUser[i]][0]) != -1) {
                activeApps[loggedUser[i]][findApp(userModules[loggedUser[i]][0])] = false;
              }
              userModules[loggedUser[i]][0] = strDockApps[selectedApp[i]];
              panels[i] = ePanel.ACTIVE;
            }
            else if (mouseX <= xmid+(5.0/32)*width+xOffset[i]+width/16 && mouseX >= xmid+(5.0/32)*width+xOffset[i]-width/16) {
              if (findApp(userModules[loggedUser[i]][2]) != -1) {
                activeApps[loggedUser[i]][findApp(userModules[loggedUser[i]][2])] = false;
              }
              userModules[loggedUser[i]][2] = strDockApps[selectedApp[i]];
              panels[i] = ePanel.ACTIVE;
            }
          }
          break;
      }
    }
  }
  switch(st) {
    case eState.SETUP_LANGUAGE:
      for (int i = 0; i < strLanguages.length; i++) {
        if (setup_language_texts[i].isMouseOver()) {
          lang = i;
        }
      }
      if(next_menu.isMouseOver()) {
        st = eState.SETUP_WIFI;
      }
      else if(back_menu.isMouseOver()) {
        st = eState.OUT_OF_BOX;
      }
      break;
    case eState.SETUP_WIFI:
      if(skip_wifi_button.isMouseOver()) {
        st = eState.SETUP_TIME_HOUR;
        enter_input.setPos(xfooter + 0.8*spacing, height*0.6 + 3.3*icon_size_small);
        clear_button.setPos(xfooter + 0.8*spacing, height*0.5 + 3.3*icon_size_small);
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_LANGUAGE;
      }
      for (int i = 0; i < setup_wifi_texts.length; i++) {
        if (setup_wifi_texts[i].isMouseOver()) {
          st = eState.SETUP_WIFI2;
          wifi_instance = i;
        }
      }
      break;
    case eState.SETUP_TIME:
      if(next_menu.isMouseOver()) {
        st = eState.SETUP_DATE;
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_WIFI;
      }
      break;
    case eState.SETUP_DATE:
      if(next_menu.isMouseOver()) {
        st = eState.SETUP_LOCATION;
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_TIME_HOUR;
      }
      break;
    case eState.SETUP_LOCATION:
      osk.update();
      if (enter_input.isMouseOver()) {
        location = input_password[activeKb];
        st = eState.CREATE_USER;
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_DATE_YEAR;
      }
      else if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      }
      break;
    case eState.OUT_OF_BOX:
      if (power_button.isMouseOver()) {
        st = eState.SETUP_LANGUAGE;
      }
      break;
    case eState.SETUP_WIFI2:
      osk.update();
      if (enter_input.isMouseOver()) {
        if (check_wifi()) {
          lastSecond = second();
          progressBar = 0;
          st = eState.SETUP_WIFI_LOAD;
        }
        else {
          st = eState.WIFI_ERROR;
        }
      }
      else if(clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_WIFI;
        input_password[activeKb] = "";
      }
      break;
    case eState.SETUP_TIME_HOUR:
      osnp.update();
      if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      }
      else if (enter_input.isMouseOver()) {
        nHour = parseInt(input_password[activeKb]);
        st = eState.SETUP_TIME_MINUTE;
        input_password[activeKb] = "";
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_WIFI;
      }
      break;
    case eState.SETUP_TIME_MINUTE:
      osnp.update();
      if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      }
      else if (enter_input.isMouseOver()) {
        nMinute = parseInt(input_password[activeKb]);
        st = eState.SETUP_TIME_AMPM;
        input_password[activeKb] = "";
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_TIME_HOUR;
      }
      break;
    case eState.SETUP_TIME_AMPM:
      if (next_menu.isMouseOver()) {
        input_password[activeKb] = "";
        st = eState.SETUP_DATE_MONTH;
        wasTimeSet = true;
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_TIME_MINUTE;
      }
      else if (button_am.isMouseOver()) {
        isAM = true;
      }
      else if (button_pm.isMouseOver()) {
        nHour += 12;
        isAM = false;
      }
      offsetHour = (24 + (nHour - hour())) % 24;
      offsetMinute = (60 + (nMinute - minute())) % 60;
      break;
    case eState.SETUP_DATE_MONTH:
      osnp.update();
      if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      }
      else if (enter_input.isMouseOver()) {
        nMonth = parseInt(input_password[activeKb]);
        st = eState.SETUP_DATE_DAY;
        input_password[activeKb] = "";
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_TIME_AMPM;
      }
      break;
    case eState.SETUP_DATE_DAY:
      osnp.update();
      if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      }
      else if (enter_input.isMouseOver()) {
        nDay = parseInt(input_password[activeKb]);
        st = eState.SETUP_DATE_YEAR;
        input_password[activeKb] = "";
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_DATE_MONTH;
      }
      break;
    case eState.SETUP_DATE_YEAR:
      osnp.update();
      if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      }
      else if (enter_input.isMouseOver()) {
        nYear = parseInt(input_password[activeKb]);
        if (nMonth == 2 && nDay == 29 && nYear%4 > 0) {
          nDay--;
        }
        enter_input.setPos(xfooter + 2.5*spacing, height*0.6 + 3.3*icon_size_small);
        clear_button.setPos(xfooter + 2.5*spacing, height*0.5 + 3.3*icon_size_small);
        st = eState.SETUP_LOCATION;
        input_password[activeKb] = "";
      }
      else if(back_menu.isMouseOver()) {
        st = eState.SETUP_DATE_DAY;
      }
      break;
    case eState.IDLE:
      if(!isPanelActive[0]) {
        if(power_button_left.isMouseOver()) {
          isPanelActive[0] = true;
          panels[0] = ePanel.SELECT_USER;
        }
      }
      else {
      
      }
      if(!isPanelActive[1]) {
        if(power_button_right.isMouseOver()) {
          isPanelActive[1] = true;
          panels[1] = ePanel.SELECT_USER;
        }
      }
      else {
      
      }
      break;
    case eState.WIFI_ERROR:
      if(back_button.isMouseOver()) {
        st = eState.SETUP_WIFI2;
      }
      break;
    case eState.CREATE_USER:
      if (skip_button.isMouseOver()) {
        st = eState.IDLE;
        panels[0] = ePanel.OFF;
        panels[1] = ePanel.OFF;
      }
      if (create_new_user.isMouseOver()) {
        st = eState.CREATE_USER2;
        input_password[activeKb] = "";
      }
      break;
    case eState.CREATE_USER2:
      osk.update();
      if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      } else if (enter_input.isMouseOver()) {
        //usernames = append(usernames, input_password[activeKb]);
        usernames[freeUser] = input_password[activeKb];
        nUsers++;
        input_password[activeKb] = "";
        st = eState.CREATE_USER3;
        enter_input.setPos(xfooter + 0.8*spacing, height*0.6 + 3.3*icon_size_small);
        clear_button.setPos(xfooter + 0.8*spacing, height*0.5 + 3.3*icon_size_small);
      }
      break;
    case eState.CREATE_USER3:
      osnp.update();
      if (clear_button.isMouseOver()) {
        input_password[activeKb] = "";
      } else if (enter_input.isMouseOver()) {
        //passwords = append(passwords, input_password[activeKb]);
        passwords[freeUser] = input_password[activeKb];
        takenSpot[freeUser] = true;
        freeUser++;
        input_password[activeKb] = "";
        nPasswords++;
        for(int j = 0; j < nApps; j++) {
          activeApps[nUsers-1][j] = false;
        }
        st = eState.IDLE;
        panels[0] = ePanel.OFF;
        panels[1] = ePanel.OFF;
      }
      break;
  }
}