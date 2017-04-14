/*************** Mode class and methods ***************/

abstract class Mode {
  Mirror defaultMirror, activeMirror;
  ArrayList<Mirror> allMirrors;

  abstract void create_Mirrors(Panel p);
  abstract void create_ModeBtns();
  abstract void reset_Mirrors();
  abstract void show_DefaultMirror();
  public abstract void do_BtnClick(Button b); 
  
  public Mode(Panel p){
    allMirrors = new ArrayList<Mirror>();
    create_Mirrors(p); 
    create_ModeBtns();
    set_MirrorsAllBtns();
  }
  
  public void reset_CurrSettings(){
    reset_Mirrors();
    show_DefaultMirror();
  }
  
  // adds each Mirror to the Mode's list of all Mirrors
  void add_AllMirrors(Mirror[] displays){
    for (Mirror d : displays){
      add_Mirror(d);
    }
  }
  
  void add_Mirror(Mirror d){
    allMirrors.add(d);
  }
  
  // sets each Mirror's list of "all buttons"
  void set_MirrorsAllBtns(){
    for (Mirror d : allMirrors)
      d.set_AllMirrorBtns();
  }

  public void set_ActiveMirror(Mirror display){
    activeMirror = display;
    activeMirror.draw_Mirror();
  }  
  
  public void draw_Mode(){
    activeMirror.draw_Mirror();
  }
}