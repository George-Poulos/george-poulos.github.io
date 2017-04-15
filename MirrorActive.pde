


class MirrorActive extends Mirror {
  private String APPDOCK = "dock_apps.png";
  
  AppDrawer appDrawer;
  AppDrawerBtn appBtn;
  
  public MirrorActive(int x, int y, int w, int h){
    super(x,y,w,h); 
    create_RPanel();
    add_RPanelStuff();
    create_LPanel();
    add_InnerPanels();
    allBtns.addAll(appDrawer.innerPanelBtns);
  } 
  
  void add_RPanelStuff(){
    appDrawer = new AppDrawer(this.rightPanel);
    // creating AppDrawer button based on specs of a regular button.
    appBtn = new AppDrawerBtn(rightPanel.create_PanelBtn(
          rightPanel.panelRows-1, rightPanel.panelCols-2, true, fileLoc.concat(APPDOCK)));
    appBtn.set_BtnModule(appDrawer); 
    rightPanel.add_PanelBtn(appBtn);
    rightPanel.add_InnerPanel(appDrawer);
    
  }
  
}



/************************* AppDrawerBtn class and methods *************************/
/*           AppDrawerBtn is the Button that expands the AppDrawer                */
/**********************************************************************************/

class AppDrawerBtn extends Button {
  ButtonPanel module;
  
  public AppDrawerBtn(int x, int y, int w, int h){
    super(x,y,w,h);
  }
  
  // creates an AppDrawer button based on the specs of btn
  public AppDrawerBtn(Button btn){
    this(btn.locX, btn.locY, btn.szWidth, btn.szHeight);
    this.imgFlag = btn.imgFlag;
    this.btnImg = btn.btnImg;
  }
  
    //colInParent = 2;
    //rowInParent = parent.panelRows - this.panelRows;
    //this.set_PanelSize(this.panelCols*this.colWidth, this.panelRows*this.rowHeight);
    //this.locX = parent.locX;
    //this.set_PanelLoc(get_LocXInParent(colInParent), get_LocYInParent(rowInParent));



  public void set_BtnModule(ButtonPanel myMod){
    module = myMod;    
  }
  
  // overriding this so it opens the AppDrawer (instead of a module..)
  public void on_Click(){
    // toggle the button active state
    isActive = !isActive;
    // toggle its module's active state
    module.isActive = !module.isActive;
  }

}