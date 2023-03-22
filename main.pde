ArrayList widgetList1;
Screen screen1, screen2, screen3, screen4, currentScreen;
Flights currFlight;
PieChart chart1;
void setup() {
  currFlight = new Flights();
  //chart1=new PieChart();
  currFlight.initialiseData();
  currFlight.countTime();
  
  PFont stdFont;
  Widget widget1, widget2, widget3, widget4;
  stdFont=loadFont("RockwellNova-30.vlw");
  textFont(stdFont);
  fill(255);
  widget1=new Widget(0, 0, 270, 80,
    "Airy Fairy", color(#c9a59f),
    stdFont, HOME_BUTTON);
  widget2=new Widget(40, WIDG_POS*2, 180, 40,
    "Graph 1", color(#c9a59f),
    stdFont, BUTTON_PAGE1);
  widget3=new Widget(40, WIDG_POS*3, 180, 40,
    "Graph 2", color(#c9a59f),
    stdFont, BUTTON_PAGE2);
  widget4=new Widget(40, WIDG_POS*4, 180, 40,
    "Graph 3", color(#c9a59f),
    stdFont, BUTTON_PAGE3);

  size(1400, 900);

  widgetList1 = new ArrayList();
  widgetList1.add(widget1);
  widgetList1.add(widget2);
  widgetList1.add(widget3);
  widgetList1.add(widget4);

  screen1=new Screen(widgetList1);
  screen2=new Screen(widgetList1);
  screen3=new Screen(widgetList1);
  screen4=new Screen(widgetList1);
  
  screen3.addPieChart(300.0);
  
  currentScreen=screen1;
}

void draw() {
  currentScreen.draw();
}

void mousePressed() {
  currentScreen.mousePressed();
}
void mouseMoved() {
  currentScreen.mouseMoved();
}
