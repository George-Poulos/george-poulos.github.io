/************************* AppDrawer class and methods **************************/
/*           AppDrawer is the ButtonPanel on the right side of the mirror       */
/********************************************************************************/

class AppDrawer extends ButtonPanel {
  // image sources for the AppDrawer buttons

  private String PLACEHOLDER="icon_Apple.svg";  // placeholder button image source
  
  // EDIT THESE LINES TO HAVE .svg AS THE FILE EXTENSION ONCE ICONS ARE .SVG
  private String FBOOK="dock_facebook.png", INSTA="dock_instagram.png",
        TWITTER="dock_twitter.png", YOUTUBE="dock_youtube.png";
  private String NEWS="dock_news.png", EMAIL="dock_email.png",
        MAPS="dock_map.png", CALENDAR="dock_schedule.png";
  private String HEALTH="dock_health.png", MUSIC="dock_music.png";

  Button fbookBtn, instaBtn, twitterBtn, youTubeBtn;
  Button newsBtn, emailBtn, mapsBtn, calBtn;
  Button healthBtn, musicBtn;

  //int rowInParent, colInParent;

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


  // creates the buttons inside the AppDrawer
  private void create_Btns(){

    fbookBtn = create_PanelBtn(0,0,true,fileLoc.concat(FBOOK));
    instaBtn = create_PanelBtn(0,1,true,fileLoc.concat(INSTA));
    twitterBtn = create_PanelBtn(0,2,true,fileLoc.concat(TWITTER));
    youTubeBtn = create_PanelBtn(0,3,true,fileLoc.concat(YOUTUBE));
    newsBtn = create_PanelBtn(1,0,true,fileLoc.concat(NEWS));
    emailBtn = create_PanelBtn(1,1,true,fileLoc.concat(EMAIL));
    mapsBtn = create_PanelBtn(1,2,true,fileLoc.concat(MAPS));
    calBtn = create_PanelBtn(1,3,true,fileLoc.concat(CALENDAR));
    healthBtn = create_PanelBtn(2,0,true,fileLoc.concat(HEALTH));
    musicBtn = create_PanelBtn(2,1,true,fileLoc.concat(MUSIC));
   
    fbookBtn.module.setImageName("widgets/facebook.png");
    instaBtn.module.setImageName("widgets/instagram.png");
    twitterBtn.module.setImageName("widgets/twitter.png");
    youTubeBtn.module.setImageName("widgets/youtube.png");
    newsBtn.module.setImageName("icons/normal/png/news.PNG");
    emailBtn.module.setImageName("widgets/mail.png");
    mapsBtn.module.setImageName("icons/normal/png/traffic.PNG");
    calBtn.module.setImageName("widgets/calendar.png");
    healthBtn.module.setImageName("widgets/health.png");
    musicBtn.module.setImageName("widgets/music-play.png");
    
    add_PanelBtns(new Button[]{
      fbookBtn, instaBtn, twitterBtn, youTubeBtn, newsBtn, emailBtn, mapsBtn, calBtn, healthBtn, musicBtn});
  
    // sure ??
    for (Button b : innerPanelBtns){
      b.set_State(0);
    }    
  }   
}