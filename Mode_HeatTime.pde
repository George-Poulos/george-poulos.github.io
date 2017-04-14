/*************** HeatTimeMode class and methods ***************/

class HeatTimeMode extends Mode {
  
  Button tempBtn, timeBtn, toastBtn, incrBtn, decrBtn;
  Button fakeBtn;
  
  DefaultHTMirror defaultHTMirror;
  ToastMirror toastMirror;
  TempMirror tempMirror;
  TimeMirror timeMirror;
  
  public HeatTimeMode(Panel p){
    super(p);
    this.show_DefaultMirror();
  }
    
  // implemented abstract method from superclass
  void reset_Mirrors(){
    for (Mirror d : allMirrors)
      ((HeatTimeMirror) d).init_CurrSettings();
  }
  
  // implemented abstract method from superclass
  void create_Mirrors(Panel p){
    defaultHTMirror = new DefaultHTMirror(p);
    tempMirror = new TempMirror(p);
    timeMirror = new TimeMirror(p);
    toastMirror = new ToastMirror(p);
    
    add_AllMirrors(new HeatTimeMirror[]{defaultHTMirror, tempMirror, timeMirror, toastMirror});
  }
  
  // implemented abstract method from superclass
  void create_ModeBtns(){
    DefaultHTMirror d = defaultHTMirror;
    tempBtn = d.leftPanel.create_PanelBtn(0,0,"temp");
    timeBtn = d.leftPanel.create_PanelBtn(1,0,"time");
    toastBtn = d.leftPanel.create_PanelBtn(2,0,"toast");
    incrBtn = d.rightPanel.create_PanelBtn(1,0," ( + ) ");
    decrBtn = d.rightPanel.create_PanelBtn(3,0," ( - ) ");    
    fakeBtn = d.centerPanel.create_PanelBtn(0,0," --- ");
    
    //tempBtn.set_Img("temp.png", color(127,127,127));
    //timeBtn.set_Img("time.png", color(127,127,127));
    //toastBtn.set_Img("toast.png", color(127,127,127));
    set_AllPanelBtns();
  }
    
  // in this mode, each Mirror has the same buttons
  private void set_AllPanelBtns(){
    for (Mirror d : allMirrors){     
      d.rightPanel.add_PanelBtns(new Button[]{incrBtn, decrBtn});
      d.leftPanel.add_PanelBtns(new Button[]{tempBtn, timeBtn, toastBtn});
      d.centerPanel.add_PanelBtn(fakeBtn); 
    }
  }

  // implemented abstract method from superclass Mode - called from mouseReleased()
  public void do_BtnClick(Button b){
    if (b.equals(tempBtn))       show_Mirror(tempMirror);
    else if (b.equals(timeBtn))  show_Mirror(timeMirror);
    else if (b.equals(toastBtn)) show_Mirror(toastMirror);  
    else if (b.equals(incrBtn))  do_incrBtn();
    else if (b.equals(decrBtn))  do_decrBtn();    
  }
  
  // called when we click the RPanel (+) button
  private void do_incrBtn(){   
    ((HeatTimeMirror) activeMirror).incr_Btn();
  }
  // called when we click the RPanel (-) button
  private void do_decrBtn(){
    ((HeatTimeMirror) activeMirror).decr_Btn();    
  }    
  
  private void show_Mirror(HeatTimeMirror d){
    d.show();
    set_ActiveMirror(d);
  }
  
  // implemented abstract method from superclass
  public void show_DefaultMirror(){
    defaultHTMirror.show();
    set_ActiveMirror(defaultHTMirror);
  }
  
  
  //------------ Nested DefaultMirror class ---------------//
  class DefaultHTMirror extends HeatTimeMirror {
    public DefaultHTMirror(Panel p){
      super(p);
    }
    
    // we don't need to implement these because DefaultHTMirror 
    // is just the initial default display that we see when 
    // we first switch to Heat/Time/Toast Mode.
    void init_CurrSettings(){}
    void incr_Btn(){}
    void decr_Btn(){}
    
    public void show(){
      reset_BtnStates(tempBtn, timeBtn, toastBtn);
      fakeBtn.clear_ClickColor();  // aka why it's a fake button
      fakeBtn.set_BtnFont(defaultFont);
      fakeBtn.set_Text(" --- ");
    }

  }
  
