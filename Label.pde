class Label
{
  int x,y,width, height, textSize, cRad, txtX, txtY;
  color labelCol;
  String label;
  PFont headFont;
  
  Label (int x, int y, int width, int height, color labelCol, String label, PFont headFont, int cRad, int txtX, int txtY)
  {
    this.x = x; 
    this.y = y;
    this.width = width; 
    this.height = height;
    this.labelCol = labelCol;
    this.label = label;
    this.headFont=headFont;
    this.cRad = cRad;
    this.txtX = txtX;
    this.txtY = txtY;
  }
  
  void draw()
  {
    stroke(0);
    strokeWeight(1);
    fill(labelCol);
    rect (lX,lY, width, height, cRad);
    
    fill(0);
    textFont(italicFont);
    text(label, txtX, txtY);
    
    
  }
  
}
