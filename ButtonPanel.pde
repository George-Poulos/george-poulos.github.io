/*************************************************************************************/
/******************** (abstract) ButtonPanel class and methods ***********************/

// ButtonPanel is any Panel that may contain Buttons. 
abstract class ButtonPanel extends Panel {  
  // we could prob move margins into Panel class...
  int marginTop, marginBottom, marginLeft, marginRight;
  int panelRows, panelCols, panelBtnWidth, panelBtnHeight;  
  int rowHeight, colWidth;
  int rowInParent, colInParent;  // moved this into here instead of subclasses.

  
  ArrayList<Button> innerPanelBtns;
  ArrayList<ButtonPanel> innerPanels;
  
  public ButtonPanel(){ 
    super();   
    innerPanelBtns = new ArrayList<Button>();
    innerPanels = new ArrayList<ButtonPanel>();
  }
  
  public ButtonPanel(int w, int h){
    this();
    set_PanelSize(w,h);
  }
  
  public ButtonPanel(int x, int y, int w, int h){ 
    this(w,h);
    set_PanelLoc(x,y);
  }
  
  public ButtonPanel(Panel p){
    this(p.locX, p.locY, p.szWidth, p.szHeight);
  }
  
  // we'll use this if we add a button panel inside another one
  // (ex: AppDrawer is inside of Mirror's RightPanel)
  public ButtonPanel(ButtonPanel parent){
    //this();
    innerPanelBtns = new ArrayList<Button>();
    innerPanels = new ArrayList<ButtonPanel>();
    this.colWidth = parent.colWidth;
    this.rowHeight = parent.rowHeight;
    this.panelBtnWidth = parent.panelBtnWidth;
    this.panelBtnHeight = parent.panelBtnHeight;
  }

  // default margins  ??
  void set_Margins(){
    marginTop = marginBottom = marginLeft = marginRight = 0;
  }

  // sets a small btn size (spans 1 row and 1 col) - called from subclass constructors
  void set_BtnSizes(){
    panelBtnWidth = colWidth;
    panelBtnHeight = rowHeight;
  }


  // set # of rows and col/row height based on the desired # of cols
  // and the height of this GridPanel. this is defined for outer parent panels.
  // NOTE: subclasses of ButtonPanel should override this to set their
  //   #cols/row width/col height based on the parent panel they are located in!!
  void calc_PanelRC(int cols){
    this.colWidth = this.szWidth/cols;
    this.rowHeight = this.colWidth;
    this.panelCols = cols;
    this.panelRows = this.szHeight / this.rowHeight;
    set_BtnSizes();
  };


  int get_LocXInParent(int colInParent){
    return locX + colInParent*colWidth;
  }
  
  int get_LocYInParent(int rowInParent){
    return locY + rowInParent*rowHeight;
  }

  void add_InnerPanel(ButtonPanel p){
    innerPanels.add(p);    
  }

  void add_InnerPanels(ArrayList<ButtonPanel> panels){
    innerPanels.addAll(panels);    
  }

  // Creates and returns a Button (potentially to be placed in the ButtonPanel).
  // Calculates the location and size of the button based on the size of the
  //   ButtonPanel in which it will be located, and the provided row and column params.
  // Includes lots of overloads for added functionality.
  Button create_PanelBtn(int row, int col, int rowsToSpan, int colsToSpan){
    int x = locX + col*panelBtnWidth;
    int y = locY + row*panelBtnHeight;
    return new Button(x,y, panelBtnWidth*colsToSpan, panelBtnHeight*rowsToSpan);
  }

  Button create_PanelBtn(int row, int col){
    // Default button size in this case is (1x1) in grid.
    return create_PanelBtn(row,col,1,1);
  }

  Button create_PanelBtn(int row, int col, String btnMirror){
    return create_PanelBtn(row,col,1,1,btnMirror);
  }

  // this is the one we are using in AppDrawer
  Button create_PanelBtn(int row, int col, boolean img, String btnMirror){
    return create_PanelBtn(row,col,1,1,img,btnMirror);
  }

  Button create_PanelBtn(int row, int col, int rowsToSpan, int colsToSpan, String btnMirror){
    return create_PanelBtn(row,col,rowsToSpan,colsToSpan,false,btnMirror);
  }

  //
  // NOTE:  once we add Module class, we should add another param. to this function
  //        that lets us instantiate the button's Module instance variable from here.
  Button create_PanelBtn(int row, int col, int rowsToSpan, int colsToSpan, boolean img, String btnMirror){
    //Button b = create_PanelBtn(row,col,rowsToSpan,colsToSpan);
    
    Button b = new Button(locX + col*panelBtnWidth, locY + row*panelBtnHeight,
          panelBtnWidth*colsToSpan, panelBtnHeight*rowsToSpan);        
    if (img) b.set_Img(btnMirror);
    else b.set_Text(btnMirror);
    
    // size of rows/cols is the same on the entire mirror, so we can set the module sizes here.
    // btn's module will have already been instantiated in Button constructor
    b.module.setSize(this.colWidth*4,this.rowHeight*3 - 5);
    
    return b;
  }


  // Creates and adds a button to the list of buttons / the ButtonPanel
  // Lots of overloads for added functionality if we need/want it.
  public void add_PanelBtn(int row, int col){
    add_PanelBtn(create_PanelBtn(row,col));
  }

  public void add_PanelBtn(int row, int col, int rowsToSpan, int colsToSpan){
    add_PanelBtn(create_PanelBtn(row,col,rowsToSpan,colsToSpan));
  }

  public void add_PanelBtn(int row, int col, String btnMirror){
    add_PanelBtn(create_PanelBtn(row,col,btnMirror));
  }

  public void add_PanelBtn(int row, int col, boolean img, String btnMirror){
    add_PanelBtn(create_PanelBtn(row,col,img,btnMirror));
  }

  public void add_PanelBtn(int row, int col, int rowsToSpan, int colsToSpan, String btnMirror){
    add_PanelBtn(create_PanelBtn(row,col,rowsToSpan,colsToSpan,btnMirror));
  }

  public void add_PanelBtn(int row, int col, int rowsToSpan, int colsToSpan, boolean img, String btnMirror){
    add_PanelBtn(create_PanelBtn(row,col,rowsToSpan,colsToSpan,img,btnMirror));
  }

  // Same as ^^^, but adds an already-created Button to the list.
  public void add_PanelBtn(Button b){
    innerPanelBtns.add(b);
  }

  // self-explanatory
  public void add_PanelBtns(Button[] btns){
    for (Button b : btns){
      add_PanelBtn(b);
    }
  }
  public void add_PanelBtns(ArrayList<Button> btns){
    for (Button b : btns)
      add_PanelBtn(b);
  }

  // Returns the list of buttons (panelBtns) in the current panel.
  // Mostly called when we check if any of those buttons were clicked.
  public ArrayList<Button> get_PanelBtns(){
    return innerPanelBtns;
  }

  // gets called from draw_ButtonPanel()
  void draw_PanelBtns(){
    for (Button b : innerPanelBtns)
      b.draw_Btn();
  }

  // We will only draw the ButtonPanel if it's active..
  // (i.e. we wouldn't draw the expanded App Drawer if the user hadn't
  //     clicked on the App Drawer expansion icon)
  public void draw_ButtonPanel(){  
    if (this.isActive){
      for (ButtonPanel p : innerPanels){
        if (p.isActive) {
          p.draw_ButtonPanel();
          for (Button b : p.innerPanelBtns){
            b.draw_Btn();
          }
        }        
      }
      for (Button b : innerPanelBtns){
        b.draw_Btn();
      }
    }
  }
}