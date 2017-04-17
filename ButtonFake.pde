

class FakeButton extends Button {
  
  public FakeButton(int x, int y, int w, int h){
    super(x,y,w,h);
    inactiveClr = activeClr;
    //isActive = false;     
  }
  
  // creates a Fake button based on the specs of btn
  public FakeButton(Button btn){
    this(btn.locX, btn.locY, btn.szWidth, btn.szHeight);
    this.imgFlag = btn.imgFlag;
    if (this.imgFlag) this.btnImg = btn.btnImg;
    else this.set_Text(btn.btnTxt);
  }
  
  /* need these here */
  // fake buttons don't get to have a module. sorry, fake buttons.
  public void set_ModuleLoc(int r, int c){}
  // don't do anything when we click it cause it's a fake button :)
  public void on_Click(){}  
  
}