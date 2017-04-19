
class MirrorSetup extends Mirror {
  initialize initState;
  
  public MirrorSetup(){
    initState = new initialize();
  }
  
  // overridden from Mirror class, since we want to use the 
  // methods in initialize class to draw the mirror.
  public void draw_Mirror(){
    initState.drawBegin();
  }
  
}