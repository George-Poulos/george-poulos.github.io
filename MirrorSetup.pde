
class MirrorSetup extends Mirror {
  SetupState initState;
  
  public MirrorSetup(){
    //initState = new initialize();
    initState = new SetupState();
    initState.setup_SetupState();
  }
  
  // overridden from Mirror class, since we want to use the 
  // methods in initialize class to draw the mirror.
  public void draw_Mirror(){
    //initState.drawBegin();
    initState.draw_SetupState();
  }
  
  public void mouse_Pressed(){
    initState.mouse_Pressed();
  }
  
}