////////////////////////////////////////////////////////////////////////////////////////////////////////// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
//  Group 5 - CS 422 Project 2 - Spring 2017

// uncomment these two lines to get audio in Processing
//import processing.sound.*;
//SoundFile beepSound;

// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
//Audio beepSound = new Audio();
/* @pjs font="Arial Rounded Bold.ttf","Arial.ttf","LCD-BOLD.TTF","Courier New.ttf"; */


PFont defaultFont, clockFont, dateFont;
String weather = "icons/normal/png/weather-512.png";
Module weatherMod;
Keyboard keyboard;
initialize initState;

public boolean key_Clicked(KeyboardKey k) {
  return k.is_MouseOverItem();
}

public boolean btn_Clicked(Button btn) {
  return btn.is_MouseOverItem();
}

public void draw_Btn(Button... btns) {
  for (Button b : btns)
    b.draw_Btn();
}

public void reset_BtnStates(Button... btns) {
  for (Button b : btns)
    b.set_isActive(false);
  //b.state = -1;
}
public void reset_AllBtnStates(ArrayList<Button> btns) {
  for (Button b : btns)
    b.set_isActive(false);
  //b.state = -1;
}

// sets each of Left, Center, Right panels on the current mirror state to "Active"
// so that they are drawn by Processing.
public void set_ActiveMirror(Mirror m) {
  for (ButtonPanel p : m.allPanels)
    p.isActive = true;
}

// do not call this function from setup()! Processing.js doesn't understand the param type >:(
public void set_LRActiveMirrors(Mirror... mirrors) {
  for (Mirror m : mirrors)
    set_ActiveMirror(m);
}

//
// Draws the "current mirror state" for each side of the mirror.
// By setting currMirrorLeft and/or currMirrorRight to any known 
// mirror state, the chosen state will be drawn :)
public void draw_LRMirrors(Mirror... mirrors) {
  for (Mirror m : mirrors)
    m.draw_Mirror();
}

//
// Creates MirrorOff states for L and R mirror.
// *Does not* set the "current mirror" state. Just initializes here.
public void create_MirrorOffStates() {
  mirrorOffLeft = new MirrorOff(sidePadding, 0, mirrorWidth/numUsers, mirrorHeight);
  mirrorOffRight = new MirrorOff(sidePadding+mirrorWidth/numUsers, 0, 
    mirrorWidth/numUsers, mirrorHeight);
  set_ActiveMirror(mirrorOffLeft);
  set_ActiveMirror(mirrorOffRight);
}

//
// Creates MirrorActive states for L and R mirror.
// *Does not* set the "current mirror" state. Just initializes here.
public void create_MirrorActiveStates() {
  mirrorActiveLeft = new MirrorActive(sidePadding, 0, mirrorWidth/numUsers, mirrorHeight); 
  mirrorActiveRight = new MirrorActive(sidePadding+mirrorWidth/numUsers, 0, 
    mirrorWidth/numUsers, mirrorHeight);
  set_ActiveMirror(mirrorActiveLeft);
  set_ActiveMirror(mirrorActiveRight);
}

/////////////////////////////////////////////////////
// 
// These buttons stretch across the center of the mirror, so we place them
// based on where the right mirror starts :P
//
public void create_clockAndWeather(MirrorActive m) {
  int w = m.rightPanel.colWidth;
  int h = m.rightPanel.rowHeight;
  // we will call set_Text() on timeBtn throughout the loop so it gives current time info ;)
  timeBtn = new FakeButton(m.locX-2*w, m.locY+h, 4*w, 2*h);
  timeBtn.set_BtnFont(clockFont);
  timeBtn.set_TextAlignment(CENTER);
  timeBtn.set_VertTextAlignment(CENTER);
  //<>// //<>// //<>//
  // yes this is ghetto the way I determined the Y-location.  //<>//
  dateBtn = new FakeButton(m.locX-w, timeBtn.locY+(3*timeBtn.szHeight)/4, 2*w, h);  //<>//
  dateBtn.set_BtnFont(dateFont);  //<>//
  dateBtn.set_TextAlignment(CENTER);
  dateBtn.set_VertTextAlignment(CENTER); //<>//
  
  weatherMod = new Module(w*1.5, h*1.5, m.locX, m.locY+ h/2);  //<>// //<>// //<>// //<>// //<>// //<>//
  weatherMod.setVisibility(true); //<>//
  weatherMod.setImageName(weather);  //<>//
} //<>//

