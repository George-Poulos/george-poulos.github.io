

class FakeButton extends Button {
  
  public FakeButton(int x, int y, int w, int h){
    super(x,y,w,h);
    inactiveClr = activeClr;
    //isActive = false;     
  }
  
  // creates a Fake button based on the specs of btn
  public FakeButton(Button btn){
    //this(btn.locX, btn.locY, btn.szWidth, btn.szHeight);
    super(btn);
    this.imgFlag = btn.imgFlag;
    if (this.imgFlag) this.btnImg = btn.btnImg;
    else this.set_Text(btn.btnTxt);
  }
  
  /* need these here */
  // fake buttons don't get to have a module. sorry, fake buttons.
  public void set_ModuleLoc(int r, int c){}
  // don't do anything when we click it cause it's a fake button :)
  public void on_Click(){}  
  public void on_Click(Mirror m){}
  
  
  // override from button class cause we always want to draw a fake button
  public void draw_Btn(){
    if (imgFlag){  
      strokeWeight(0.25);
      stroke(activeClr);

      fill(activeClr);
      noTint();
      imageMode(CENTER);
      image(btnImg, locX+(int)(szWidth/2), locY+(int)(szHeight/2), 
            szWidth-2*padding, szHeight-2*padding);      
    }
    else {
      noFill();    
      stroke(0.5);
      //rect(locX, locY, szWidth, szHeight, corner);   
      setup_Text(font, activeClr, btnTxtAlign, btnTxtAlignVert);
      text(btnTxt, locX, locY);
      rectMode(CORNER);  
    }
  }
}