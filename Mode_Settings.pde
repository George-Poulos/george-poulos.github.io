
/*************** SettingsMode class and methods ***************/

class SettingsMode extends Mode {
  Button tempModeBtn, wifiBtn, autoOffBtn, muteBtn;
  SettingsMirror settingsMirror;
  
  public SettingsMode(Panel p){
    super(p);
    this.show_DefaultMirror();
  }
  
  // implemented abstract method from superclass
  void create_Mirrors(Panel p){
    settingsMirror = new SettingsMirror(p);
    super.add_Mirror(settingsMirror);
  }
  
  // implemented abstract method from superclass
  void create_ModeBtns(){
    Button tmpBtn1, tmpBtn2;
    SettingsMirror d = settingsMirror;
    tempModeBtn = d.centerPanel.create_PanelBtn(0,0,"°F /\n°C");
    muteBtn = d.centerPanel.create_PanelBtn(0,1,"MUTE\nTIMER");
    autoOffBtn = d.centerPanel.create_PanelBtn(0,2,"AUTO\nOFF");
    tmpBtn1 = d.centerPanel.create_PanelBtn(1,0,"");
    wifiBtn = d.centerPanel.create_PanelBtn(1,1,"WiFi");
    tmpBtn2 = d.centerPanel.create_PanelBtn(1,2,"");
    
    d.centerPanel.add_PanelBtns(
        new Button[]{tempModeBtn, muteBtn, autoOffBtn, tmpBtn1, wifiBtn, tmpBtn2});     
  }
  
  // implemented abstract method from superclass
  void reset_Mirrors(){
    reset_AllBtnStates(settingsMirror.allBtns);
  }
  
  // implemented abstract method from superclass
  void show_DefaultMirror(){
    set_ActiveMirror(settingsMirror);
  }
  
  // implemented abstract method from superclass
  void do_BtnClick(Button b){
    b.state = -1*b.state;
  }
  
  // nested SettingsMirror class
  class SettingsMirror extends Mirror {
    public SettingsMirror(Panel p){
      super(p);
      centerPanel.set_PanelRC(2,3);
    }
  }

}