/********************************************************************/
/***************       Panel class and methods        ***************/

abstract class Panel {  // --> can this be an abstract class ???
  int state;
  int locX, locY, szWidth, szHeight, corner;
  color fillColor;
    
  public Panel(){
    state = -1;
    fillColor = color(25,25,25);
    corner = 0;
    // width = 0; height = 0;
  }
  public Panel(int w, int h){
    this();
    set_PanelSize(w,h);
  }
  public Panel(int x, int y, int w, int h){
    this(w,h);
    set_PanelLoc(x,y);
  }
  
  public Panel(Panel p){
    this(p.locX, p.locY, p.szWidth, p.szHeight);
  }
  
  public Panel(int x, int y, int w, int h, color c){
    this(x,y,w,h);
    fillColor = c;
  }
  
  public void set_PanelSize(int w, int h){
    szWidth = w;  szHeight = h;
  }
  public void set_PanelLoc(int x, int y){
    locX = x;  locY = y;
  }
  
  void draw_Panel(){
    noStroke();
    fill(fillColor);
    if (state != 0)       
      rect(locX, locY, szWidth, szHeight, corner);
  }
  
  public void set_FillColor(color c){
    fillColor = c;
  }
  
  boolean is_MouseOverItem(){
    return mouseX>locX && mouseX<locX+szWidth &&  
      mouseY>locY && mouseY<locY+szHeight;
  } 
}