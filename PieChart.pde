class PieChart 
{
  float diam; 
  float[] data;
  color[] colors;
  
  Flights currflight;


  public PieChart(float diam, float[] data, color[] colors)
  {
    this.diam = diam;
    this.data = data;
    this.colors = colors;
  }


  void draw() 
  {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) 
    {
      fill(colors[i]);
      stroke(0);
      strokeWeight(3);
      arc(width/2-100, height/2+125, diam, diam, lastAngle, lastAngle+radians(data[i]));
      line(width/2-100, height/2+125, ((width/2-100)+((diam/2)*cos(lastAngle))), ((height/2+125)+((diam/2)*sin(lastAngle))));
      line(width/2-100, height/2+125, ((width/2-100)+((diam/2)*cos(lastAngle+radians(data[i])))), ((height/2+125)+((diam/2)*sin(lastAngle+radians(data[i])))));
      lastAngle += radians(data[i]);
    }
  
  }


}
