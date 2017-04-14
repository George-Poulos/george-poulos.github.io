/************************* AppDrawer class and methods **************************/
/*           AppDrawer is the ButtonPanel on the right side of the oven         */
/**********************************************************************************/

class AppDrawer extends ButtonPanel {
  // image sources for the AppDrawer buttons
  private String PLACEHOLDER="icon_Apple.svg";  // placeholder button image source 
  private String FBOOK="", INSTA="", TWITTER="", YOUTUBE="";
  private String NEWS="", EMAIL="", MAPS="", CALENDAR="";
  private String HEALTH="", MUSIC="";
  
  Button fbookBtn, instaBtn, twitterBtn, youTubeBtn;
  Button newsBtn, emailBtn, mapsBtn, calBtn;
  Button healthBtn, musicBtn;
  
  int rowInParent, colInParent;
  
  public AppDrawer(ButtonPanel parent){
    super(parent);  // sets row/col/button size to size of those in parent
    this.panelCols = parent.panelCols;
    this.panelRows = 3;
    colInParent = 0; 
    rowInParent = parent.panelRows - this.panelRows;
    this.set_PanelSize(this.panelCols*this.colWidth, this.panelRows*this.rowHeight); 
    this.locX = parent.locX;
    this.set_PanelLoc(get_LocXInParent(colInParent), get_LocYInParent(rowInParent));
    create_Btns();
  }
  
  
  // not using this  right now
  void calc_PanelRC(ButtonPanel parent){
    this.panelCols = parent.panelCols;
    this.rowHeight = parent.rowHeight;
    this.colWidth = parent.colWidth;      
  }
  
  // implemented abstract fn from ButtonPanel superclass
  void set_PanelRC(){
    //this.panelRows = 3;
  }
  
  
  
  // implement once we decide the relative location of the appdrawer
  void set_RelativeSizeLoc(int parentWidth, int parentHeight){ 
  }
  
  
  private void create_Btns(){
    fbookBtn = create_PanelBtn(0,0,true,PLACEHOLDER);
    instaBtn = create_PanelBtn(0,1,true,PLACEHOLDER);
    twitterBtn = create_PanelBtn(0,2,true,PLACEHOLDER);
    youTubeBtn = create_PanelBtn(0,3,true,PLACEHOLDER);
    newsBtn = create_PanelBtn(1,0,true,PLACEHOLDER);
    emailBtn = create_PanelBtn(1,1,true,PLACEHOLDER);
    mapsBtn = create_PanelBtn(1,2,true,PLACEHOLDER);
    calBtn = create_PanelBtn(1,3,true,PLACEHOLDER);
    healthBtn = create_PanelBtn(2,0,true,PLACEHOLDER);
    musicBtn = create_PanelBtn(2,1,true,PLACEHOLDER);
    

    //fbookBtn = create_PanelBtn(0,0,true,FBOOK);
    //instaBtn = create_PanelBtn(0,1,true,INSTA);
    //twitterBtn = create_PanelBtn(0,2,true,TWITTER);
    //youTubeBtn = create_PanelBtn(0,3,true,YOUTUBE);
    //newsBtn = create_PanelBtn(1,0,true,NEWS);
    //emailBtn = create_PanelBtn(1,1,true,EMAIL);
    //mapsBtn = create_PanelBtn(1,2,true,MAPS);
    //calBtn = create_PanelBtn(1,3,true,CALENDAR);
    //healthBtn = create_PanelBtn(2,0,true,HEALTH);
    //musicBtn = create_PanelBtn(2,1,true,MUSIC);
    
    // don't need this line because we do it during create_PanelBtn(...)
    //super.add_PanelBtns(new Button[]{});
  
    // sure ??
    for (Button b : panelBtns){
      b.set_State(0);
    }    
  } 
  
  
}