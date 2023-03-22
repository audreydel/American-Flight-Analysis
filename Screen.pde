import java.util.Scanner;
class Screen {
  ArrayList widge;
  ArrayList flightInfo;
  int countOnTime=0;
  int countEarly=0;
  int countLate=0;
  Screen(ArrayList widgies) 
  {
    this.widge=widgies;
  }
  void countTime(){
      for(int i=0; i<schDept.size(); i++)
      {
        int scheduledTime=schDept.get(i);
        int actualTime=accDept.get(i);
        if(scheduledTime==actualTime)
          countOnTime++;
        if(scheduledTime<actualTime)
          countLate++;
        if(scheduledTime>actualTime)
          countEarly++;
      }
  }
  void draw() 
  {

    background(255,240,227);
    
    if (currentScreen==screen2)   // *** graph 1 screen ***
    {
      fill(0);
      int x=500;
      int y=30;
    }
    
    if (currentScreen==screen3) //piechart
    {
      fill(0);
      
    }
    if (currentScreen==screen4) {
      fill(0);
      text("hey there x3", 500, 450);
    }
    for (int i = 0; i<widge.size(); i++) {
      Widget widgets = (Widget)widge.get(i);
      stroke(255);
      if (widgets.hovering)
        stroke(#ff8533);
      widgets.draw();
    }
  }

  void mousePressed() {
    int event;

    for (int i = 0; i<widge.size(); i++) 
    {
      Widget widgets = (Widget) widge.get(i);
      event = widgets.getEvent(mouseX, mouseY);
      switch(event) {
      case EVENT_BUTTON1:
        println("Button 1 was pressed!");
        currentScreen=screen1;
        break;
      case EVENT_BUTTON2:
        //println("Button 2 was pressed which makes it go forwards!");
        currentScreen=screen2;
        for (int x=0; x<flightDates.size()/8; x++) {
          println(x);
          text(" "+flightDates.get(x)+" ! ", 400, 0);
        }
        break;
      case EVENT_BUTTON3:
        println("Button 2 was pressed!");
        currentScreen=screen3;
        break;
      case EVENT_BUTTON4:
        //println("Button 4 was pressed which makes it go backwards!");
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
      case EVENT_BUTTON1:
        widgets.hovering=true;
        break;
      case EVENT_BUTTON2:
        widgets.hovering=true;
        break;
      case EVENT_BUTTON3:
        widgets.hovering=true;
        break;
      case EVENT_BUTTON4:
        widgets.hovering=true;
        break;
      }
    }
  }
}