// sets time and date to be displayed
public void set_TimeAndDate(){
    timeBtn.set_Text(hour()%12+":"+ (minute()<10 ? "0":"") + minute()+  (hour()>=12 ? " pm" : " am")); 
    dateBtn.set_Text(month()+"/"+day()+"/"+year());
}

// draws the text "inside a button" so it's centered
void draw_CenteredText(Button b){
    rectMode(CENTER);  
    stroke(0); noFill();
    //rect(b.locX+(int)(b.szWidth/2), b.locY+(int)(b.szHeight/2), b.szWidth/2, b.szHeight/2, b.corner); 
    b.prep_BtnTextAppearance();
    text(b.btnTxt, b.locX+(b.szWidth/2), b.locY+(b.szHeight/2));        
}

/////////////////////////////////////////////////////
//
// Goal here is to allow us to pass in a flag via javascript function in our html file
// that will tell Processing which LEFT SIDE Mirror state we want to start in
public void set_CurrentLMirror(int mirrorFlag) {
  switch(mirrorFlag) {
  case 0:  
    currMirrorLeft = mirrorOffLeft;
  case 1:  
    currMirrorLeft = mirrorInactiveLeft;
  case 2:  
    currMirrorLeft = mirrorActiveLeft;
  }
}
//
// Goal here is to allow us to pass in a flag via javascript function in our html file
// that will tell Processing which RIGHT SIDE Mirror state we want to start in
public void set_CurrentRMirror(int mirrorFlag) {
  switch(mirrorFlag) {
  case 0:  
    currMirrorRight = mirrorOffRight;
  case 1:  
    currMirrorRight = mirrorInactiveRight; // gotta create this one first tho
  case 2:  
    currMirrorRight = mirrorActiveRight;
  }
}

public void set_CurrentMirrors(Mirror Lmirror, Mirror Rmirror) {
  currMirrorLeft = Lmirror;
  currMirrorRight = Rmirror;
}

/////////////////////////////////////////////////////
// called from button class's draw_Btn() method; added new param to set alignment.
public void setup_Text(PFont font, color c, int align, int alignVert) {
  textFont(font);
  fill(c);
  textAlign(align, alignVert);
}
/////////////////////////////////////////////////////

/* moved draw_OuterFrame() to draw_Mirror() in */

/////////////////////////////////////////////////////

final String fileLoc = "icons/normal/png/";
// mirror BG Color options
final color DAYCOLOR = color(205, 219, 225);  // (default)
final color BGWARMWHITE = color(255, 229, 204);
final color BGCOOLWHITE = color(204, 229, 255);
final color BGGRAY = color(192, 192, 192);
// (default) icon theme color
final color DEFAULTICONCOLOR = color(255);  

//final color NIGHTCOLOR = color(,,,);  // maybe we do warm tint on daycolor ?

color ICONCOLOR = DEFAULTICONCOLOR;
color MIRRORCOLOR = DAYCOLOR;

// change this line and comment out line that draws mirrorActiveRight to stretch full screen
int numUsers = 2;
// in the center of the screen
FakeButton timeBtn, dateBtn;

//final int canvasWidth = 2732;
//final int canvasHeight = 1536;
final int canvasWidth = 1600;
final int canvasHeight = 900;

//int canvasWidth = 2732;
//int canvasHeight = 1536;

int sidePadding = canvasWidth/32;

int mirrorWidth = canvasWidth-2*sidePadding;
int mirrorHeight = canvasHeight;  // update this if we add vertical padding


// this allows us to set the "active mirror", and draw the current mirror state based on it :D
Mirror currMirrorLeft, currMirrorRight; 

MirrorOff mirrorOffLeft, mirrorOffRight;
// inactive state = off state + time/date buttons
MirrorOff mirrorInactiveLeft, mirrorInactiveRight;
MirrorActive mirrorActiveLeft, mirrorActiveRight;

