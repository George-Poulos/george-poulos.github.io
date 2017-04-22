/********************************************************************/
/**  User class allows us to create new users, and load 
      the mirror depending on who is signed in. This will also allow
      us to save display preferences, etc. and be able to reload
      the mirror the way it was the last time the user was logged in.
**/
/********************************************************************/

class User {
  
  String userName;
  Mirror userMirror;
  int userState;
  
  public User(String name){
    userName = name;
  }
  
  public void set_UserMirror(Mirror m, int state){
    userMirror = m;
    userState = state;
  }
}