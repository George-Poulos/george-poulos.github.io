
class SettingsApp extends ButtonPanel {
  
  // TODO: I need an icon without a circle around it
  private String SETTINGS = "dock_settings.png";
  //int rowInParent, colInParent;
    
  Settings settings;
  // these parts will be shown to user the whole time
  FakeButton settingsIcon, settingsWord;
  
  MenuSettingsPanel pMenu;
  DisplaySettingsPanel pDisplayPrefs;
  LinkedAppsSettingsPanel pLinkedApps;
  PersonalSettingsPanel pPersonalPrefs;
  SettingsInnerPanel pActiveMode, pDefaultMode;

  public SettingsApp(ButtonPanel parent){
    super(parent);  // sets 1x1 row/col/button size to size of those in parent    
    // setup size and location in parent (centerpanel is parent here)
    this.panelCols = parent.panelCols-2;
    colInParent = 0;
    rowInParent = 4;
    this.panelRows = parent.panelRows-rowInParent;    
    this.set_PanelSize(this.panelCols*this.colWidth, this.panelRows*this.rowHeight);
    this.locX = parent.locX;
    this.set_PanelLoc(get_LocXInParent(colInParent), get_LocYInParent(rowInParent));
    
    settings = new Settings();    // create Settings instance  
    create_FakeBtns();
    init_SettingsInnerPanels();
    
    // will need to add all 4 inner panels eventually once they work
    add_InnerPanel(pMenu);
    add_InnerPanel(pDisplayPrefs);
    add_InnerPanel(pLinkedApps);
    add_InnerPanel(pPersonalPrefs);
    
    // initial starting screen
    pDefaultMode.set_isActive(true);
    pActiveMode = pDefaultMode;
  }

  // creates Settings icon and the "title" of this settings window
  private void create_FakeBtns(){
    settingsIcon = new FakeButton(create_PanelBtn(0,0,2,2,true,fileLoc.concat(SETTINGS)));
    settingsWord = new FakeButton(create_PanelBtn(0,2,2,4,"Settings"));
    settingsWord.set_BtnFont(clockFont);
    //settingsWord.set_TextAlignment(CENTER);
    add_PanelBtns(new Button[]{settingsIcon, settingsWord});
  }
  
  // just initializes the inner settings panels 
  private void init_SettingsInnerPanels(){
    pDisplayPrefs = new DisplaySettingsPanel(this);
    pLinkedApps = new LinkedAppsSettingsPanel(this);
    pPersonalPrefs = new PersonalSettingsPanel(this);
    pMenu = new MenuSettingsPanel(this);    
    pDefaultMode = pMenu;
  }
  
  // set this so we know which settings mode to draw (kind of like how we do the mirror drawing)
  void set_ActiveSettingsMode(SettingsInnerPanel p){
    get_ActiveMode().set_isActive(false);
    p.set_isActive(true);
    pActiveMode = p;
  }
  
  
  SettingsInnerPanel get_ActiveMode(){
    return pActiveMode;
  }
  
  
/********************************************************************/
/********************************************************************/
  
  /*** initial "menu" of settings types to choose ***/
  class MenuSettingsPanel extends SettingsInnerPanel {
    // "Menu" buttons to select which type of settings user would like to access. 
    // Made these AppDrawerBtns b/c they open a button panel (not a module) when clicked.
    SettingsMenuBtn displayPrefsBtn, linkedAppsBtn, personalInfoBtn;
    ArrayList<SettingsMenuBtn> menuBtns; 
    public MenuSettingsPanel(SettingsApp parent){
      super(parent);  // use constructor of SettingsInnerPanel :)
      create_Btns();
      set_SettingsInnerBtnModules(parent);
      //add_PanelBtns(new SettingsMenuBtn[]{displayPrefsBtn, linkedAppsBtn, personalInfoBtn});
      parent.add_InnerPanel(this);
      parent.add_PanelBtns(new SettingsMenuBtn[]{displayPrefsBtn, linkedAppsBtn, personalInfoBtn});
      
    }
    
