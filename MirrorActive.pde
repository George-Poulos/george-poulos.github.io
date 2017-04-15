


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
    add_RPanelStuff();
    add_InnerPanels();
    allBtns.addAll(appDrawer.innerPanelBtns);
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
    if (!isActive){
      for (Button b : module.innerPanelBtns)
        b.set_isActive(false);
    }
  }

}