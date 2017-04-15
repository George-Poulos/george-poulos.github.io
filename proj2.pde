//////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Group 5 - CS 422 Project 2 - Spring 2017

// uncomment these two lines to get audio in Processing
//import processing.sound.*;
//SoundFile beepSound;

// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
//Audio beepSound = new Audio();


/* @pjs font="Arial.ttf","LCD-BOLD.TTF","Courier New.ttf"; */

PFont defaultFont;

public boolean btn_Clicked(Button btn){
  return btn.is_MouseOverItem();
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

public void open_SettingsMode(){
  //mainScreen.set_ActiveMode((Mode)settingsMode);
}

// sets each of Left, Center, Right panels on the current mirror state to "Active"
// so that they are drawn by Processing.
public void set_ActiveMirror(Mirror m){
  for (ButtonPanel p : m.allPanels)
    p.isActive = true;
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

final int canvasWidth = 1200;
final int canvasHeight = 680;
int sidePadding = canvasWidth/32;
int mirrorWidth = canvasWidth-2*sidePadding;
int mirrorHeight = canvasHeight;  // update this if we add vertical padding

Mirror mirror;  // mirror has left, right, and center grid panels
MirrorActive mirrorActive;
AppDrawer appDrawer;

/////////////////////////////////////////////////////
void setup() {
  // will update these to scale for the displays in class.
  // chose these numbers cause the mirror is 80"x45" and this 
  // is roughly the same ratio.
  //size(1600,900);
  size(1200,680);
  defaultFont = createFont("Arial",24,true); 
  
  // just a (pretty good) guess based on what our website mirror looks like
  mirrorColor = DAYCOLOR;
  
  //mainScreen.set_ActiveMode(functionsMode);
  //mirror = new Mirror(sidePadding,0,mirrorWidth,mirrorHeight);
  //mirror.add_InnerPanels();  // creates left, right, and center grid panels
  //appDrawer = new AppDrawer(mirror.rightPanel);

  
  mirrorActive = new MirrorActive(sidePadding,0,mirrorWidth-sidePadding,mirrorHeight);
  mirrorActive.add_InnerPanels();  // creates left, right, and center grid panels
  set_ActiveMirror(mirrorActive);

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
  //appDrawer.draw_ButtonPanel();
  
  mirrorActive.draw_Mirror();
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
  
  // this works :)
  //for (Button b : appDrawer.get_PanelBtns()){
  for (Button b : mirrorActive.get_AllMirrorBtns()){
      if (btn_Clicked(b)){
        noLoop();
        // call b.onClick() method, which should, at the very least, open the selected 
        // button's Module and will toggle the button state (active=1 vs inactive=0).
        // (because if button is "active" we color it differently (activeClr vs. inactiveClr))
        b.on_Click();  
        loop();
      }    
  }
  
  // looping thru the current mirror's Left, Center, and Right panels  
  for (ButtonPanel p1 : mirrorActive.get_AllMirrorPanels()){
    // check that panel's buttons 
    for (Button b1 : p1.get_PanelBtns()){
      if (btn_Clicked(b1)){
        noLoop();
        b1.on_Click();
        loop();
      }
    }
    // looping thru that panel's inner panels, if any
    for (ButtonPanel p : p1.innerPanels)
      for (Button b : p.get_PanelBtns()){
        if (btn_Clicked(b)){
          noLoop();
          // call b.onClick() method, which should, at the very least, open the selected 
          // button's Module and will toggle the button state (active=1 vs inactive=0).
          // (because if button is "active" we color it differently (activeClr vs. inactiveClr))
          b.on_Click();  
          loop();
        }
      }
  }
  
  //for (Button b : mainButtons.get_PanelBtns()){
  //  if (btn_Clicked(b)){
  //    noLoop();
  //    if      (b.equals(mainButtons.functionBtn))  mainScreen.set_ActiveMode(functionsMode);
  //    else if (b.equals(mainButtons.heatTimeBtn))  mainScreen.set_ActiveMode(heatTimeMode);
  //    else if (b.equals(mainButtons.clearOffBtn)) {
  //      if (mainScreen.state != 0)  
  //        mainScreen.get_ActiveMode().reset_CurrSettings();
  //      else {
  //        mainScreen.state = 1;
  //      }        
  //    }
  //    loop();
  //  }
  //}
  
  //for (Button b : mainScreen.get_ActiveMode().activeMirror.get_AllMirrorBtns()){
  //  if (btn_Clicked(b)){
  //    noLoop();
  //    mainScreen.get_ActiveMode().do_BtnClick(b);
  //    loop();
  //  }
  //}  
}