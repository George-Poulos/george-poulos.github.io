
/**********************************************************************************************/
/******************* CenterPanel, SidePanel, and Mirror class and methods ********************/
/**********************************************************************************************/

// I will deal with CenterPanel after I get SidePanels working right
class CenterPanel extends ButtonPanel {
    
  public CenterPanel(Panel parent){
    super(parent.szWidth/2, parent.szHeight);
  }
    
      
  // implemented abstract fn from superclass
  void set_PanelRC(){  }   
  
}

/*****************************************************************************************/

class SidePanel extends ButtonPanel {
  
  public SidePanel(Panel parent){
    super(parent.szWidth/4, parent.szHeight);
    calc_PanelRC(4);
  }
              
  // implemented abstract fn from superclass (default rows/cols for SidePanel)
  void set_PanelRC(){  }
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
  private ArrayList<ButtonPanel> allPanels;  
  ArrayList<Button> allBtns;
  
  public Mirror(int x, int y, int w, int h){
    super(x,y,w,h);  
    init_BtnsAndPanels();
  }   
  
  // will get rid of this soon
  public Mirror(Panel p){  
    this(p.locX, p.locY, p.szWidth, p.szHeight);
  }
  
  private void init_BtnsAndPanels(){
    allPanels = new ArrayList<ButtonPanel>();
    allBtns = new ArrayList<Button>();      
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
  
  // called from setup() in processing ?
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
  public void draw_Mirror(){    
      //draw_Panel();  // ??
      draw_PanelLine(leftPanel);
      leftPanel.draw_ButtonPanel();
      draw_PanelLine(centerPanel);
      centerPanel.draw_ButtonPanel();      
      draw_PanelLine(rightPanel);
      rightPanel.draw_ButtonPanel();
  }
  
  // just to test where the boundaries are!
  public void draw_PanelLine(Panel p){
    stroke(0);
    line(p.locX, p.locY, p.locX, p.szHeight);
  }
  
}