/************************* MainButtons class and methods **************************/
/*           MainButtons is the ButtonPanel on the right side of the oven         */
/**********************************************************************************/

class MainButtons extends ButtonPanel {
  Button functionBtn, heatTimeBtn, startBtn, clearOffBtn;
  
  //public MainButtons(int x, int y, int w, int h){
  //  super(x,y,w,h);
  //  create_Btns();    
  //  set_FillColor(0);
  //}
  
  public MainButtons(int enclPanelWidth, int enclPanelHeight){
    super();
    set_RelativeSizeLoc(enclPanelWidth,enclPanelHeight);
    create_Btns();
    set_FillColor(0);
  }
  
  // implemented abstract fn from superclass
  void set_PanelRC(){
    this.panelRows = 11;
    this.panelCols = 1;
  }
  
  void set_RelativeSizeLoc(int canvasWidth, int canvasHeight){
    int sideMargin = (int)(canvasWidth/32);
    int topMargin = (int)(canvasHeight/16);
    locX = (int)((int)(canvasWidth*7/8)-sideMargin);
    locY = topMargin;
    szWidth = (int)(canvasWidth/8);
    szHeight = canvasHeight-2*topMargin;
  }
  
  private void create_Btns(){
    functionBtn = create_PanelBtn(0,0,2,1,"COOKING\nMODE");
    heatTimeBtn = create_PanelBtn(3,0,2,1,"SET\nTEMP|TIME\nTOAST");
    startBtn    = create_PanelBtn(6,0,2,1,"START");
    clearOffBtn = create_PanelBtn(9,0,2,1,"CLEAR |\nOFF");
    
    super.add_PanelBtns(new Button[]{functionBtn, heatTimeBtn, startBtn, clearOffBtn});
    for (Button b : innerPanelBtns){
      b.set_State(0);
      //b.clear_ClickColor();
    }    
  } 

}