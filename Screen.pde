import java.util.Scanner;
class Screen {
  ArrayList widge;
  ArrayList flightInfo;
  Screen(ArrayList widgies, ArrayList flightInfos) 
  {
    this.widge=widgies;
    this.flightInfo=flightInfos;
  }
  
  void draw() 
  {

    background(255,240,227);
    
    if (currentScreen==screen2)   // *** graph 1 screen ***
    {
      fill(0);
      int x=500;
      int y=30;
      
      int notCanCount = 0;
      int cancelledCount = 0;
      
      for(int i = 0; i<cancelled.size(); i++) {
        int isItCancelled = cancelled.get(i);
        if(isItCancelled == 0) {
          notCanCount += 1;
        } else if(isItCancelled == 1) {
          cancelledCount += 1;
          }
      }
      
      fill(201, 165, 159);
      textSize(40);
      text("# of not cancelled flights: " + notCanCount, 400, 300);
      text("# of cancelled flights: " + cancelledCount, 400, 400);
    }
    
    if (currentScreen==screen3) 
    {
      fill(0);
      int x=700;
      int y=30;
      for(int i=0; i<destination.size()/8; i++)
      {
        String dest=destination.get(i);
        text(dest, x,y );
        y+=30;
      }
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
