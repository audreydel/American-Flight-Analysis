class PieChart{
  float num1=currFlight.countOnTime;
  float num2=currFlight.countEarly;
  float num3=currFlight.countLate;
  float total=currFlight.countLate+currFlight.countEarly+currFlight.countOnTime;
  float ang1=(num1*360)/total;
  float ang2=(num2/total)*360;
  float ang3=(num3/total)*360;
  float[] angles = {ang1, ang2, ang3};
  color[] colors={#80ffff,#4db8ff,#1a1aff};
  float diam;
  
  public PieChart(float diam) {
    this.diam = diam;
  }
  
  void setup() {
    //size(640, 360);
    noStroke();
  }
  void draw() {
    //background(100);
    pieChart(diam, angles);
  }

  void pieChart(float diameter, float[] data) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      fill(colors[i]);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
    }
  }
}
