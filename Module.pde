class Module{
  float sizeX, sizeY;
  float locationX, locationY;
  PImage modImage;
  String imgName;
  boolean visibility;
  
  public Module(float sizeX, float sizeY, float locationX, float locationY, String imgName){
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.locationX = locationX;
    this.locationY = locationY;
    this.imgName = imgName;
    modImage = loadImage(imgName);
  }
  
  public void setVisibility(boolean view){
    visibility = view;
  }
  
  void setLocation(float locationX, float locationY){
    this.locationX = locationX;
    this.locationY = locationY;
  }
  
  public void displayModule(){
    if(visibility)
      image(modImage, sizeX, sizeY, locationX, locationY);
  }
}