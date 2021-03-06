
/**********************************************************************************************/
/******************* CenterPanel, SidePanel, and Mirror class and methods ********************/
/**********************************************************************************************/

// I will deal with CenterPanel after I get SidePanels working right
class CenterPanel extends ButtonPanel {
    
  public CenterPanel(Panel parent){
    super(parent.szWidth/2, parent.szHeight);
  }
  
}

/*****************************************************************************************/

class SidePanel extends ButtonPanel {
  
  public SidePanel(Panel parent){
    super(parent.szWidth/4, parent.szHeight);
    calc_PanelRC(4);
  }              
}

/**********************************************************************************************/
/*****************************    Mirror Class     ********************************************/
/**********************************************************************************************/

/**  
    Mirror is really just a project-specific implementation of the Panel abstract class.  
    Mirror is more of a "Mirror Layout" - it just places objects into a left, center, or right panel.
    
    Each "Mirror Mode" (diff. class) will be what determines which "Mirror" display is shown, 
    ie. "MirrorActive" will have the AppDrawer / icons, weather, user's name, etc, 
        "MirrorSetup" will contain the (multiple) mirror setup stages  ....
*/
class Mirror extends Panel {
  
  SidePanel leftPanel, rightPanel;
  CenterPanel centerPanel;
  
  // just so we can access all the buttons easily
  ArrayList<ButtonPanel> allPanels;  
  ArrayList<Button> allBtns;
  ArrayList<Point> widgetFreeSpace;
  
  // added empty constructor to allow MirrorSetup to function as 
  // a "wrapper" Mirror class for 'initialize' class
  public Mirror(){}
  
  public Mirror(int x, int y, int w, int h){
    super(x,y,w,h);  
    init_BtnsAndPanels();
  }   
  
  // adding this because all the "mirrors" will have same 
  // panel sizes etc. - will use this but add stuff to copy m
  public Mirror(Mirror m){
    this(m.locX, m.locY, m.szWidth, m.szHeight);
  }

  private void init_BtnsAndPanels(){
    allPanels = new ArrayList<ButtonPanel>();
    allBtns = new ArrayList<Button>();
    // added this here - this method is really just to initialize the arraylists
    widgetFreeSpace = new ArrayList<Point>();
  }
  
  // created this so that we can call it on MirrorSetup 
  // when it is the "current mirror state"
  //public void mouse_Pressed(){ }
  
  public boolean btn_Clicked(Button btn){
    return btn.is_MouseOverItem();
  }
  
  /**
  * TODO : Only enough space for 6 widgets on each panel... need a solution
  */
  void LocateModule(){
      for (Button b : allBtns){
        if (btn_Clicked(b)){
          noLoop();
          if(!(b instanceof AppDrawerBtn || b instanceof FakeButton)){  
            for(Point p : widgetFreeSpace){  // note to self: widgetFreeSpace holds (row,col) free spaces.
              int compY = b.moduleParent.get_LocYInParent(p.x);
              int compX = b.moduleParent.get_LocXInParent(p.y);
              if(!p.taken && !b.isActive){
                b.set_ModuleLoc(p.x,p.y);
                p.taken = true;
                break;
              }
              else if(compY == b.module.locationY && compX == b.module.locationX && b.isActive){
                p.taken = false;
                break;
              }
            }
          }
          // call b.onClick() method, which should, at the very least, open the selected 
          // button's Module and will toggle the button state (active=1 vs inactive=0).
          // (because if button is "active" we color it differently (activeClr vs. inactiveClr))
          b.on_Click();  
          loop();
        }    
      }
  }
  
  // this does what setFreeSpace() did, only diff is that I  //<>// //<>//
  // init'd widgetFreeSpace separately in init_BtnsAndPanels().
  void add_FreeSpace(){
    int center = 2;
    // add left panel free spaces
    for(int i = 5; i < 15; i+=3){
      widgetFreeSpace.add(new Point(i,center));
    }
    
    // add right panel free spaces    
    int rcol = center + this.leftPanel.panelCols + this.centerPanel.panelCols;
    for(int i = 5; i < 15; i+=3){
      widgetFreeSpace.add(new Point(i,rcol));
    }
  }
  
