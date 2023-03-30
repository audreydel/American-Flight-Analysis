class Label
{
  int x;
  int y;
  int width;
  int height;
  color labelCol;
  String label;
  int textSize;
  PFont headFont;
  Label (int x, int y, int width, int height, color labelCol, String label, PFont headFont)
  {
    this.x = x; 
    this.y = y;
    this.width = width; 
    this.height = height;
    this.labelCol = labelCol;
    this.label = label;
    this.headFont=headFont;
  }
  
  void draw()
  {
    stroke(0);
    strokeWeight(1);
    fill(labelCol);
    rect (lX,lY, width, height);
    
    fill(0);
    textFont(italicFont);
    text(label, lX+170, lY+35);

    
  }
  
}
