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
    if (currentScreen==screen2) 
    {
      fill(0);
      int x=500;
      int y=30;
      
        int janCount = 0;
        int febCount = 0;
        int marCount = 0;
        int aprCount = 0;
        int mayCount = 0;
        int junCount = 0;
      for(int i=0; i<flightDates.size()/8; i++)
      {
        
        String date=flightDates.get(i);
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
      
      text("jan count: " + janCount + "\nfeb count: " + febCount + "\nmarch count: " + 
                  marCount + "\napril count: " + aprCount + "\nmay count: " + 
                  mayCount + "\njune count: " + junCount, x,y);
                  
      println("jan count: " + janCount + "\nfeb count: " + febCount + "\nmarch count: " + 
                  marCount + "\napril count: " + aprCount + "\nmay count: " + 
                  mayCount + "\njune count: " + junCount);
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
