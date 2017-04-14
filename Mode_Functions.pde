
/*************** FunctionsMode class and methods ***************/

class FunctionsMode extends Mode {
    
  Button settingsBtn;  // settings (GEAR icon) button
  Mirror functionsMirror;
  String selectedFunction = "";  // so we can show it to the user
  
  // sizes of inner panels are based on outer enclosing panel
  public FunctionsMode(Panel p){
    super(p);
    //this.defaultMirror = functionsMirror;
    set_ActiveMirror(functionsMirror);
  }
  
  void reset_Mirrors(){
    selectedFunction = "";
  }
  
  // implemented abstract method from superclass Mode
  void create_Mirrors(Panel p){
    functionsMirror = new Mirror(p);
    functionsMirror.centerPanel.set_PanelRC(2,3);  
    functionsMirror.rightPanel.set_PanelRC(5,1);
    add_Mirror(functionsMirror);
  }
  
  // implemented abstract method from superclass
  void create_ModeBtns(){
    functionsMirror.centerPanel.add_PanelBtn(0,0,"BAKE");
    functionsMirror.centerPanel.add_PanelBtn(0,1,"CONVECTION");
    functionsMirror.centerPanel.add_PanelBtn(0,2,"BROIL");    
    functionsMirror.centerPanel.add_PanelBtn(1,0,"TOAST /\nBAGEL");
    functionsMirror.centerPanel.add_PanelBtn(1,1,"WARM");
    functionsMirror.centerPanel.add_PanelBtn(1,2,"DEFROST");
    // let's make the click color blue
    for (Button b : functionsMirror.centerPanel.get_PanelBtns())
      b.set_ClickColor(color(66, 182, 244));
        
    settingsBtn = functionsMirror.rightPanel
        .create_PanelBtn(0,0,"SETTINGS");    
    //settingsBtn.set_Img("setting.png");
    functionsMirror.rightPanel.add_PanelBtn(settingsBtn);        
  }
  
  // implemented abstract method from superclass
  void show_DefaultMirror(){
    reset_CenterPanel();
    set_ActiveMirror(functionsMirror);
  }
    
  // when we click on one of the cook type modes in the center panel
  private void set_SelectedFunction(Button b){
    reset_CenterPanel();
    b.set_State(1);
    selectedFunction = b.btnTxt;   
  }
  
  // implemented abstract method from superclass
  public void do_BtnClick(Button b){
    if (b.equals(settingsBtn)) open_SettingsMode();
    else set_SelectedFunction(b);
  }
  
  // clears any selected cook type button from center panel 
  private void reset_CenterPanel(){
    reset_AllBtnStates(functionsMirror.centerPanel.get_PanelBtns());
  }
}