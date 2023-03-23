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
      int notCanCount = 0;
        int cancelledCount = 0;
        
      for(int i=0; i<cancelled.size(); i++)
      {
        
        int isItCancelled=cancelled.get(i); 
        if(isItCancelled == 0) {
          notCanCount += 1;
        } else if(isItCancelled == 1) {
          cancelledCount += 1;
        }
      }
      
      fill(201,165,159);
      textSize(40);
      text ("# of not cancelled flights: " + notCanCount, 400, 300);
      text("# of cancelled flights: " + cancelledCount, 400, 400);
    }
    
    if (currentScreen==screen3) //piechart
    {
      fill(0);
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
