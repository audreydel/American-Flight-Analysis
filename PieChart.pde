class PieChart
{
  float diam;
  float[] data;
  color[] colors;
  float onTimePerc, latePerc, earlyPerc;
  float canPerc, notCanPerc;

  Flights currflight;

  float countOnTime, countErly, countLate;
  ArrayList<Integer> schDep;
  ArrayList<Integer> accDep;
  ArrayList<Integer> cancelled;


  PieChart (float diam, ArrayList<Integer> schDep, ArrayList<Integer> accDep, color[] colors)
  {
    this.diam = diam;
    this.schDep = schDep;
    this.accDep = accDep;
    this.colors = colors;
  }
  
  PieChart (float diam, ArrayList<Integer> cancelled, color[] colors)
  {
    this.diam = diam;
    this.cancelled = cancelled; 
    this.colors = colors;
  }
  

  void countTime()
  {
    println("airO size: " + currFlight.airO.size());
    float countOnTime=0;
    float countLate=0;
    float countEarly=0;

    for (int i=0; i<schDep.size(); i++)
    {
      int scheduledTime = schDep.get(i);
      int actualTime = accDep.get(i);
      if ((actualTime>scheduledTime-5)&&(actualTime<scheduledTime+5))
        countOnTime++;
      else if (scheduledTime<actualTime)
        countLate++;
      else if (scheduledTime>actualTime)
        countEarly++;
    }
    
    float total = countOnTime + countLate + countEarly;
    println("late total: " + total);
    println("on time: " + countOnTime);
    println("late: " + countLate);
    println("early: " + countEarly);
    
    float angOT = countOnTime*360/total;
    float angL = countLate*360/total;
    float angE = countEarly*360/total;
    float [] lateData = {angOT, angL, angE};
    println("angOT: " + angOT);
    println("angL: " + angL);
    println("angE: " + angE);

    println("late data: ");
    println(lateData);
    this.data = lateData;
    println("global data: " + this.data);
    this.onTimePerc = (countOnTime*100)/total;
    this.earlyPerc = (countEarly*100)/total;
    this.latePerc = (countLate*100)/total;
    println("onTime %: " + this.onTimePerc);
    println("Late %: " + this.latePerc);
    println("Early %: " + this.earlyPerc);
    
    
  }
  
  void countCancelled()
  {
    float notCanCount=0;
    float canCount=0;
    for (int i=0; i<cancelled.size(); i++)
    {
      int isItCancelled = cancelled.get(i);
      if (isItCancelled == 0)
      {
        notCanCount+=1;
      }
      else if (isItCancelled ==1)
      {
        canCount +=1;
      }
      
    }
    float total = notCanCount + canCount;
    println("cancelled total: " + total);
    println("not cancelled: " + notCanCount);
    println("cancelled: " + canCount);

    float angNC = notCanCount*360/total;
    float angC = canCount*360/total;
    float []canData = {angNC, angC};
    this.data = canData;
    this.canPerc = (canCount*100)/total;
    this.notCanPerc = (notCanCount*100)/total;
    
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
