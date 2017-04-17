


class MirrorActive extends Mirror {
  private String APPDOCK = "dock_apps.png";
  private String SETTINGS = "dock_settings.png";
  
  AppDrawer appDrawer;
  AppDrawerBtn appBtn;
  SettingsApp settingsApp;
  // where we store the settings when they get changed :)
  Settings currUserSettings;
  //Button settingsBtn;
  SettingsAppBtn settingsBtn;  // haha hooray for code reuse
  
  public MirrorActive(int x, int y, int w, int h){
    super(x,y,w,h); 
    create_LPanel();
    create_CPanel();
    create_RPanel();
    // put this here to add free space locs without hard-coding a  
    // column value for the free spaces on the right panel
    add_FreeSpace();
    add_AppDrawerStuff();
    add_SettingsAppStuff();
    add_InnerPanels();
    set_AppDrawerModuleLocs();
    allBtns.addAll(appDrawer.innerPanelBtns);
    allBtns.addAll(settingsApp.innerPanelBtns);
    currUserSettings = new Settings(this);
  } 
  
  // just sets all the modules for the app drawer (not incl. appdrawer btn and settings btn)
  // to be opened in the LeftPanel of the mirror. can change later if we want
  void set_AppDrawerModuleLocs(){
    for (Button b : appDrawer.innerPanelBtns)
      b.set_ModuleParent(leftPanel);
  }

  // create & add AppDrawer button and the AppDrawer panel 
  void add_AppDrawerStuff(){
    appDrawer = new AppDrawer(this.rightPanel);
    // creating AppDrawer button based on specs of a regular button.
    appBtn = new AppDrawerBtn(rightPanel.create_PanelBtn(
          rightPanel.panelRows-1, 2, true, fileLoc.concat(APPDOCK)));
    appBtn.set_BtnModule(appDrawer); 
    rightPanel.add_PanelBtn(appBtn);  
    rightPanel.add_InnerPanel(appDrawer);
  }
  
  // create & add Settings button and SettingsApp panel
  void add_SettingsAppStuff(){
    settingsApp = new SettingsApp(this.centerPanel);
    settingsBtn = new SettingsAppBtn(rightPanel.create_PanelBtn(
        rightPanel.panelRows-1,3,true,fileLoc.concat(SETTINGS)));
    settingsBtn.set_BtnModule(settingsApp);
    rightPanel.add_PanelBtn(settingsBtn);
    centerPanel.add_InnerPanel(settingsApp);     
  }
  
  public void do_SettingsClickStuff(){
    if (settingsApp.isActive){
      for (Button b : settingsApp.get_ActiveMode().innerPanelBtns){
        if (btn_Clicked(b)){
          noLoop();
          if (settingsApp.get_ActiveMode() == settingsApp.pMenu)
            b.on_Click();
          else {
            ((SettingsInnerPanel.SettingsBtn)b).on_Click(this);
          }
          //else if (! (b instanceof FakeButton)){
            //((SettingsInnerPanel.SettingsBtn)b).on_Click(this);
          //}
          loop();
        }
      }
    }
  }
  
}



/************************* AppDrawerBtn class and methods *************************/
/*           AppDrawerBtn is the Button that expands the AppDrawer                */
/**********************************************************************************/

class AppDrawerBtn extends Button { // ugh AppDrawerBtn could've extended FakeButton class
  ButtonPanel module;
    
  public AppDrawerBtn(int x, int y, int w, int h){
    super(x,y,w,h);
  }
  
  // creates an AppDrawer button based on the specs of btn
  public AppDrawerBtn(Button btn){
    this(btn.locX, btn.locY, btn.szWidth, btn.szHeight);
    this.imgFlag = btn.imgFlag;
    if (this.imgFlag) this.btnImg = btn.btnImg;
    else this.set_Text(btn.btnTxt);
  }
  
  // need this here.
  public void set_ModuleLoc(int r, int c){}
  
  public void set_BtnModule(ButtonPanel myMod){
    module = myMod;    
  }
  
  // overriding this so appDrawerBtn opens the AppDrawer (instead of a module..)
  // and same thing for settingsBtn (we want it to open SettingsApp)
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


class SettingsAppBtn extends AppDrawerBtn {
  //SettingsApp module;
  
  public SettingsAppBtn(Button btn){
    super(btn);
  }
  public void set_ModuleLoc(int r, int c){}
  
  //public void set_BtnModule(SettingsApp myMod){
  //  module = myMod;    
  //}
  
  public void on_Click(){
    super.on_Click();
    if (!this.module.isActive) 
      ((SettingsApp)module).reset_ActiveSettingsMode();
  } 
}