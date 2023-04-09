ArrayList<PieChart> pieCharts = new ArrayList<>(); 
class PieChart 
{
  float diam; 
  color[] colors;
  Flights currflight;
  ArrayList<Integer> data;

  public PieChart(float diam, ArrayList<Integer> data, color[] colors)
  {
    this.diam = diam;
    this.data = data;
    this.colors = colors;
  }                                                                            //idk


  void draw() 
  {
    float lastAngle = 0;
    for (int i = 0; i < data.size(); i++) 
    {
      fill(colors[i]);
      stroke(0);
      strokeWeight(3);
      arc(width/2-100, height/2+125, diam, diam, lastAngle, lastAngle+radians(data.get(i)));
      line(width/2-100, height/2+125, ((width/2-100)+((diam/2)*cos(lastAngle))), ((height/2+125)+((diam/2)*sin(lastAngle))));
      line(width/2-100, height/2+125, ((width/2-100)+((diam/2)*cos(lastAngle+radians(data.get(i))))), ((height/2+125)+((diam/2)*sin(lastAngle+radians(data.get(i))))));
      lastAngle += radians(data.get(i));
    }
  
  }


}