    // implemented from abstract class SettingsInnerPanel; will be called during constructor 
    void create_Btns(){
      int listCols = panelCols;
      displayPrefsBtn = new SettingsMenuBtn(create_PanelBtn(0,0,1,listCols,"Display Preferences"));
      linkedAppsBtn = new SettingsMenuBtn(create_PanelBtn(1,0,1,listCols,"Linked Apps"));
      personalInfoBtn = new SettingsMenuBtn(create_PanelBtn(2,0,1,listCols,"Personal Information"));      
    }

    private void set_SettingsInnerBtnModules(SettingsApp p){
      displayPrefsBtn.set_BtnModule(p.pDisplayPrefs);
      linkedAppsBtn.set_BtnModule(p.pLinkedApps);
      personalInfoBtn.set_BtnModule(p.pPersonalPrefs);    
    } 
    
    // inner class for the three settings menu buttons
    class SettingsMenuBtn extends AppDrawerBtn {
      SettingsInnerPanel module;
      
      public SettingsMenuBtn(Button b){
        super(b);
        isActive = true;
      }
      public void set_BtnModule(SettingsInnerPanel m){
        module = m;
      }
      public void on_Click(){
        for (SettingsMenuBtn b : new SettingsMenuBtn[]{displayPrefsBtn, linkedAppsBtn, personalInfoBtn}) 
          b.isActive = false;
        set_ActiveSettingsMode(this.module);
      }      
    }
  }  
  
  
  
  class DisplaySettingsPanel extends SettingsInnerPanel {
    public DisplaySettingsPanel(SettingsApp parent){
      super(parent);  // use constructor of SettingsInnerPanel :)
      tempBtn = new FakeButton(create_PanelBtn(0,0,1,1,"FakeBtn - display settings"));
      tempBtn.font = dateFont;
      add_PanelBtns(new Button[]{tempBtn});      
    }
    
    void create_Btns(){
      
    }
  }  

  class LinkedAppsSettingsPanel extends SettingsInnerPanel {
    public LinkedAppsSettingsPanel(SettingsApp parent){
      super(parent);  // use constructor of SettingsInnerPanel :)
      tempBtn = new FakeButton(create_PanelBtn(0,0,1,1,"FakeBtn - linked apps"));
      tempBtn.font = dateFont;
      add_PanelBtns(new Button[]{tempBtn});      
    }
    
    void create_Btns(){
      
    }
  }  
  
  class PersonalSettingsPanel extends SettingsInnerPanel {
    public PersonalSettingsPanel(SettingsApp parent){
      super(parent);  // use constructor of SettingsInnerPanel :)
      tempBtn = new FakeButton(create_PanelBtn(0,0,1,1,"FakeBtn - personal info"));
      tempBtn.font = dateFont;
      add_PanelBtns(new Button[]{tempBtn});      
    }
    
    void create_Btns(){
      
    }    
  }    
}



/**** Settings Inner Panel - allows us to change display based on which Settings Mode the user chooses ****/
abstract class SettingsInnerPanel extends ButtonPanel {
  FakeButton tempBtn;
  
  public SettingsInnerPanel(SettingsApp parent){
    super(parent);  // sets 1x1 row/col/button size to size of those in parent    
    // setup size and location in parent (SettingsApp is parent here)
    colInParent = 2;
    rowInParent = 2;
    this.panelCols = parent.panelCols-colInParent;
    this.panelRows = parent.panelRows-rowInParent;    
    this.set_PanelSize(this.panelCols*this.colWidth, this.panelRows*this.rowHeight);
    this.locX = parent.locX;
    this.locY = parent.locY;
    this.set_PanelLoc(get_LocXInParent(colInParent), get_LocYInParent(rowInParent));
    // TODO: REMOVE THIS LINE ONCE WE KNOW ALL INNER SETTINGS PANELS WORK!
    create_Btns();
  }
  
  // could've prob made this an abstract method in ButtonPanel class :P
  abstract void create_Btns();
  
  void create_FakeTempBtn(){
    tempBtn = new FakeButton(create_PanelBtn(0,0,1,1,"Fake Temp Button!"));
    add_PanelBtns(new Button[]{tempBtn});    
  }
  
}