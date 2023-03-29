import java.util.Scanner;
class Screen {
  ArrayList widge;
  ArrayList widge2;
  ArrayList flightInfo;
  PieChart screenChart1;
  BarChart screenChart2;
  color backgroundColor;
  Screen(color backgroundColor, ArrayList widgies, ArrayList widgie2)
  {
    this.widge=widgies;
    this.widge2=widgie2;
    this.backgroundColor=backgroundColor;
  }
  void addPieChart(float diam) {
    screenChart1=new PieChart(diam);
  }
  void addBarChart() {
    screenChart2=new BarChart();
  }
  void draw()
  {
    //background(255, 240, 227);
    
    if(currentScreen==introScreen)
    {
      background(logo);
      fill (186, 111, 96);
      //textSize(30);
      text("Click anywhere to continue", 500, 700);
      if (mousePressed)
      {
        currentScreen = screen1;
      }
    }
    else
    {
      background(backgroundColor);
    }
      
    if (currentScreen==screen1)
    {
      mainHead.draw();
      fill(186, 109, 104);
      text("Choose a date to discover the stats!", 490, 280);
      fill(255);
      line(510, 360, 570, 360);
    }
    if (currentScreen==screen2)   // *** graph 1 screen ***
    {
      head1st.draw();
      text("Yo", 500,500);
    }

    if (currentScreen==screen3) //piechart
    {
      head2nd.draw();
      stroke(0);
      fill(0);
      text("Key:", 900, 150);
      fill(#80ffff);
      rect(900, 165, 40, 40);
      fill(0);
      text("Flights departing on time \n (±5 mins) "+screenChart1.countTimePercent+"%", 950, 190);
      fill(#4db8ff);
      rect(900, 250, 40, 40);
      fill(0);
      text("Flights departing early \n"+screenChart1.countErlyPercent+"%", 950, 280);
      fill(#1a1aff);
      rect(900, 330, 40, 40);
      fill(0);
      text("Flights departing late \n"+screenChart1.countLtePercent+"%", 950, 360);
    }
    if (currentScreen==screen4) {
      head3rd.draw();
      fill(0);
      text("Hello party", 400, 300);
    }
    if (currentScreen==screen5) {
      head2nd.draw();
      stroke(0);
      fill(0);
      text("Key:", 900, 150);
      fill(#80ffff);
      rect(900, 165, 40, 40);
      fill(0);
      text("Flights not cancelled \n"+screenChart1.notcanPercent+"%", 950, 190);
      fill(#4db8ff);
      rect(900, 250, 40, 40);
      fill(0);
      text("Flights cancelled \n"+screenChart1.canPercent+"%", 950, 280);
    }
    for (int i = 0; i<widge.size(); i++) {
      Widget widgets = (Widget)widge.get(i);
      if (widgets.hovering)
        stroke(0);
      fill(0);
      widgets.draw();
    }
    for (int i=0; i<widge2.size(); i++) {
      Widget widgets2 = (Widget)widge2.get(i);
      stroke(0);
      if (widgets2.hovering)
        stroke(0);
      fill(0);
      widgets2.draw();
    }
    if (screenChart1!=null)
      screenChart1.draw();
  }

  void mousePressed() {
    int event;
    int event2;

    for (int i = 0; i<widge.size(); i++)
    {
      Widget widgets = (Widget) widge.get(i);
      event = widgets.getEvent(mouseX, mouseY);
      switch(event) {
      case HOME_BUTTON:
        currentScreen=screen1;
        break;
      case JAN1:
        currentScreen=screen2;
        break;
      case JAN2:
        currentScreen=screen3;
        break;
      case JAN3:
        currentScreen=screen4;
        break;
      }
    }
    for (int i=0; i<widge2.size(); i++) {
      Widget widgets2=(Widget) widge2.get(i);
      event2=widgets2.getEvent(mouseX, mouseY);
      switch(event2) {
      case PIECHART2RIGHT:
        currentScreen=screen5;
        break;
      case PIECHART2LEFT:
        currentScreen=screen3;
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
