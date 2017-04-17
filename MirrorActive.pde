


class MirrorActive extends Mirror {
  private String APPDOCK = "dock_apps.png";
  private String SETTINGS = "dock_settings.png";
  
  AppDrawer appDrawer;
  AppDrawerBtn appBtn;
  Button settingsBtn;
  
  public MirrorActive(int x, int y, int w, int h){
    super(x,y,w,h); 
    create_LPanel();
    create_CPanel();
    create_RPanel();
    // put this here to add free space locs without hard-coding a  
    // column value for the free spaces on the right panel
    add_FreeSpace();
    add_RPanelStuff();
    add_InnerPanels();
    set_AppDrawerModuleLocs();
    allBtns.addAll(appDrawer.innerPanelBtns);
  } 
  
  // just sets all the modules for the app drawer (not incl. appdrawer btn and settings btn)
  // to be opened in the LeftPanel of the mirror. can change later if we want
  void set_AppDrawerModuleLocs(){
    for (Button b : appDrawer.innerPanelBtns)
      b.set_ModuleParent(leftPanel);
  }
  
  void add_RPanelStuff(){
    appDrawer = new AppDrawer(this.rightPanel);
    // creating AppDrawer button based on specs of a regular button.
    appBtn = new AppDrawerBtn(rightPanel.create_PanelBtn(
          rightPanel.panelRows-1, 2, true, fileLoc.concat(APPDOCK)));
    appBtn.set_BtnModule(appDrawer); 
    
    settingsBtn = rightPanel.create_PanelBtn(
        rightPanel.panelRows-1,3,true,fileLoc.concat(SETTINGS));
            
    rightPanel.add_PanelBtn(settingsBtn);
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
  
  // need this here.
  public void set_ModuleLoc(int r, int c){}
  
  public void set_BtnModule(ButtonPanel myMod){
    module = myMod;    
  }
  
  // overriding this so it opens the AppDrawer (instead of a module..)
  public void on_Click(){
    // toggle the button's active state
    isActive = !isActive;
    // toggle its module's active state
    module.isActive = !module.isActive;
    
    // if we've closed the app drawer, set the buttons to be not active
    // EDIT: this is actually not desirable now that the buttons will open their 
    // respective modules.  Widgets should keep their locations if the app drawer 
    // is closed, but should be "hidden" until we reopen the app drawer :)
    //if (!isActive){
    //  for (Button b : module.innerPanelBtns)
    //    b.set_isActive(false);
    //}
  }

}