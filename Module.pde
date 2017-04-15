class Module{
  float sizeX, sizeY;
  float locationX, locationY;
  PImage modImage;
  String imgName;
  
  public Module(float sizeX, float sizeY, float locationX, float locationY, String imgName){
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.locationX = locationX;
    this.locationY = locationY;
    this.imgName = imgName;
  }
  
  void setLocation(float locationX, float locationY){
    this.locationX = locationX;
    this.locationY = locationY;
  }
  
  void displayModule(){
    modImage = loadImage(imgName);
    image(modImage, sizeX, sizeY, locationX, locationY);
  }
}