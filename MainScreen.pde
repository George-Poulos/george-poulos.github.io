/*********************************************************************************/
/************************* MainScreen class and methods **************************/
/* MainScreen is the screen in the middle of the glass where options are chosen  */
/*********************************************************************************/

class MainScreen extends Panel {
  Mode activeMode;
  
  public MainScreen(int outerWidth, int outerHeight){
    super();
    set_MainScreenSizeLoc(outerWidth, outerHeight);
  }
  
  // we want the MainScreen to be centered in the drawing canvas
  private void set_MainScreenSizeLoc(int w, int h){
    locX = (int)(w/4); 
    locY = (int)(h/8); 
    szWidth = (int)(w/2); 
    szHeight = 3*((int)(h/2));
  }
  
  public Mode get_ActiveMode(){
    return activeMode;
  }
  
  // when pressing one of MainButtons we switch the active mode 
  public void set_ActiveMode(Mode mode){
    activeMode = mode;
  }
  
  public void draw_ActiveMode(){ 
    if (this.state != 0)
      activeMode.draw_Mode();    
  }
  
}