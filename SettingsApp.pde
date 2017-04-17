
class SettingsApp extends ButtonPanel {
  
  // TODO: I need an icon without a circle around it
  private String SETTINGS = "dock_settings.png";
  
  Settings settings;
  FakeButton settingsIcon, settingsWord;
  
  int rowInParent, colInParent;

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
    
    // create Settings instance
    settings = new Settings();
    
    create_Btns();
  }

  void create_Btns(){
    settingsIcon = new FakeButton(create_PanelBtn(0,0,2,2,true,fileLoc.concat(SETTINGS)));
    settingsWord = new FakeButton(create_PanelBtn(0,2,2,4));
    settingsWord.set_Text("Settings");
    
    
    
    
    add_PanelBtns(new Button[]{settingsIcon, settingsWord});
  }
  
}