  // this and method below are used to add free space locs for the *left mirror*
  // and *right mirror*; we need these because of the location of the clock
  void addFreespaceLeftMirror(){
    int center = 2;
    widgetFreeSpace.add(0,new Point(2,center));
    widgetFreeSpace.add(5,new Point(17,center));
  }    
  void addFreespaceRighttMirror(){
    int center = 2;
    int rcol = center + this.leftPanel.panelCols + this.centerPanel.panelCols;
    widgetFreeSpace.add(4,new Point(17,center));
    widgetFreeSpace.add(5,new Point(2,rcol));
  }
  
  void create_RPanel(){
    rightPanel = new SidePanel(this);  // width,height based on mirror
    rightPanel.set_PanelLoc(this.locX + leftPanel.szWidth + centerPanel.szWidth,this.locY);
  }
  
  void create_LPanel(){
    leftPanel = new SidePanel(this);                // width,height based on mirror
    leftPanel.set_PanelLoc(this.locX,this.locY);    // x,y loc   
  }
  
  void create_CPanel(){
    centerPanel = new CenterPanel(this);
    centerPanel.set_PanelLoc(this.locX+leftPanel.szWidth, this.locY);
    centerPanel.colWidth = leftPanel.colWidth;
    centerPanel.rowHeight = leftPanel.rowHeight;
    centerPanel.panelRows = leftPanel.panelRows;
    centerPanel.panelCols = centerPanel.szWidth / centerPanel.colWidth;
    centerPanel.set_BtnSizes();
  }
  
  // called from subclass constructors
  public void add_InnerPanels(){
    allPanels.add(leftPanel);
    allPanels.add(centerPanel);
    allPanels.add(rightPanel);
    set_AllMirrorBtns();
  }
    
  // adds all the buttons from each panel to the list of all the Mirror's buttons
  public void set_AllMirrorBtns(){
    for (ButtonPanel p : allPanels){
      allBtns.addAll(p.innerPanelBtns);  
    }
  }  
  
  public ArrayList<ButtonPanel> get_AllMirrorPanels(){
    return allPanels;
  }
        
  public ArrayList<Button> get_AllMirrorBtns(){
    return allBtns;
  }
        
  // draw Mirror by drawing each Panel and its buttons
  public void draw_Mirror(){       //<>// //<>//
    noStroke();
    fill(215); 
    rectMode(CORNER);
    rect(0, locY, sidePadding, szHeight);  // left outer padding
       
      //draw_PanelLine(currMirrorRight.leftPanel);      
      leftPanel.draw_ButtonPanel();   //<>// //<>//
      
      //draw_PanelLine(centerPanel);   //<>// //<>//
            
      centerPanel.draw_ButtonPanel();        //<>// //<>//

      //draw_GridLines(centerPanel);  
      
      //draw_PanelLine(rightPanel);   //<>// //<>//
      
      rightPanel.draw_ButtonPanel();   //<>// //<>//
      //line(rightPanel.locX+rightPanel.szWidth, rightPanel.locY, 
      //    rightPanel.locX+rightPanel.szWidth, rightPanel.szHeight);
    
    noStroke();      
    fill(215);  
    rectMode(CORNER);
    rect(locX+mirrorWidth, locY, sidePadding, szHeight);  // right outer padding    
  }

  // just to check where the outer side mirror edges are drawn
  public void draw_OuterFrame() {
    fill(215);  
    rect(0, locY, locX, szHeight);  // left outer padding
    rect(locX+mirrorWidth, locY, sidePadding, szHeight);  // right outer padding
  }

  // so we know where the side panels are on the mirrors 
  public void draw_PanelLine(Panel p){
    stroke(100);   //<>//
    line(p.locX, p.locY, p.locX, p.szHeight);  //<>//
  }   
    
        //<>//
  // testing purposes  //<>// //<>// //<>//
  public void draw_GridLines(ButtonPanel p){
    int i;    
    // line is (startX, startY, endX, endY)
      // vertical lines
      for (i=1; i<p.panelCols; i++)
        line(p.locX + i*p.colWidth, p.locY, p.locX + i*p.colWidth, p.szHeight);
      // horiz. lines
      for (i=1; i<p.panelRows; i++)
        line(p.locX, p.locY + i*p.rowHeight, p.locX+p.szWidth, p.locY + i*p.rowHeight);
  }
  
}  //<>// //<>//