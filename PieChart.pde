class PieChart {

  float countTime=currFlight.countOnTime;
  float countErly=currFlight.countEarly;
  float countLte=currFlight.countLate;
  float total=currFlight.countLate+currFlight.countEarly+currFlight.countOnTime;
  float ang1=(countTime*360)/total;
  float ang2=(countErly/total)*360;
  float ang3=(countLte/total)*360;
  float[] graph1 = {ang1, ang2, ang3};
  float countTimePercent=(countTime*100)/total;
  float countErlyPercent=(countErly*100)/total;
  float countLtePercent=(countLte*100)/total;
  color[] colors={#80ffff, #4db8ff, #1a1aff};

  float diam;
  float canNum1=currFlight.notCanCount;
  float canNum2=currFlight.cancelledCount;
  float total2=currFlight.notCanCount+currFlight.cancelledCount;
  float ang1Graph2=(canNum1*360)/total2;
  float ang2Graph2=(canNum2*360)/total2;
  float[] graph2={ang1Graph2, ang2Graph2};

  float canPercent=(canNum2*100)/total2;
  float notcanPercent=(canNum1*100)/total2;

  public PieChart(float diam) {
    this.diam = diam;
  }

  void setup() {
    noStroke();
  }
  void draw() {
    if (currentScreen==screen3) {
      pieChart(diam, graph1);
    } else if (currentScreen==screen5) {
      pieChart(diam, graph2);
    }
  }

  void pieChart(float diameter, float[] data) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      fill(colors[i]);
      stroke(0);
      strokeWeight(3);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      line(width/2, height/2, ((width/2)+((diameter/2)*cos(lastAngle))), ((height/2)+((diameter/2)*sin(lastAngle))));
      line(width/2, height/2, ((width/2)+((diameter/2)*cos(lastAngle+radians(data[i])))), ((height/2)+((diameter/2)*sin(lastAngle+radians(data[i])))));
      lastAngle += radians(data[i]);
    }
  }
}
