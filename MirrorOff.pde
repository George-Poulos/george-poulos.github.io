

class MirrorOff extends Mirror {
  
  private String POWER = "power-512.png";
  
  // TODO: override Button class here so power button turns on mirror
  Button powerBtn;
  
  
  public MirrorOff(int x, int y, int w, int h){
    super(x,y,w,h); 
    create_LPanel();
    create_CPanel();
    create_RPanel();
    add_CenterPanelStuff();
    add_InnerPanels();
  } 
  
  public void add_CenterPanelStuff(){
    powerBtn = centerPanel.create_PanelBtn(
        centerPanel.panelRows-1,centerPanel.panelCols/2,true,fileLoc.concat(POWER));
            
    centerPanel.add_PanelBtn(powerBtn);  
  }  
}