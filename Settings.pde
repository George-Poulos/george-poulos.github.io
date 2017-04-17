/********************************************************************/
/*  Settings class and methods.  This is not the Settings "module", 
     but rather it is the types of settings that will be able to be 
     set by the user.
 */
/********************************************************************/

class Settings {
  Mirror currMirror;
  
  DisplayPrefs displayPrefs;
  LinkedApps linkedApps;
  PersonalInfo personalInfo;
  
  public Settings(Mirror m){
    displayPrefs = new DisplayPrefs();
    linkedApps = new LinkedApps();
    personalInfo = new PersonalInfo();
    currMirror = m;
  }
  
  /********************************************************/
  /** "getter/setter" methods for DisplayPrefs Settings  **/
  
  public void set_MirrorBGColor(color c){
    displayPrefs.mirrorBGColor = c;
  }
  public void set_MirrorIconColor(color c){
    displayPrefs.mirrorIconColor = c;
  }
  public void toggle_NightMode(){
    displayPrefs.nightMode = !displayPrefs.nightMode;
  }
  public void set_AutoNightMode(boolean b){
    displayPrefs.autoNightMode = b;
  }
  
  // so we can color the mirror background accordingly
  public color get_MirrorBGColor(){
    return displayPrefs.mirrorBGColor;
  }
  // so we can color the button icons accordingly
  public color get_MirrorIconColor(){
    return displayPrefs.mirrorIconColor;
  }

  /********************************************************/
  /** "getter/setter" methods for PersonalInfo Settings  **/
  
  public void set_Language(String l){
    personalInfo.language = l;
  }
  public void set_Location(String l){
    personalInfo.location = l;
  }  
  // might update this to have int[4] as the param if 
  // we can create a working number pad :)
  public void set_LockPin(int pin){
    personalInfo.lockPin = pin;
    personalInfo.hasLockPin = true;    
  }

  public void toggle_HasLockPin(){
    personalInfo.hasLockPin = !personalInfo.hasLockPin;
  }
  // to set the location displayed on the mirror
  public String get_Location(){
    return personalInfo.location;
  }
  public int get_LockPin(){
    return personalInfo.lockPin;
  }
  
  
  /********************************************************************/
  /**********  Inner Classes for specific types of settings ***********/
  
  /** the "Mirror Settings" **/
  class DisplayPrefs extends SettingsType {
    color mirrorBGColor;    // warm vs. cool
    color mirrorIconColor;  // "color theme"
    boolean nightMode;  
    boolean autoNightMode;
    
    private DisplayPrefs(){
      mirrorBGColor = DAYCOLOR;  // defaults
      mirrorIconColor = DEFAULTICONCOLOR;
      // TODO: when we create Buttons, set button color to mirrorIconColor.
    }
  }
  
  /** User's linked accounts (social media, email, etc.) **/
  class LinkedApps extends SettingsType {  
    // TODO: implement this :)
    private LinkedApps(){
    }
  }
  
  /** User profile and personal information **/
  class PersonalInfo extends SettingsType {
    String language;
    String location;
    boolean hasLockPin;
    int lockPin;  // maybe make this int[4] for 4 digit pin
    
    private PersonalInfo(){
      language = "";
      location = "";
    }
  }
}


abstract class SettingsType {
  public SettingsType(){ }
}