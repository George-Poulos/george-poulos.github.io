/********************************************************************/
/***************       Panel class and methods        ***************/

// everything that can be drawn is a Panel. 
abstract class Panel { 
  int state;
  int locX, locY, szWidth, szHeight, corner;
  color fillColor;
  boolean isActive;
  
  public Panel(){
    state = -1;
    corner = 0;
  }
  public Panel(int w, int h){
    this();
    set_PanelSize(w,h);
  }
  public Panel(int x, int y, int w, int h){
    set_PanelSize(w,h);
    set_PanelLoc(x,y);
  }
  public Panel(Panel p){
    this(p.locX, p.locY, p.szWidth, p.szHeight);
  }
  
  public Panel(int x, int y, int w, int h, color c){
    this(x,y,w,h);
    set_FillColor(c);
  }
  
  public void set_PanelSize(int w, int h){
    szWidth = w;  szHeight = h;
  }
  public void set_PanelLoc(int x, int y){
    locX = x;  locY = y;
  }
  
  
  // this might be legit not doing anything useful haha
  void draw_Panel(){
    noStroke();
    noFill();
    //fill(fillColor);
    if (state != 0)       
      rect(locX, locY, szWidth, szHeight, corner);
  }
  
  public void set_FillColor(color c){
    fillColor = c;
  }
  
  public void set_State(int newState){
    state = newState;
  }
  
  void set_isActive(boolean newIsActive){
    isActive = newIsActive;
  }
  
  // need this for all onClick() stuff!!!
  boolean is_MouseOverItem(){
    return mouseX>locX && mouseX<locX+szWidth &&  
      mouseY>locY && mouseY<locY+szHeight;
  } 
}