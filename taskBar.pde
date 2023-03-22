class Widget {
  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean hovering;
  Widget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(255);
  }
  void draw() {
    strokeWeight(5);
    stroke(#c9a59f);
    line(270, 0, 270, 350);
    line(0, 350, 270, 350);
    strokeWeight(0);
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+20, y+height-10);
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
}

ArrayList widgetList1;
ArrayList differentFlights;
Screen screen1, screen2, screen3, screen4, currentScreen;
void setup() {
  initialiseData();
  
  
  PFont stdFont;
  Widget widget1, widget2, widget3, widget4;
  stdFont=loadFont("RockwellNova-30.vlw");
  textFont(stdFont);
  fill(255);
  widget1=new Widget(0, 0, 270, 80,
    "Airy Fairy", color(#c9a59f),
    stdFont, EVENT_BUTTON1);
  widget2=new Widget(40, WIDG_POS*2, 180, 40,
    "Graph 1", color(#c9a59f),
    stdFont, EVENT_BUTTON2);
  widget3=new Widget(40, WIDG_POS*3, 180, 40,
    "Graph 2", color(#c9a59f),
    stdFont, EVENT_BUTTON3);
  widget4=new Widget(40, WIDG_POS*4, 180, 40,
    "Graph 3", color(#c9a59f),
    stdFont, EVENT_BUTTON4);
  
  differentFlights=new ArrayList();
  differentFlights.add(flightDates);
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
