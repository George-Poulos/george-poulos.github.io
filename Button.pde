/*************** Button class and functions ***************/

class Button extends Panel implements ActionListener {
  //PImage btnImg;
  PFont font;
  PShape btnImg;    // made it a PShape so we can have .svg files :)
  boolean imgFlag;
  boolean isActive;
  String btnTxt = "";  // we won't use this as much for project 2
  color clr, activeClr, inactiveClr;
  int padding;  // move this into Panel class???
  
  // no specified color or text
  public Button(int x, int y, int w, int h){
    super(x,y,w,h);
    set_BtnDefaults();
  }

  // specified text but no specified color
  public Button(int x, int y, int w, int h, String txt){
    this(x,y,w,h);
    btnTxt = txt;
  }
  
  // specified color and specified text - we can prob get rid of this
  // once the project 1 timer buttons are gone.
  public Button(int x, int y, int w, int h, color c, String txt){
    this(x,y,w,h,txt);
    clr = c;
  }
  
  // implemented from ActionListener interface
  public void on_Click(){
    // toggle the button active state
    isActive = !isActive;
    //open_Module();    // not yet implemented :)
  }
  
  ////////////////////////////////////////////////////////// 
  //// methods to setup the appearance of the buttons //////
  //////////////////////////////////////////////////////////
  private void set_BtnDefaults(){
    padding = 5;
    font = defaultFont;
    corner = 5;
    // these colors have been updated for Project 2 :)
    activeClr = color(255);
    inactiveClr = color(235);
    clr = inactiveClr;  // might delete this for proj2    
  }
  
  void set_isActive(boolean newIsActive){
    isActive = newIsActive;
  }
  
  void set_Colors(color c){
    clr = c;
  }
  
  // allows us to click on a button but not show any feedback -> "fake button"
  void clear_ClickColor(){
    activeClr = inactiveClr;
  }
  
  void set_ClickColor(color c){
    activeClr = c;
  }
  
  void set_BtnFont(PFont f){
    font = f;
  }  
  void set_Text(String txt){
    btnTxt = txt;
  }
  
  // we call disableStyle() so that we can color the .svg how we want
  void set_Img(String img){
    imgFlag = true;
    btnImg = loadShape(img);
    btnImg.disableStyle();    
  }
  
  // rounded corner for drawing rectangle buttons without images
  void set_Corner(int c){
    this.corner = c;
  }
  
  ////////////////////////////////////////////////////////// 
  ////     button action / draw to screen methods     //////
  //////////////////////////////////////////////////////////
  
  
  // something like this will be implemented for project 2
  void do_ClickAction(){
    //System.out.println(this.text);
  }
  
  public void draw_Btn(){
    if (imgFlag){  // this should usually evaluate to TRUE for project 2 
      //stroke(66, 188, 244);  // a pretty blue
      strokeWeight(0.25);
      if (isActive){
        stroke(activeClr);
        // this doesn't actually fill in the icon - it fills the vector paths
        fill(activeClr);  
      }
      else {
        stroke(inactiveClr);
        fill(inactiveClr);
      }
      
      // draws button icon from center of where I tell it to go
      shapeMode(CENTER);
      shape(btnImg, locX+(int)(szWidth/2), locY+(int)(szHeight/2), 
            szWidth-2*padding, szHeight-2*padding);
      //shape(btnImg, locX, locY, 48, 48);
    }
    
    else {  // the else part we will need to update for any buttons that 
            // have text but do not have an outline.
      rect(locX, locY, szWidth, szHeight, corner); 
      setup_Text(font, 255);
      text(btnTxt, locX+(int)(szWidth/2), locY+(int)(szHeight/2));
    }    
  }
  
}
