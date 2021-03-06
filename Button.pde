/*************** Button class and functions ***************/

class Button extends Panel implements ActionListener {
  PFont font;
  //PShape btnImg;    // made it a PShape so we can have .svg files :)
  // COMMENT THIS LINE AND UNCOMMENT ABOVE LINE ONCE ICONS ARE .SVG
  PImage btnImg;
  boolean imgFlag;
  String btnTxt = "";  // we won't use this as much for project 2
  color clr, activeClr, inactiveClr;
  int btnTxtAlign;
  int btnTxtAlignVert;
  ButtonPanel moduleParent;  // sets the panel that btnModule will open in
  int padding;  // move this into Panel class???
  Module module;

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
  
  public Button(Button btn){
    this(btn.locX, btn.locY, btn.szWidth, btn.szHeight);
  }
  
  // implemented from ActionListener interface
  // this gets called from mouseReleased(), after we have set the 
  // location of the module!
  public void on_Click(){
    // toggle the button active state
    isActive = !isActive;
    module.setVisibility(isActive);
    // hopefully this will only display the module if the button is "active",
    // and will close it otherwise.
    if (isActive)  
      module.displayModule();    
  }
  
  //public void on_Click(Mirror m){ }
  
  //
  // TODO: can we delete this???
  //
  public void on_Click(boolean bool){
    // toggle the button active state
    isActive = bool;
    module.setVisibility(isActive);
    // hopefully this will only display the module if the button is "active",
    // and will close it otherwise.
    if (isActive)  
      module.displayModule();    
  }
  
  // sets the panel that btnModule will be opened in
  public void set_ModuleParent(ButtonPanel p){
    moduleParent = p;
  }
  
  // called from mouseReleased() function to tell btnModule which row,col to open in
  public void set_ModuleLoc(int row, int col){
    int x,y;
    x = moduleParent.get_LocXInParent(col);
    y = moduleParent.get_LocYInParent(row);
    module.setLocation(x,y);
  }

  //////////////////////////////////////////////////////////
  //// methods to setup the appearance of the buttons //////
  //////////////////////////////////////////////////////////
  private void set_BtnDefaults(){
    padding = 1;
    font = defaultFont;
    btnTxtAlign = LEFT;
    btnTxtAlignVert = TOP;
    corner = 5;
    // these colors have been updated for Project 2 :)
    //activeClr = color(255);
    //inactiveClr = color(235);
    activeClr = DEFAULTICONCOLOR;
    inactiveClr = create_InactiveColor(activeClr);
    clr = inactiveClr;  // might delete this for proj2
    module = new Module(100,100,100,100);
  }

  void set_Color(color c){
    clr = c;
  }

  void set_ActiveColor(color c){
    activeClr = c;
    inactiveClr = create_InactiveColor(activeClr);
  }

  void set_BtnFont(PFont f){
    font = f;
  }
  void set_Text(String txt){
    btnTxt = txt;
  }
  
  void set_TextAlignment(int newAlign){
    btnTxtAlign = newAlign;
  }

  void set_VertTextAlignment(int newAlign){
    btnTxtAlignVert = newAlign;
  }

  // we call disableStyle() so that we can color the .svg how we want
  void set_Img(String img){
    imgFlag = true;
    //btnImg = loadShape(img);
    //btnImg.disableStyle();   
    // COMMENT THESE 2 LINES AND UNCOMMENT ABOVE 2 LINES ONCE ICONS ARE .SVG
    btnImg = loadImage(img);
  }

  // rounded corner for drawing rectangle buttons without images
  void set_Corner(int c){
    this.corner = c;
  }
  
  public void prep_BtnTextAppearance(){
    setup_Text(font, ICONCOLOR, btnTxtAlign, btnTxtAlignVert);
  }

  //////////////////////////////////////////////////////////
  ////     button action / draw to screen methods     //////
  //////////////////////////////////////////////////////////

  public color get_Color(){
    return clr;
  }

  public void draw_Btn(){
    if (imgFlag){  // this should usually evaluate to TRUE for project 2
      //stroke(66, 188, 244);  // a pretty blue
      strokeWeight(0.25);
      if (isActive){
        stroke(activeClr);
        // this doesn't actually fill in the icon - it fills the vector paths
        //fill(activeClr);
        noTint();
        module.displayModule();
        // COMMENT THIS LINE ONCE ICONS ARE .SVG
        noTint();
      }
      else {
        stroke(inactiveClr);
        fill(inactiveClr);
        // COMMENT THIS LINE ONCE ICONS ARE .SVG
        tint(inactiveClr);
      }

      // draws button icon from center of where I tell it to go
      //shapeMode(CENTER);
      //shape(btnImg, locX+(int)(szWidth/2), locY+(int)(szHeight/2), 
      //      szWidth-2*padding, szHeight-2*padding);
      
      // COMMENT THESE 2 LINES AND UNCOMMENT ABOVE 2 LINES ONCE ICONS ARE .SVG
      imageMode(CENTER);
      image(btnImg, locX+(int)(szWidth/2), locY+(int)(szHeight/2), 
            szWidth-2*padding, szHeight-2*padding);      
    }
    
    else {
      //if (isActive) {  // buttons with text instead of an image
        noFill();    
        stroke(0.5);
        //rect(locX, locY, szWidth, szHeight, corner); 
  
        //setup_Text(font, 255, btnTxtAlign);
        setup_Text(font, ICONCOLOR, btnTxtAlign, btnTxtAlignVert);
        //rectMode(CENTER);  // this is just where to draw the text inside a button from so it's centered.
        //text(btnTxt, locX+(szWidth/2), locY+(szHeight/2));
        text(btnTxt, locX, locY);
        rectMode(CORNER);
      //} 
    }
  }
  
}