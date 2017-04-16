class Module{
  float sizeX, sizeY;
  float locationX, locationY;
  PImage modImage;
  String imgName;
  boolean isNew;
  boolean visibility;
  
  public Module(float sizeX, float sizeY, float locationX, float locationY{
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.locationX = locationX;
    this.locationY = locationY;
    this.isNew = true;
  }
  
  void setImageName(String imgName){
    this.imgName = imgName;
    modImage = loadImage(imgName);
  }
  
  public void setSize(float x, float y){
    this.sizeX = x;
    this.sizeY = y;
  }
  
  public void setVisibility(boolean view){
    visibility = view;
    if(!visibility){
      this.isNew = true;
    }
  }
  
  void setLocation(float locationX, float locationY){
    this.locationX = locationX;
    this.locationY = locationY;
    this.isNew = false;
  }
  
  public void displayModule(){
    if(visibility)
      image(modImage,locationX, locationY,sizeX, sizeY);
  }
}