  //------------ Nested TempMirror class ---------------//
  class TempMirror extends HeatTimeMirror {
    final int minTemp = 150;
    final int maxTemp = 475;
    int currTemp;  
    // because I had planned to implement celsius at some point
    String tempMode;  
    
    public TempMirror(Panel p){
      super(p);
    }
    void init_CurrSettings(){
      currTemp = minTemp;
      tempMode = "F";
    }
    void incr_Btn(){
      if (currTemp < maxTemp){
        currTemp += 25;
        set_Temp();
      }      
    }
    void decr_Btn(){
      if (currTemp > minTemp){
        currTemp -= 25;
        set_Temp();
      }
    }
    private void set_Temp(){
      fakeBtn.set_Text(currTemp + "°" + tempMode);
    }
    
    public void show(){
      tempBtn.state = 1;
      reset_BtnStates(timeBtn, toastBtn);
      fakeBtn.set_BtnFont(tempFont);
      set_Temp();
    }
  }
  
  //------------ Nested TimeMirror class ---------------//
  class TimeMirror extends HeatTimeMirror {
    final int minTime = 0;
    int currTime;
    
    public TimeMirror(Panel p){
      super(p);
    }    
    void init_CurrSettings(){
      currTime = minTime;    
    }     
    void incr_Btn(){       
      currTime += 30;  // we'll go up/down in 30sec intervals
      set_Timer();
    }    
    void decr_Btn(){
      if (currTime > minTime){
        currTime -= 30;
        set_Timer();
      }
    }        
    private void set_Timer(){
      int mod60secs = (int)(currTime % 60); 
      fakeBtn.set_Text((int)(currTime/60) + ":" + (int)(mod60secs/10) +""+ (int)(mod60secs/100));
    }   
    
    // called when we click the LPanel TIME button
    public void show(){
      timeBtn.state = 1;
      reset_BtnStates(tempBtn, toastBtn);
      fakeBtn.set_BtnFont(timerFont);
      set_Timer();
    }    
  } 
  
  //------------ Nested ToastMirror class ---------------//
  class ToastMirror extends HeatTimeMirror {
    final int minToast = 1;
    final int maxToast = 4;
    int currToast; 
    String currToastStr = "";
    ArrayList<String> toastHack;
    
    public ToastMirror(Panel p){
      super(p);
    }
    void init_CurrSettings(){
      currToast = minToast; 
      toastHack = new ArrayList<String>();
      toastHack.add("TOAST -\nLIGHT");
      toastHack.add("TOAST -\nMEDIUM");
      toastHack.add("TOAST -\nDARK");
      toastHack.add("TOAST -\nVERY DARK");
      currToastStr = (String)toastHack.get(currToast);
    }
    void incr_Btn(){       
      if (currToast < maxToast) {
        currToast ++;
        set_Toast();
      }
    }    
    void decr_Btn(){
      if (currToast > minToast) {
        currToast --;
        set_Toast();
      }
    }        
    private void set_Toast(){
      String txt = "///////";
      int i;
      for (i=minToast; i<currToast; i++){
        txt += "\n///////";
      }
      fakeBtn.set_BtnFont(createFont("LCD-BOLD.TTF", 72-8*(i-1)));
      fakeBtn.set_Text(txt);   
      currToastStr = (String)toastHack.get(currToast);
    }   
    
    public void show(){
      toastBtn.state = 1;
      reset_BtnStates(tempBtn, timeBtn);
      set_Toast();
    }
    
  }
}

/****************** abstract HeatTimeMirror class  *****************/
abstract class HeatTimeMirror extends Mirror {
  PFont timerFont, tempFont, defaultFont;
  
  public HeatTimeMirror(Panel p){
    super(p);
    rightPanel.set_PanelRC(5,1);
    centerPanel.set_PanelRC(1,1);  
    init_Fonts();
    init_CurrSettings();
  }
  
  abstract void show();
  abstract void init_CurrSettings(); 
  
  // these are abstract because the (+) and (-) do different things
  // depending on if you're setting the temp or the time or the toasty-ness
  abstract void incr_Btn();
  abstract void decr_Btn();
  
  private void init_Fonts(){
    timerFont = createFont("LCD-BOLD.TTF", 96);
    tempFont = createFont("Arial", 96);
    defaultFont = createFont("Courier New", 96);
  }    
}