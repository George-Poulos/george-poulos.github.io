/*************************************************************************************/
/******************** (abstract) ButtonPanel class and methods ***********************/

// ButtonPanel is any Panel that may contain Buttons. 
abstract class ButtonPanel extends Panel {  
  // we could prob move margins into Panel class...
  int marginTop, marginBottom, marginLeft, marginRight;
  
  int panelRows, panelCols, panelBtnWidth, panelBtnHeight;  
  int rowHeight, colWidth;
  
  ArrayList<Button> panelBtns;
  
  public ButtonPanel(){ 
    super();   
    panelBtns = new ArrayList<Button>();
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
  public ButtonPanel(ButtonPanel parent){
    //this();
    panelBtns = new ArrayList<Button>();
      this.colWidth = parent.colWidth;
      this.rowHeight = parent.rowHeight;
      this.panelBtnWidth = parent.panelBtnWidth;
      this.panelBtnHeight = parent.panelBtnHeight;
  }

  // # of rows/columns will depend on which kind of ButtonPanel we're implementing.
  // GET RID OF THIS ITS DUMB
  abstract void set_PanelRC();

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


// blahhh
  void set_PanelRC(int r, int c){
    panelRows = r;  panelCols = c;
    set_BtnSizes();  // if we change #rows and #cols, recalc the btnSizes
  }

  int get_LocXInParent(int colInParent){
    return locX + colInParent*colWidth;
  }
  int get_LocYInParent(int rowInParent){
    return locY + rowInParent*rowHeight;
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

<<<<<<< HEAD
  // this is the one we are using in AppDrawer 
=======
  // this is the one we are using in AppDrawer
>>>>>>> 78b931b04c4f70d64cf9fc6406364940e687f332
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
<<<<<<< HEAD
    Button b = new Button(locX + col*panelBtnWidth, locY + row*panelBtnHeight, 
          panelBtnWidth*colsToSpan, panelBtnHeight*rowsToSpan);
    if (img) b.set_Img(btnMirror); 
=======
    Button b = new Button(locX + col*panelBtnWidth, locY + row*panelBtnHeight,
          panelBtnWidth*colsToSpan, panelBtnHeight*rowsToSpan);
    if (img) b.set_Img(btnMirror);
>>>>>>> 78b931b04c4f70d64cf9fc6406364940e687f332
    else b.set_Text(btnMirror);

    // added this line for project 2 - it just automatically adds the button to panelBtns list :)
    panelBtns.add(b);
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
    panelBtns.add(b);
  }

  // self-explanatory
  public void add_PanelBtns(Button[] btns){
    for (Button b : btns)
      add_PanelBtn(b);
  }

  // Returns the list of buttons (panelBtns) in the current panel.
  // Mostly called when we check if any of those buttons were clicked.
  public ArrayList<Button> get_PanelBtns(){
    return panelBtns;
  }

  // gets called from draw_ButtonPanel()
  void draw_PanelBtns(){
    for (Button b : panelBtns)
      b.draw_Btn();
  }

  // We will only draw the ButtonPanel if it's active..
  // (i.e. we wouldn't draw the expanded App Drawer if the user hadn't
  //     clicked on the App Drawer expansion icon)
  // ** might update this to be "if active"
  public void draw_ButtonPanel(){
    if (this.state != 0) {
      draw_Panel();      // draw enclosing Panel - might remove this????
<<<<<<< HEAD
      
=======

>>>>>>> 78b931b04c4f70d64cf9fc6406364940e687f332
      for (Button b : panelBtns)
        b.draw_Btn();

      //draw_PanelBtns();  // draw each button in the panelBtns list
    }
  }
}