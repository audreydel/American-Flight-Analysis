class Header 
{
  int width;
  int height;
  color headCol;
  String label;
  int textSize;
  PFont headFont;
  Header (int width, int height, color headCol, String label, PFont headFont)
  {
    this.width = width; 
    this.height = height;
    this.headCol = headCol;
    this.label = label;
    this.headFont=headFont;
  }
  
  void draw()
  {
    noStroke();
    fill(headCol);
    rect (0,0, width, height);
    fill(255);
    text(label, 600, 55);
    image(logoHeader, 0, 0);
  }
  
  
}
