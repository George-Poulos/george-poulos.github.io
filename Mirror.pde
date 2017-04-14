
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
/*****************************    Mirror Class     *******************************************/

/**  
    Mirror is really just a project-specific extension of the Panel abstract class.  
    Each "Mode" has a "default display" and an "active display".  A Mirror is the enclosure for
     multiple panels - this allows us to group related (ButtonPanels) together, which creates a Mode.
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
  
  // can prob get rid of this.
  public Mirror(Panel p){  
    this(p.locX, p.locY, p.szWidth, p.szHeight);
  }
  
  private void init_BtnsAndPanels(){
    allPanels = new ArrayList<ButtonPanel>();
    allBtns = new ArrayList<Button>();    
  }
  
  // called from setup() in processing
  public void add_InnerPanels(){
    add_LeftPanel();
    add_RightPanel();
    //add_CenterPanel();
  }
  
  private void add_LeftPanel(){
    leftPanel = new SidePanel(this); // width,height based on mirror
    leftPanel.set_PanelLoc(this.locX,this.locY);    // x,y loc
    add_InnerPanel(leftPanel);
  }
  
  private void add_RightPanel(){
    rightPanel = new SidePanel(this);  // width,height based on mirror
    rightPanel.set_PanelLoc(this.locX + this.szWidth - rightPanel.szWidth, this.locY);  // x,y loc
    add_InnerPanel(rightPanel);
  }
  
  // TODO: update this for project 2
  void add_CenterPanel(){
    centerPanel = new CenterPanel(this); 
    add_InnerPanel(centerPanel);
  }
  
  private void add_InnerPanel(ButtonPanel p){
    allPanels.add(p);
  }
  
  // adds all the buttons from each panel to the list of all the Mirror's buttons
  public void set_AllMirrorBtns(){
    for (ButtonPanel p : allPanels)
      allBtns.addAll(p.panelBtns);    
  }  
  
  public ArrayList<Button> get_AllMirrorBtns(){
    return allBtns;
  }
      
  // draw Mirror by drawing each Panel and its buttons
  public void draw_Mirror(){    
      //draw_Panel();  // ??
      leftPanel.draw_ButtonPanel();
      rightPanel.draw_ButtonPanel();
      //centerPanel.draw_ButtonPanel();      
  }
}