
/**********************************************************************************************/
/******************* CenterPanel, SidePanel, and Mirror class and methods ********************/
/**********************************************************************************************/

// I will deal with CenterPanel after I get SidePanels working right
class CenterPanel extends ButtonPanel {
  
  public CenterPanel(Mirror d){
    super();
    set_Margins(d);   
    
    set_PanelLoc(d.locX + d.leftPanel.szWidth, d.locY + this.marginTop);         
    set_PanelSize(d.szWidth - d.leftPanel.szWidth - d.rightPanel.szWidth, 
      d.szHeight - this.marginTop - this.marginBottom);
    
    set_PanelRC();
    super.set_BtnSizes();
  }   
    
  private void set_Margins(Panel p){
    //this.marginTop = this.marginBottom = (int)(p.szHeight / 10); 
    //this.marginLeft = this.marginRight = 0;
  }
  
  // implemented abstract fn from superclass
  void set_PanelRC(){
    panelRows = 2;
    panelCols = 2;
  }   
  
}

/*****************************************************************************************/

class SidePanel extends ButtonPanel {
  
  public SidePanel(Panel parent){
    super(parent.szWidth/8, parent.szHeight);
    calc_PanelRC(4);
  }
              
  // implemented abstract fn from superclass (default rows/cols for SidePanel)
  void set_PanelRC(){
    //this.panelCols = 4;
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
  
  public void create_RPanel(){
    rightPanel = new SidePanel(this);  // width,height based on mirror
    rightPanel.set_PanelLoc(this.locX + this.szWidth - rightPanel.szWidth, this.locY);  // x,y loc    
  }
  
  public void create_LPanel(){
    leftPanel = new SidePanel(this);                // width,height based on mirror
    leftPanel.set_PanelLoc(this.locX,this.locY);    // x,y loc    
  }
  
  // called from setup() in processing ?
  public void add_InnerPanels(){
    allPanels.add(leftPanel);
    allPanels.add(rightPanel);
    set_AllMirrorBtns();
    //add_CenterPanel();
  }
    
  // TODO: update this for project 2
  private void add_CenterPanel(){
    centerPanel = new CenterPanel(this); 
    allPanels.add(centerPanel);
  }
  
  
  // adds all the buttons from each panel to the list of all the Mirror's buttons
  public void set_AllMirrorBtns(){
    for (ButtonPanel p : allPanels)
      allBtns.addAll(p.innerPanelBtns);    
  }  
  
  public ArrayList<ButtonPanel> get_AllMirrorPanels(){
    return allPanels;
  }
        
  public ArrayList<Button> get_AllMirrorBtns(){
    return allBtns;
  }
        
  // draw Mirror by drawing each Panel and its buttons
  public void draw_Mirror(){    
      draw_Panel();  // ??
      leftPanel.draw_ButtonPanel();
      rightPanel.draw_ButtonPanel();
      //centerPanel.draw_ButtonPanel();      
  }
}