import java.util.Scanner;
class Screen {
  ArrayList widge;
  ArrayList flightInfo;
  PieChart screenChart;
  Screen(ArrayList widgies) 
  {
    this.widge=widgies;
  }
  void addPieChart(float diam){
    screenChart=new PieChart(diam);
  }
  void draw() 
  {
    background(255,240,227);
    if (currentScreen==screen2)   // *** graph 1 screen ***
    {
      fill(0);
      fill(0);
      int x=500;
      int y=30;
     
        int janCount = 0;
        int febCount = 0;
        int marCount = 0;
        int aprCount = 0;
        int mayCount = 0;
        int junCount = 0;
       
      for(int i=0; i<currFlight.flightDates.size(); i++)
      {
       
        String date=currFlight.flightDates.get(i);
        Scanner input2 = new Scanner (date);
        input2.useDelimiter("/");
        int day = input2.nextInt();
        int month = input2.nextInt();
       
        switch (month)
        {
         
          case 1:
          janCount++;
          break;
         
          case 2:
          febCount++;
          break;
         
          case 3:
          marCount++;
          break;
         
          case 4:
          aprCount++;
          break;
         
          case 5:
          mayCount++ ;
          break;
         
          case 6:
          junCount++;
          break;
         
          default:    
        }
        input2.close();
 
      }
     
      fill(0);
      textSize(40);
      text ("months", 200, 400);
      text("no. scheduled flights", 600, 700);

     
      textSize(30);
      text("jan", 400, 100);
      text("feb", 400, 200);
      text("mar", 400, 300);
      text("apr", 400, 400);
      text("may", 400, 500);
      text("jun", 400, 600);
      stroke(15);
     
     
      line(500, 70, 500, 630);
      stroke(15);
     
      line(500, 630, 1200, 630);
     
      rect(500, 70, janCount, 30);
      rect(500, 170, febCount, 30);
      rect(500, 270, marCount, 30);
      rect(500, 370, aprCount, 30);
      rect(500, 470, mayCount, 30);
      rect(500, 570, junCount, 30);
     
      text(janCount, 950, 100);
      text(febCount, 1070, 200);
      text(marCount, 1100, 300);
      text(aprCount, 940, 400);
      text(mayCount, 950, 500);
      text(junCount, 780, 600);
     
     
                 
      println("jan count: " + janCount + "\nfeb count: " + febCount + "\nmarch count: " +
                  marCount + "\napril count: " + aprCount + "\nmay count: " +
                  mayCount + "\njune count: " + junCount);
    }
    
    if (currentScreen==screen3) //piechart
    {
      fill(0);
      text("Key:",950,60);
      fill(#80ffff);
      rect(950,80,40,40);
      fill(0);
      text("Flights departing on time", 1000,110);
      fill(#4db8ff);
      rect(950,140,40,40);
      fill(0);
      text("Flights departing early", 1000,170);
      fill(#1a1aff);
      rect(950,200,40,40);
      fill(0);
      text("Flights departing late", 1000,230);

    }
    if (currentScreen==screen4) {
      fill(0);
      text("Hello x3", 400,300);
    }
    for (int i = 0; i<widge.size(); i++) {
      Widget widgets = (Widget)widge.get(i);
      stroke(255);
      if (widgets.hovering)
        stroke(#ff8533);
      widgets.draw();
    }
    if(screenChart!=null)
      screenChart.draw();
  }

  void mousePressed() {
    int event;

    for (int i = 0; i<widge.size(); i++) 
    {
      Widget widgets = (Widget) widge.get(i);
      event = widgets.getEvent(mouseX, mouseY);
      switch(event) {
      case HOME_BUTTON:
        currentScreen=screen1;
        break;
      case BUTTON_PAGE1:
        currentScreen=screen2;
        break;
      case BUTTON_PAGE2:
        currentScreen=screen3;
        break;
      case BUTTON_PAGE3:
        currentScreen=screen4;
        break;
      }
    }
  }
  void mouseMoved() 
  {
    int pos;
    for (int i = 0; i<widge.size(); i++) 
    {
      Widget widgets = (Widget) widge.get(i);
      widgets.hovering=false;
      pos = widgets.getEvent(mouseX, mouseY);
      switch(pos) {
      case HOME_BUTTON:
        widgets.hovering=true;
        break;
      case BUTTON_PAGE1:
        widgets.hovering=true;
        break;
      case BUTTON_PAGE2:
        widgets.hovering=true;
        break;
      case BUTTON_PAGE3:
        widgets.hovering=true;
        break;
      }
    }
  }
}
