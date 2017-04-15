//////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Group 5 - CS 422 Project 2 - Spring 2017

// uncomment these two lines to get audio in Processing
//import processing.sound.*;
//SoundFile beepSound;

// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
//Audio beepSound = new Audio();


/* @pjs font="Arial.ttf","LCD-BOLD.TTF","Courier New.ttf"; */

PFont defaultFont, dateFont;

public boolean btn_Clicked(Button btn){
  return btn.is_MouseOverItem();
}

public void draw_Btn(Button... btns){
  for (Button b : btns)
    b.draw_Btn();
}

public void reset_BtnStates(Button... btns){
  for (Button b : btns)
    b.set_isActive(false);
    //b.state = -1;
}
public void reset_AllBtnStates(ArrayList<Button> btns){
  for (Button b : btns)
    b.set_isActive(false);
    //b.state = -1;
}

// sets each of Left, Center, Right panels on the current mirror state to "Active"
// so that they are drawn by Processing.
public void set_ActiveMirror(Mirror m){
  for (ButtonPanel p : m.allPanels)
    p.isActive = true;
}

// these buttons stretch across the center of the mirror, so we place them
// based on where the right mirror starts
// these buttons get drawn from their origin, so we can set their x,y coords to mirror start.
public void create_clockAndWeather(MirrorActive m){
  int w = m.rightPanel.colWidth;
  int h = m.rightPanel.rowHeight;
  // we will call set_Text() on timeBtn throughout the loop so it gives current time info ;)
  timeBtn = new Button(m.locX, m.locY+h, 4*w, 2*h);
  dateBtn = new Button(m.locX, m.locY+timeBtn.szHeight, 4*w, h);
  dateBtn.set_BtnFont(dateFont);
  //weatherBtn = rightPanel.create_PanelBtn(1,1,2,3,true,WEATHER);
}

/////////////////////////////////////////////////////


public void setup_Text(PFont font, color c){
  textFont(font);
  fill(c);
  textAlign(CENTER, CENTER);
}


/////////////////////////////////////////////////////
public String fileLoc = "icons/normal/png/";

final color DAYCOLOR = color(205,219,225);
//final color NIGHTCOLOR = color(,,,);  // maybe we do warm tint on daycolor ?
color mirrorColor;

// change this line and comment out line that draws mirrorActiveRight to stretch full screen
int numUsers = 2;
// in the center of the screen
Button timeBtn, dateBtn, weatherBtn;

final int canvasWidth = 1200;
final int canvasHeight = 680;
int sidePadding = canvasWidth/32;
int mirrorWidth = canvasWidth-2*sidePadding;
int mirrorHeight = canvasHeight;  // update this if we add vertical padding

Mirror mirror;  // mirror has left, right, and center grid panels
MirrorActive mirrorActiveLeft, mirrorActiveRight;
AppDrawer appDrawer;

/////////////////////////////////////////////////////
void setup() {
  // will update these to scale for the displays in class.
  // chose these numbers cause the mirror is 80"x45" and this 
  // is roughly the same ratio.
  //size(1600,900);
  size(1200,680);
  defaultFont = createFont("Arial Rounded MT Bold",48,true); 
  dateFont = createFont("Arial Rounded MT Bold",22,true);
  
  // just a (pretty good) guess based on what our website mirror looks like
  mirrorColor = DAYCOLOR;
  
  //mainScreen.set_ActiveMode(functionsMode);
  
  mirrorActiveLeft = new MirrorActive(sidePadding,0,mirrorWidth/numUsers,mirrorHeight);
  mirrorActiveLeft.add_InnerPanels();  // creates left, right, and center grid panels
  set_ActiveMirror(mirrorActiveLeft);
 
  mirrorActiveRight = new MirrorActive(sidePadding+mirrorWidth/numUsers,0,
        mirrorWidth/numUsers,mirrorHeight);
  mirrorActiveRight.add_InnerPanels();  // creates left, right, and center grid panels
  set_ActiveMirror(mirrorActiveRight);

  create_clockAndWeather(mirrorActiveRight);
}
/////////////////////////////////////////////////////


void draw() {
  background(mirrorColor);
  noStroke();

  //// draws the "Active Mode" on the front of the oven.
  //mainScreen.draw_ActiveMode();
       
  // just to check where the outer side paddings are drawn
  fill(200);
  rect(0, 0, sidePadding, canvasHeight);  // left outer padding
  rect(canvasWidth-sidePadding, 0, sidePadding, canvasHeight);  // right outer padding
  
  mirrorActiveLeft.draw_Mirror();
  mirrorActiveRight.draw_Mirror();
  timeBtn.set_Text(hour()%12+":"+minute() + (hour()>=12 ? " pm" : " am"));
  dateBtn.set_Text(month()+"/"+day()+"/"+year());
  draw_Btn(timeBtn, dateBtn);
}


/////////////////////////////////////////////////////

// mousePressed() just colors the button with click color to show that we clicked it.
// don't really care about this for Project 2 though.
void mousePressed(){
}

/////////////////////////////////////////////////////

// if the mouse button is released inside a known button, 
// keep track of which button was pressed and do click stuff

void mouseReleased() {
  mouseReleasedBothUsers(mirrorActiveLeft);
  mouseReleasedBothUsers(mirrorActiveRight);
}

void mouseReleasedBothUsers(MirrorActive m){
  for (Button b : m.get_AllMirrorBtns()){
      if (btn_Clicked(b)){
        noLoop();
        // call b.onClick() method, which should, at the very least, open the selected 
        // button's Module and will toggle the button state (active=1 vs inactive=0).
        // (because if button is "active" we color it differently (activeClr vs. inactiveClr))
        b.on_Click();  
        loop();
      }    
  }
  
  // Don't think we need this part below!! Just above part!

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