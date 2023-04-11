//ADR

class Header 
{
  int width, height, cRad, txtX, txtY;
  color headCol;
  String label;
  PFont headFont;
  
  Header (int width, int height, color headCol, String label, PFont headFont, int txtX, int txtY)
  {
    this.width = width; 
    this.height = height;
    this.headCol = headCol;
    this.label = label;
    this.headFont=headFont;
    this.txtX = txtX;
    this.txtY = txtY;
  }
  
  void draw()
  {
    noStroke();
    fill(headCol);
    rect (0,0, width, height);
    fill(255);
    textFont(headFont);
    textSize(60);
    text(label, txtX, txtY);
    image(logoHeader, 0, 0);
  }
  
  
}
