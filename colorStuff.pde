/********************************************************************/
/********************      Color functions    ***********************/
float get_RGBred(color c){
  return c >> 16 & 0xFF;
}
float get_RGBgreen(color c){
  return c >> 8 & 0xFF;
}
float get_RGBblue(color c){
  return c & 0xFF;
}
/* set icon's inactive color based on the given color */
color create_InactiveColor(color c){
  float red = get_RGBred(c);
  float green = get_RGBgreen(c);
  float blue = get_RGBblue(c);
  //if (red == green && green == blue){  // aka if all the numbers are the same
    return color(red-20, green-20, blue-20);
  //}
  //float valToChange = max(red, green, blue);
  //float newVal = valToChange-20;
  //if (valToChange == red) return color(newVal, green, blue);
  //else if (valToChange == green) return color(red, newVal, blue);
  //else return color(red, green, newVal);
}

/********************************************************************/