/////////////////////////////////////////////////////
void setup() {
  // will update these to scale for the displays in class.
  // chose these numbers cause the mirror is 80"x45" and this 
  // is roughly the same ratio.

  size(1600,900);
  //size(2732, 1536);
  
  initState = new initialize();

  // If the keyboard is needed this is the constructor
  keyboard = new Keyboard(10, 10, 40, 40, 5); // x=10, y=10, keywidth=40, keyheight=40, round=5px
  keyboard.setVisibility(false); // Set true so displayModule() works

  defaultFont = createFont("Arial Rounded MT Bold", 32, true); 
  clockFont = createFont("Arial Rounded MT Bold", 48, true);
  dateFont = createFont("Arial Rounded MT Bold", 22, true);

  create_MirrorOffStates();
  create_MirrorActiveStates();

  create_clockAndWeather(mirrorActiveRight);

  // starting state so we can test module locs  
  set_CurrentMirrors(mirrorActiveLeft, mirrorActiveRight);
  currMirrorLeft.addFreespaceLeftMirror();
  currMirrorRight.addFreespaceRighttMirror(); 
  set_CurrentMirrors(mirrorOffLeft, mirrorOffRight);
} 
/////////////////////////////////////////////////////  


void draw() {
  //if(initState.inSetup){
  //if (false) {
    //initState.drawBegin(); //<>//
  //} else {
    background(MIRRORCOLOR); //<>//
    noStroke();
    //<>//
    // just to check where the outer frame is
    //draw_OuterFrame(); 
    
    // Draw the current mirror state for each side of the mirror 
    draw_LRMirrors(currMirrorLeft, currMirrorRight);  

    //keyboard.displayModule(); 
    
    // we need to create something that draws the time/date buttons as long as the mirror is not turned off  

    set_TimeAndDate();
    draw_CenteredText(timeBtn);
    draw_CenteredText(dateBtn);
    //tint(255);
    tint(ICONCOLOR);
    weatherMod.displayModule();
  //}
}  

///////////////////////////////////////////////////// 

// mousePressed() just colors the button with click color to show that we clicked it. 
// don't really care about this for Project 2 though. 
void mousePressed() {  
  //initState.mouse_Pressed();
} 
/////////////////////////////////////////////////////

// if the mouse button is released inside a known button,  
// keep track of which button was pressed and do click stuff 
void mouseReleased() {  
  mouseReleasedBothUsers(currMirrorLeft);  
  mouseReleasedBothUsers(currMirrorRight);
} 

// updated this to have Mirror as the parameter type; we check if mouse is clicked 
// on the *current mirror state* - whichever current mirror state either side is in,  
// we're checking for clicks on it.
void mouseReleasedBothUsers(Mirror m) {
  // Checks keys if they are clicked on 
  for (KeyboardKey k : keyboard.keys) { 
    if (keyboard.visibility && key_Clicked(k)) { 
      noLoop();
      println(k.letter);  
      loop();
    }
  } 

  if (m instanceof MirrorActive) {  
    // call a mirror active method that checks if we're in settings 
    ((MirrorActive)m).do_SettingsClickStuff();  

    // do module stuff (we don't want to call this method if the mirror is in "off" mode!) 
    m.LocateModule();  
  }  
  
  else if (m instanceof MirrorOff) { 
  
    for (Button b : m.allBtns) {  // should just be the 1 power button here
      if (btn_Clicked(b)) {
        noLoop();
        if (m.equals(mirrorOffLeft)) currMirrorLeft = mirrorActiveLeft; 
        else currMirrorRight = mirrorActiveRight; 
        // add something else here maybe to check who we log in as?? 
        // ... 
        loop(); 
      }
    }
  }


  // Don't think we need this part below!! Just above part!
  //<>//
  // looping thru the current mirror's Left, Center, and Right panels  
  //for (ButtonPanel p1 : m.get_AllMirrorPanels()){
  //  // check that panel's buttons 
  //  for (Button b1 : p1.get_PanelBtns()){
  //    if (btn_Clicked(b1)){
  //      noLoop();
  //      b1.on_Click();
  //      loop();
  //    }
  //  }
  //  // looping thru that panel's inner panels, if any
  //  for (ButtonPanel p : p1.innerPanels)
  //    for (Button b : p.get_PanelBtns()){
  //      if (btn_Clicked(b)){
  //        noLoop();
  //        b.on_Click();  
  //        loop();
  //      }
  //    }
  //}
}