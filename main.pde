// main

PFont stdFont, arrowFont, headFont, italicFont;
PImage logo, logoHeader;

Flights currFlight;
BarChart currBar;
Label lCalendar, lLateness, lAirport, lOState, lDState, lCancelled;

ArrayList widgetList;
Widget bHomeScreen, bLateness, bAirport, bOState, bDState, bCancelled, bBack;
Widget jan1, jan2, jan3, jan4, jan5, jan6, jan7, jan8, jan9, jan10, jan11, jan12, jan13, jan14,
  jan15, jan16, jan17, jan18, jan19, jan20, jan21, jan22, jan23, jan24, jan25, jan26,
  jan27, jan28, jan29, jan30, jan31;
Widget tLate, tAirport, tDState, tOState, fullMonth, tCancelled;

ArrayList screenList;
Screen currentScreen, introScreen, mainScreen, totalLateScreen, totalCanScreen, totalOriginScreen, totalDestScreen, totalAirportScreen;
Screen lateScreen, canScreen, airpScreen, origScreen, destScreen;
Screen jan1Screen, jan2Screen, jan3Screen, jan4Screen, jan5Screen, jan6Screen, jan7Screen,
  jan8Screen, jan9Screen, jan10Screen, jan11Screen, jan12Screen, jan13Screen,
  jan14Screen, jan15Screen, jan16Screen, jan17Screen, jan18Screen, jan19Screen,
  jan20Screen, jan21Screen, jan22Screen, jan23Screen, jan24Screen, jan25Screen,
  jan26Screen, jan27Screen, jan28Screen, jan29Screen, jan30Screen, jan31Screen;

Header mainHead, jan1Head, jan2Head, jan3Head, jan4Head, jan5Head, jan6Head, jan7Head, jan8Head,
  jan9Head, jan10Head, jan11Head, jan12Head, jan13Head, jan14Head, jan15Head, jan16Head,
  jan17Head, jan18Head, jan19Head, jan20Head, jan21Head, jan22Head, jan23Head, jan24Head,
  jan25Head, jan26Head, jan27Head, jan28Head, jan29Head, jan30Head, jan31Head;
Header lateHead, canHead, orgHead, destHead, airportHead;

BarChart currAirBC, currStateOBC, currStateDBC;
BarChart tAirportsBC, tStateOBC, tStateDBC;
BarChart j1AirBC, j2AirBC, j3AirBC, j4AirBC, j5AirBC, j6AirBC, j7AirBC, j8AirBC, j9AirBC,
  j10AirBC, j11AirBC, j12AirBC, j13AirBC, j14AirBC, j15AirBC, j16AirBC, j17AirBC, j18AirBC, j19AirBC,
  j20AirBC, j21AirBC, j22AirBC, j23AirBC, j24AirBC, j25AirBC, j26AirBC, j27AirBC, j28AirBC, j29AirBC,
  j30AirBC, j31AirBC,
  j1StateOBC, j2StateOBC, j3StateOBC, j4StateOBC, j5StateOBC, j6StateOBC, j7StateOBC, j8StateOBC, j9StateOBC,
  j10StateOBC, j11StateOBC, j12StateOBC, j13StateOBC, j14StateOBC, j15StateOBC, j16StateOBC, j17StateOBC, j18StateOBC, j19StateOBC,
  j20StateOBC, j21StateOBC, j22StateOBC, j23StateOBC, j24StateOBC, j25StateOBC, j26StateOBC, j27StateOBC, j28StateOBC, j29StateOBC,
  j30StateOBC, j31StateOBC,
  j1StateDBC, j2StateDBC, j3StateDBC, j4StateDBC, j5StateDBC, j6StateDBC, j7StateDBC, j8StateDBC, j9StateDBC,
  j10StateDBC, j11StateDBC, j12StateDBC, j13StateDBC, j14StateDBC, j15StateDBC, j16StateDBC, j17StateDBC, j18StateDBC, j19StateDBC,
  j20StateDBC, j21StateDBC, j22StateDBC, j23StateDBC, j24StateDBC, j25StateDBC, j26StateDBC, j27StateDBC, j28StateDBC, j29StateDBC,
  j30StateDBC, j31StateDBC;

PieChart tCanPie, tLatePie;
PieChart j1CanPie, j2CanPie, j3CanPie, j4CanPie, j5CanPie, j6CanPie, j7CanPie, j8CanPie, j9CanPie,
  j10CanPie, j11CanPie, j12CanPie, j13CanPie, j14CanPie, j15CanPie, j16CanPie, j17CanPie, j18CanPie, j19CanPie,
  j20CanPie, j21CanPie, j22CanPie, j23CanPie, j24CanPie, j25CanPie, j26CanPie, j27CanPie, j28CanPie, j29CanPie,
  j30CanPie, j31CanPie,
  j1LatePie, j2LatePie, j3LatePie, j4LatePie, j5LatePie, j6LatePie, j7LatePie, j8LatePie, j9LatePie,
  j10LatePie, j11LatePie, j12LatePie, j13LatePie, j14LatePie, j15LatePie, j16LatePie, j17LatePie, j18LatePie, j19LatePie,
  j20LatePie, j21LatePie, j22LatePie, j23LatePie, j24LatePie, j25LatePie, j26LatePie, j27LatePie, j28LatePie, j29LatePie,
  j30LatePie, j31LatePie;




void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{

  // flight info
  currFlight = new Flights();
  currFlight.initialiseData();
  currFlight.countTime();
  currFlight.cancelledFlights();

  // fonts
  stdFont = loadFont("BodoniSvtyTwoOSITCTT-BookIt-30.vlw");
  textFont(stdFont);
  arrowFont = loadFont("ArimaMadurai-Light-15.vlw");
  headFont =loadFont("Georgia-BoldItalic-48.vlw");
  italicFont = loadFont("Georgia-Italic-30.vlw");

  // logos
  logo = loadImage("airyFairy.png");
  image (logo, 1000, 500);
  logo.resize(SCREENX, SCREENY);

  logoHeader = loadImage("AF-header.png");
  logoHeader.resize(170, 100);

  // task bar

  bHomeScreen = new Widget (margin, tbY, tbW, tbH, "Home Page", headColor,
    stdFont, MAIN_SCREEN, borderColor, wRad);
  bLateness = new Widget (margin+tbW+margin+5, tbY, tbW, tbH, "Lateness", lCol,
    stdFont, EVENT_LATE, borderColor, wRad);
  bAirport = new Widget (margin+((tbW+margin+5)*2), tbY, tbW, tbH, "Airports", lCol,
    stdFont, EVENT_AIRPORT, borderColor, wRad);
  bOState = new Widget (margin+((tbW+margin+5)*3), tbY, tbW, tbH, "Origin State", lCol,
    stdFont, EVENT_OSTATE, borderColor, wRad);
  bDState = new Widget (margin+((tbW+margin+5)*4), tbY, tbW, tbH, "Destination State", lCol,
    stdFont, EVENT_DSTATE, borderColor, wRad);
  bCancelled = new Widget (margin+((tbW+margin+5)*5), tbY, tbW, tbH, "Cancelled Flights", lCol,
    stdFont, EVENT_CANCEL, borderColor, wRad);
  bBack = new Widget (margin+((tbW+margin+5)*6), tbY, tbW, tbH, "Back", headColor,
    stdFont, JAN1, borderColor, wRad);

  // stat table
  fullMonth=new Widget(margin, tbY, sbW, tbH, "Full month stats", headColor,
    italicFont, EVENT_NULL, borderColor, wRadNC);
  tLate = new Widget(margin, tbY+tbH, sbW, tbH, "Flight departure stats", lCol,
    italicFont, T_LATE, borderColor, wRadNC);
  tAirport = new Widget(margin, tbY+(tbH*2), sbW, tbH, "Total airports", lCol,
    italicFont, T_AIRPORT, borderColor, wRadNC);
  tCancelled = new Widget(margin, tbY+(tbH*3), sbW, tbH, "Total flights cancelled", lCol,
    italicFont, T_CAN, borderColor, wRadNC);
  tDState = new Widget(margin, tbY+(tbH*4), sbW, tbH, "Total flights arriving", lCol,
    italicFont, T_ARR, borderColor, wRadNC);
  tOState = new Widget(margin, tbY+(tbH*5), sbW, tbH, "Total flights departing", lCol,
    italicFont, T_DEP, borderColor, wRadNC);

  // labels
  lCalendar = new Label (lX, lY, lW, lH, lCol, "Calendar", stdFont, wRad);
  lLateness = new Label (lX, lY, lW, lH, lCol, "Lateness", stdFont, wRad);
  lAirport = new Label (lX, lY, lW, lH, lCol, "Airport", stdFont, wRad);
  lOState = new Label (lX, lY, lW, lH, lCol, "Origin State", stdFont, wRad);
  lDState = new Label (lX, lY, lW, lH, lCol, "Destination State", stdFont, wRad);
  lCancelled = new Label (lX, lY, lW, lH, lCol, "Flights cancelled", stdFont, wRad);


  // calendar buttons
  jan1=new Widget(col6X, row1Y, calW, calH, "1", headColor, arrowFont, JAN1, borderColor, wRad);
  jan2=new Widget(col7X, row1Y, calW, calH, "2", headColor, arrowFont, JAN2, borderColor, wRad);
  jan3=new Widget(col1X, row2Y, calW, calH, "3", headColor, arrowFont, JAN3, borderColor, wRad);
  jan4=new Widget(col2X, row2Y, calW, calH, "4", headColor, arrowFont, JAN4, borderColor, wRad);
  jan5=new Widget(col3X, row2Y, calW, calH, "5", headColor, arrowFont, JAN5, borderColor, wRad);
  jan6=new Widget(col4X, row2Y, calW, calH, "6", headColor, arrowFont, JAN6, borderColor, wRad);
  jan7=new Widget(col5X, row2Y, calW, calH, "7", headColor, arrowFont, JAN7, borderColor, wRad);
  jan8=new Widget(col6X, row2Y, calW, calH, "8", headColor, arrowFont, JAN8, borderColor, wRad);
  jan9=new Widget(col7X, row2Y, calW, calH, "9", headColor, arrowFont, JAN9, borderColor, wRad);
  jan10=new Widget(col1X, row3Y, calW, calH, "10", headColor, arrowFont, JAN10, borderColor, wRad);
  jan11=new Widget(col2X, row3Y, calW, calH, "11", headColor, arrowFont, JAN11, borderColor, wRad);
  jan12=new Widget(col3X, row3Y, calW, calH, "12", headColor, arrowFont, JAN12, borderColor, wRad);
  jan13=new Widget(col4X, row3Y, calW, calH, "13", headColor, arrowFont, JAN13, borderColor, wRad);
  jan14=new Widget(col5X, row3Y, calW, calH, "14", headColor, arrowFont, JAN14, borderColor, wRad);
  jan15=new Widget(col6X, row3Y, calW, calH, "15", headColor, arrowFont, JAN15, borderColor, wRad);
  jan16=new Widget(col7X, row3Y, calW, calH, "16", headColor, arrowFont, JAN16, borderColor, wRad);
  jan17=new Widget(col1X, row4Y, calW, calH, "17", headColor, arrowFont, JAN17, borderColor, wRad);
  jan18=new Widget(col2X, row4Y, calW, calH, "18", headColor, arrowFont, JAN18, borderColor, wRad);
  jan19=new Widget(col3X, row4Y, calW, calH, "19", headColor, arrowFont, JAN19, borderColor, wRad);
  jan20=new Widget(col4X, row4Y, calW, calH, "20", headColor, arrowFont, JAN20, borderColor, wRad);
  jan21=new Widget(col5X, row4Y, calW, calH, "21", headColor, arrowFont, JAN21, borderColor, wRad);
  jan22=new Widget(col6X, row4Y, calW, calH, "22", headColor, arrowFont, JAN22, borderColor, wRad);
  jan23=new Widget(col7X, row4Y, calW, calH, "23", headColor, arrowFont, JAN23, borderColor, wRad);
  jan24=new Widget(col1X, row5Y, calW, calH, "24", headColor, arrowFont, JAN24, borderColor, wRad);
  jan25=new Widget(col2X, row5Y, calW, calH, "25", headColor, arrowFont, JAN25, borderColor, wRad);
  jan26=new Widget(col3X, row5Y, calW, calH, "26", headColor, arrowFont, JAN26, borderColor, wRad);
  jan27=new Widget(col4X, row5Y, calW, calH, "27", headColor, arrowFont, JAN27, borderColor, wRad);
  jan28=new Widget(col5X, row5Y, calW, calH, "28", headColor, arrowFont, JAN28, borderColor, wRad);
  jan29=new Widget(col6X, row5Y, calW, calH, "29", headColor, arrowFont, JAN29, borderColor, wRad);
  jan30=new Widget(col7X, row5Y, calW, calH, "30", headColor, arrowFont, JAN30, borderColor, wRad);
  jan31=new Widget(col1X, row6Y, calW, calH, "31", headColor, arrowFont, JAN31, borderColor, wRad);

  // pie charts data
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

  float canNum1=currFlight.notCanCount;
  float canNum2=currFlight.cancelledCount;
  float total2=currFlight.notCanCount+currFlight.cancelledCount;
  float ang1Graph2=(canNum1*360)/total2;
  float ang2Graph2=(canNum2*360)/total2;
  float[] graph2={ang1Graph2, ang2Graph2};

  float canPercent=(canNum2*100)/total2;
  float notcanPercent=(canNum1*100)/total2;

  // pie charts
  tLatePie = new PieChart (600, graph1, colsPC);
  tCanPie = new PieChart (600, graph2, colsPC);

  // bar charts

  tStateDBC = new BarChart(currFlight.stateD);
  tStateOBC = new BarChart(currFlight.stateO);
  tStateDBC.countTState();
  tStateOBC.countTState();
  j1StateOBC = new BarChart(subListsStateO.get(0));
  j1StateOBC.countTState();
  j2StateOBC = new BarChart(subListsStateO.get(1));
  j2StateOBC.countTState();
  j3StateOBC = new BarChart(subListsStateO.get(2));
  j3StateOBC.countTState();
  j4StateOBC = new BarChart(subListsStateO.get(3));
  j4StateOBC.countTState();
  j5StateOBC = new BarChart(subListsStateO.get(4));
  j5StateOBC.countTState();
  j6StateOBC = new BarChart(subListsStateO.get(5));
  j6StateOBC.countTState();
  j7StateOBC = new BarChart(subListsStateO.get(6));
  j6StateOBC.countTState();
  j8StateOBC = new BarChart(subListsStateO.get(7));
  j8StateOBC.countTState();
  j9StateOBC = new BarChart(subListsStateO.get(8));
  j9StateOBC.countTState();
  j10StateOBC = new BarChart(subListsStateO.get(9));
  j10StateOBC.countTState();
  j11StateOBC = new BarChart(subListsStateO.get(10));
  j11StateOBC.countTState();
  j12StateOBC = new BarChart(subListsStateO.get(11));
  j12StateOBC.countTState();
  j13StateOBC = new BarChart(subListsStateO.get(12));
  j13StateOBC.countTState();
  j14StateOBC = new BarChart(subListsStateO.get(13));
  j14StateOBC.countTState();
  j15StateOBC = new BarChart(subListsStateO.get(14));
  j15StateOBC.countTState();
  j16StateOBC = new BarChart(subListsStateO.get(15));
  j16StateOBC.countTState();
  j17StateOBC = new BarChart(subListsStateO.get(16));
  j17StateOBC.countTState();
  j18StateOBC = new BarChart(subListsStateO.get(17));
  j18StateOBC.countTState();
  j19StateOBC = new BarChart(subListsStateO.get(18));
  j19StateOBC.countTState();
  j20StateOBC = new BarChart(subListsStateO.get(19));
  j20StateOBC.countTState();
  j21StateOBC = new BarChart(subListsStateO.get(20));
  j21StateOBC.countTState();
  j22StateOBC = new BarChart(subListsStateO.get(21));
  j22StateOBC.countTState();
  j23StateOBC = new BarChart(subListsStateO.get(22));
  j23StateOBC.countTState();
  j24StateOBC = new BarChart(subListsStateO.get(23));
  j24StateOBC.countTState();
  j25StateOBC = new BarChart(subListsStateO.get(24));
  j25StateOBC.countTState();
  j26StateOBC = new BarChart(subListsStateO.get(25));
  j26StateOBC.countTState();
  j27StateOBC = new BarChart(subListsStateO.get(26));
  j27StateOBC.countTState();
  j28StateOBC = new BarChart(subListsStateO.get(27));
  j28StateOBC.countTState();
  j29StateOBC = new BarChart(subListsStateO.get(28));
  j29StateOBC.countTState();
  j30StateOBC = new BarChart(subListsStateO.get(29));
  j30StateOBC.countTState();
  j31StateOBC = new BarChart(subListsStateO.get(30));
  j31StateOBC.countTState();

  j1StateDBC = new BarChart(subListsStateD.get(0));
  j1StateDBC.countTState();
  j2StateDBC = new BarChart(subListsStateD.get(1));
  j2StateDBC.countTState();
  j3StateDBC = new BarChart(subListsStateD.get(2));
  j3StateDBC.countTState();
  j4StateDBC = new BarChart(subListsStateD.get(3));
  j4StateDBC.countTState();
  j5StateDBC = new BarChart(subListsStateD.get(4));
  j5StateDBC.countTState();
  j6StateDBC = new BarChart(subListsStateD.get(5));
  j6StateDBC.countTState();
  //j7StateDBC = new BarChart(subListsStateD.get(6));
  //j8StateDBC = new BarChart(subListsStateD.get(7));
  //j9StateDBC = new BarChart(subListsStateD.get(8));
  //j10StateDBC = new BarChart(subListsStateD.get(9));
  //j11StateDBC = new BarChart(subListsStateD.get(10));
  //j12StateDBC = new BarChart(subListsStateD.get(11));
  //j13StateDBC = new BarChart(subListsStateD.get(12));
  //j14StateDBC = new BarChart(subListsStateD.get(13));
  //j15StateDBC = new BarChart(subListsStateD.get(14));
  //j16StateDBC = new BarChart(subListsStateD.get(15));
  //j17StateDBC = new BarChart(subListsStateD.get(16));
  //j18StateDBC = new BarChart(subListsStateD.get(17));
  //j19StateDBC = new BarChart(subListsStateD.get(18));
  //j20StateDBC = new BarChart(subListsStateD.get(19));
  //j21StateDBC = new BarChart(subListsStateD.get(20));
  //j22StateDBC = new BarChart(subListsStateD.get(21));
  //j23StateDBC = new BarChart(subListsStateD.get(22));
  //j24StateDBC = new BarChart(subListsStateD.get(23));
  //j25StateDBC = new BarChart(subListsStateD.get(24));
  //j26StateDBC = new BarChart(subListsStateD.get(25));
  //j27StateDBC = new BarChart(subListsStateD.get(26));
  //j28StateDBC = new BarChart(subListsStateD.get(27));
  //j29StateDBC = new BarChart(subListsStateD.get(28));
  //j30StateDBC = new BarChart(subListsStateD.get(29));
  //j31StateDBC = new BarChart(subListsStateD.get(30));

  // screen headers
  mainHead = new Header (SCREENX, hH, headColor, "Airy Fairy", headFont);
  jan1Head = new Header (SCREENX, hH, headColor, "January 1", headFont);
  jan2Head = new Header (SCREENX, hH, headColor, "January 2", headFont);
  jan3Head = new Header (SCREENX, hH, headColor, "January 3", headFont);
  jan4Head = new Header (SCREENX, hH, headColor, "January 4", headFont);
  jan5Head = new Header (SCREENX, hH, headColor, "January 5", headFont);
  jan6Head = new Header (SCREENX, hH, headColor, "January 6", headFont);
  jan7Head = new Header (SCREENX, hH, headColor, "January 7", headFont);
  jan8Head = new Header (SCREENX, hH, headColor, "January 8", headFont);
  jan9Head = new Header (SCREENX, hH, headColor, "January 9", headFont);
  jan10Head = new Header (SCREENX, hH, headColor, "January 10", headFont);
  jan11Head = new Header (SCREENX, hH, headColor, "January 11", headFont);
  jan12Head = new Header (SCREENX, hH, headColor, "January 12", headFont);
  jan13Head = new Header (SCREENX, hH, headColor, "January 13", headFont);
  jan14Head = new Header (SCREENX, hH, headColor, "January 14", headFont);
  jan15Head = new Header (SCREENX, hH, headColor, "January 15", headFont);
  jan16Head = new Header (SCREENX, hH, headColor, "January 16", headFont);
  jan17Head = new Header (SCREENX, hH, headColor, "January 17", headFont);
  jan18Head = new Header (SCREENX, hH, headColor, "January 18", headFont);
  jan19Head = new Header (SCREENX, hH, headColor, "January 19", headFont);
  jan20Head = new Header (SCREENX, hH, headColor, "January 20", headFont);
  jan21Head = new Header (SCREENX, hH, headColor, "January 21", headFont);
  jan22Head = new Header (SCREENX, hH, headColor, "January 22", headFont);
  jan23Head = new Header (SCREENX, hH, headColor, "January 23", headFont);
  jan24Head = new Header (SCREENX, hH, headColor, "January 24", headFont);
  jan25Head = new Header (SCREENX, hH, headColor, "January 25", headFont);
  jan26Head = new Header (SCREENX, hH, headColor, "January 26", headFont);
  jan27Head = new Header (SCREENX, hH, headColor, "January 27", headFont);
  jan28Head = new Header (SCREENX, hH, headColor, "January 28", headFont);
  jan29Head = new Header (SCREENX, hH, headColor, "January 29", headFont);
  jan30Head = new Header (SCREENX, hH, headColor, "January 30", headFont);
  jan31Head = new Header (SCREENX, hH, headColor, "January 31", headFont);
  lateHead= new Header (SCREENX, hH, headColor, "Total Late Flights", headFont);
  canHead=new Header (SCREENX, hH, headColor, "Total Cancelled Flights", headFont);
  orgHead=new Header (SCREENX, hH, headColor, "Total Departures", headFont);
  destHead=new Header (SCREENX, hH, headColor, "Total Arrivals", headFont);
  airportHead =new Header (SCREENX, hH, headColor, "Total Flights Per Airport", headFont);

  // screens
  introScreen = new Screen(bgCol);

  mainScreen = new Screen(bgCol);
  mainScreen.addHeader(mainHead);
  mainScreen.addLabel(lCalendar);


  mainScreen.addWidget(tLate);
  mainScreen.addWidget(tAirport);
  mainScreen.addWidget(tOState);
  mainScreen.addWidget(tDState);
  mainScreen.addWidget(fullMonth);
  mainScreen.addWidget(tCancelled);


  mainScreen.addWidget(jan1);
  mainScreen.addWidget(jan2);
  mainScreen.addWidget(jan3);
  mainScreen.addWidget(jan4);
  mainScreen.addWidget(jan5);
  mainScreen.addWidget(jan6);
  mainScreen.addWidget(jan7);
  mainScreen.addWidget(jan8);
  mainScreen.addWidget(jan9);
  mainScreen.addWidget(jan10);
  mainScreen.addWidget(jan11);
  mainScreen.addWidget(jan12);
  mainScreen.addWidget(jan13);
  mainScreen.addWidget(jan14);
  mainScreen.addWidget(jan15);
  mainScreen.addWidget(jan16);
  mainScreen.addWidget(jan17);
  mainScreen.addWidget(jan18);
  mainScreen.addWidget(jan19);
  mainScreen.addWidget(jan20);
  mainScreen.addWidget(jan21);
  mainScreen.addWidget(jan22);
  mainScreen.addWidget(jan23);
  mainScreen.addWidget(jan24);
  mainScreen.addWidget(jan25);
  mainScreen.addWidget(jan26);
  mainScreen.addWidget(jan27);
  mainScreen.addWidget(jan28);
  mainScreen.addWidget(jan29);
  mainScreen.addWidget(jan30);
  mainScreen.addWidget(jan31);


  jan1Screen = new Screen(bgCol);
  jan1Screen.addHeader(jan1Head);
  jan1Screen.addWidget(bHomeScreen);
  jan1Screen.addWidget(bLateness);
  jan1Screen.addWidget(bAirport);
  jan1Screen.addWidget(bOState);
  jan1Screen.addWidget(bDState);
  jan1Screen.addWidget(bCancelled);
  //jan1Screen.addBarChart(j1StateOBC);

  jan2Screen = new Screen(bgCol);
  jan2Screen.addHeader(jan2Head);
  jan2Screen.addWidget(bHomeScreen);
  jan2Screen.addWidget(bLateness);
  jan2Screen.addWidget(bAirport);
  jan2Screen.addWidget(bOState);
  jan2Screen.addWidget(bDState);
  jan2Screen.addWidget(bCancelled);

  jan3Screen = new Screen(bgCol);
  jan3Screen.addHeader(jan3Head);
  jan3Screen.addWidget(bHomeScreen);
  jan3Screen.addWidget(bLateness);
  jan3Screen.addWidget(bAirport);
  jan3Screen.addWidget(bOState);
  jan3Screen.addWidget(bDState);
  jan3Screen.addWidget(bCancelled);

  jan4Screen = new Screen(bgCol);
  jan4Screen.addHeader(jan4Head);
  jan4Screen.addWidget(bHomeScreen);
  jan4Screen.addWidget(bLateness);
  jan4Screen.addWidget(bAirport);
  jan4Screen.addWidget(bOState);
  jan4Screen.addWidget(bDState);
  jan4Screen.addWidget(bCancelled);

  jan5Screen = new Screen(bgCol);
  jan5Screen.addHeader(jan5Head);
  jan5Screen.addWidget(bHomeScreen);
  jan5Screen.addWidget(bLateness);
  jan5Screen.addWidget(bAirport);
  jan5Screen.addWidget(bOState);
  jan5Screen.addWidget(bDState);
  jan5Screen.addWidget(bCancelled);

  jan6Screen = new Screen(bgCol);
  jan6Screen.addHeader(jan6Head);
  jan6Screen.addWidget(bHomeScreen);
  jan6Screen.addWidget(bLateness);
  jan6Screen.addWidget(bAirport);
  jan6Screen.addWidget(bOState);
  jan6Screen.addWidget(bDState);
  jan6Screen.addWidget(bCancelled);

  jan7Screen = new Screen(bgCol);
  jan7Screen.addHeader(jan7Head);
  jan7Screen.addWidget(bHomeScreen);
  jan7Screen.addWidget(bLateness);
  jan7Screen.addWidget(bAirport);
  jan7Screen.addWidget(bOState);
  jan7Screen.addWidget(bDState);
  jan7Screen.addWidget(bCancelled);

  jan8Screen = new Screen(bgCol);
  jan8Screen.addHeader(jan8Head);
  jan8Screen.addWidget(bHomeScreen);
  jan8Screen.addWidget(bLateness);
  jan8Screen.addWidget(bAirport);
  jan8Screen.addWidget(bOState);
  jan8Screen.addWidget(bDState);
  jan8Screen.addWidget(bCancelled);

  jan9Screen = new Screen(bgCol);
  jan9Screen.addHeader(jan9Head);
  jan9Screen.addWidget(bHomeScreen);
  jan9Screen.addWidget(bLateness);
  jan9Screen.addWidget(bAirport);
  jan9Screen.addWidget(bOState);
  jan9Screen.addWidget(bDState);
  jan9Screen.addWidget(bCancelled);

  jan10Screen = new Screen(bgCol);
  jan10Screen.addHeader(jan10Head);
  jan10Screen.addWidget(bHomeScreen);
  jan10Screen.addWidget(bLateness);
  jan10Screen.addWidget(bAirport);
  jan10Screen.addWidget(bOState);
  jan10Screen.addWidget(bDState);
  jan10Screen.addWidget(bCancelled);

  jan11Screen = new Screen(bgCol);
  jan11Screen.addHeader(jan11Head);
  jan11Screen.addWidget(bHomeScreen);
  jan11Screen.addWidget(bLateness);
  jan11Screen.addWidget(bAirport);
  jan11Screen.addWidget(bOState);
  jan11Screen.addWidget(bDState);
  jan11Screen.addWidget(bCancelled);

  jan12Screen = new Screen(bgCol);
  jan12Screen.addHeader(jan12Head);
  jan12Screen.addWidget(bHomeScreen);
  jan12Screen.addWidget(bLateness);
  jan12Screen.addWidget(bAirport);
  jan12Screen.addWidget(bOState);
  jan12Screen.addWidget(bDState);
  jan12Screen.addWidget(bCancelled);

  jan13Screen = new Screen(bgCol);
  jan13Screen.addHeader(jan13Head);
  jan13Screen.addWidget(bHomeScreen);
  jan13Screen.addWidget(bLateness);
  jan13Screen.addWidget(bAirport);
  jan13Screen.addWidget(bOState);
  jan13Screen.addWidget(bDState);
  jan13Screen.addWidget(bCancelled);

  jan14Screen = new Screen(bgCol);
  jan14Screen.addHeader(jan14Head);
  jan14Screen.addWidget(bHomeScreen);
  jan14Screen.addWidget(bLateness);
  jan14Screen.addWidget(bAirport);
  jan14Screen.addWidget(bOState);
  jan14Screen.addWidget(bDState);
  jan14Screen.addWidget(bCancelled);

  jan15Screen = new Screen(bgCol);
  jan15Screen.addHeader(jan15Head);
  jan15Screen.addWidget(bHomeScreen);
  jan15Screen.addWidget(bLateness);
  jan15Screen.addWidget(bAirport);
  jan15Screen.addWidget(bOState);
  jan15Screen.addWidget(bDState);
  jan15Screen.addWidget(bCancelled);

  jan16Screen = new Screen(bgCol);
  jan16Screen.addHeader(jan16Head);
  jan16Screen.addWidget(bHomeScreen);
  jan16Screen.addWidget(bLateness);
  jan16Screen.addWidget(bAirport);
  jan16Screen.addWidget(bOState);
  jan16Screen.addWidget(bDState);
  jan16Screen.addWidget(bCancelled);

  jan17Screen = new Screen(bgCol);
  jan17Screen.addHeader(jan17Head);
  jan17Screen.addWidget(bHomeScreen);
  jan17Screen.addWidget(bLateness);
  jan17Screen.addWidget(bAirport);
  jan17Screen.addWidget(bOState);
  jan17Screen.addWidget(bDState);
  jan17Screen.addWidget(bCancelled);

  jan18Screen = new Screen(bgCol);
  jan18Screen.addHeader(jan18Head);
  jan18Screen.addWidget(bHomeScreen);
  jan18Screen.addWidget(bLateness);
  jan18Screen.addWidget(bAirport);
  jan18Screen.addWidget(bOState);
  jan18Screen.addWidget(bDState);
  jan18Screen.addWidget(bCancelled);

  jan19Screen = new Screen(bgCol);
  jan19Screen.addHeader(jan19Head);
  jan19Screen.addWidget(bHomeScreen);
  jan19Screen.addWidget(bLateness);
  jan19Screen.addWidget(bAirport);
  jan19Screen.addWidget(bOState);
  jan19Screen.addWidget(bDState);
  jan19Screen.addWidget(bCancelled);

  jan20Screen = new Screen(bgCol);
  jan20Screen.addHeader(jan20Head);
  jan20Screen.addWidget(bHomeScreen);
  jan20Screen.addWidget(bLateness);
  jan20Screen.addWidget(bAirport);
  jan20Screen.addWidget(bOState);
  jan20Screen.addWidget(bDState);
  jan20Screen.addWidget(bCancelled);

  jan21Screen = new Screen(bgCol);
  jan21Screen.addHeader(jan21Head);
  jan21Screen.addWidget(bHomeScreen);
  jan21Screen.addWidget(bLateness);
  jan21Screen.addWidget(bAirport);
  jan21Screen.addWidget(bOState);
  jan21Screen.addWidget(bDState);
  jan21Screen.addWidget(bCancelled);

  jan22Screen = new Screen(bgCol);
  jan22Screen.addHeader(jan22Head);
  jan22Screen.addWidget(bHomeScreen);
  jan22Screen.addWidget(bLateness);
  jan22Screen.addWidget(bAirport);
  jan22Screen.addWidget(bOState);
  jan22Screen.addWidget(bDState);
  jan22Screen.addWidget(bCancelled);

  jan23Screen = new Screen(bgCol);
  jan23Screen.addHeader(jan23Head);
  jan23Screen.addWidget(bHomeScreen);
  jan23Screen.addWidget(bLateness);
  jan23Screen.addWidget(bAirport);
  jan23Screen.addWidget(bOState);
  jan23Screen.addWidget(bDState);
  jan23Screen.addWidget(bCancelled);

  jan24Screen = new Screen(bgCol);
  jan24Screen.addHeader(jan24Head);
  jan24Screen.addWidget(bHomeScreen);
  jan24Screen.addWidget(bLateness);
  jan24Screen.addWidget(bAirport);
  jan24Screen.addWidget(bOState);
  jan24Screen.addWidget(bDState);
  jan24Screen.addWidget(bCancelled);

  jan25Screen = new Screen(bgCol);
  jan25Screen.addHeader(jan25Head);
  jan25Screen.addWidget(bHomeScreen);
  jan25Screen.addWidget(bLateness);
  jan25Screen.addWidget(bAirport);
  jan25Screen.addWidget(bOState);
  jan25Screen.addWidget(bDState);
  jan25Screen.addWidget(bCancelled);

  jan26Screen = new Screen(bgCol);
  jan26Screen.addHeader(jan26Head);
  jan26Screen.addWidget(bHomeScreen);
  jan26Screen.addWidget(bLateness);
  jan26Screen.addWidget(bAirport);
  jan26Screen.addWidget(bOState);
  jan26Screen.addWidget(bDState);
  jan26Screen.addWidget(bCancelled);

  jan27Screen = new Screen(bgCol);
  jan27Screen.addHeader(jan27Head);
  jan27Screen.addWidget(bHomeScreen);
  jan27Screen.addWidget(bLateness);
  jan27Screen.addWidget(bAirport);
  jan27Screen.addWidget(bOState);
  jan27Screen.addWidget(bDState);
  jan27Screen.addWidget(bCancelled);

  jan28Screen = new Screen(bgCol);
  jan28Screen.addHeader(jan28Head);
  jan28Screen.addWidget(bHomeScreen);
  jan28Screen.addWidget(bLateness);
  jan28Screen.addWidget(bAirport);
  jan28Screen.addWidget(bOState);
  jan28Screen.addWidget(bDState);
  jan28Screen.addWidget(bCancelled);

  jan29Screen = new Screen(bgCol);
  jan29Screen.addHeader(jan29Head);
  jan29Screen.addWidget(bHomeScreen);
  jan29Screen.addWidget(bLateness);
  jan29Screen.addWidget(bAirport);
  jan29Screen.addWidget(bOState);
  jan29Screen.addWidget(bDState);
  jan29Screen.addWidget(bCancelled);

  jan30Screen = new Screen(bgCol);
  jan30Screen.addHeader(jan30Head);
  jan30Screen.addWidget(bHomeScreen);
  jan30Screen.addWidget(bLateness);
  jan30Screen.addWidget(bAirport);
  jan30Screen.addWidget(bOState);
  jan30Screen.addWidget(bDState);
  jan30Screen.addWidget(bCancelled);

  jan31Screen = new Screen(bgCol);
  jan31Screen.addHeader(jan31Head);
  jan31Screen.addWidget(bHomeScreen);
  jan31Screen.addWidget(bLateness);
  jan31Screen.addWidget(bAirport);
  jan31Screen.addWidget(bOState);
  jan31Screen.addWidget(bDState);
  jan31Screen.addWidget(bCancelled);


  totalLateScreen=new Screen(bgCol, countTimePercent, countErlyPercent, countLtePercent);
  totalLateScreen.addHeader(lateHead);
  totalLateScreen.addWidget(bHomeScreen);
  totalLateScreen.addPieChart(tLatePie);

  totalCanScreen= new Screen(bgCol, notcanPercent, canPercent);
  totalCanScreen.addHeader(canHead);
  totalCanScreen.addWidget(bHomeScreen);
  totalCanScreen.addPieChart(tCanPie);

  totalOriginScreen=new Screen(bgCol);
  totalOriginScreen.addHeader(orgHead);
  totalOriginScreen.addWidget(bHomeScreen);

  totalDestScreen= new Screen(bgCol);
  totalDestScreen.addHeader(destHead);
  totalDestScreen.addWidget(bHomeScreen);

  totalAirportScreen= new Screen(bgCol);
  totalAirportScreen.addHeader(airportHead);
  totalAirportScreen.addWidget(bHomeScreen);


  lateScreen = new Screen(bgCol);
  lateScreen.addWidget(bHomeScreen);
  lateScreen.addWidget(bLateness);
  lateScreen.addWidget(bAirport);
  lateScreen.addWidget(bOState);
  lateScreen.addWidget(bDState);
  lateScreen.addWidget(bCancelled);

  canScreen = new Screen(bgCol);
  canScreen.addWidget(bHomeScreen);
  canScreen.addWidget(bLateness);
  canScreen.addWidget(bAirport);
  canScreen.addWidget(bOState);
  canScreen.addWidget(bDState);
  canScreen.addWidget(bCancelled);

  airpScreen = new Screen(bgCol);
  airpScreen.addWidget(bHomeScreen);
  airpScreen.addWidget(bLateness);
  airpScreen.addWidget(bAirport);
  airpScreen.addWidget(bOState);
  airpScreen.addWidget(bDState);
  airpScreen.addWidget(bCancelled);

  origScreen = new Screen(bgCol);
  origScreen.addWidget(bHomeScreen);
  origScreen.addWidget(bLateness);
  origScreen.addWidget(bAirport);
  origScreen.addWidget(bOState);
  origScreen.addWidget(bDState);
  origScreen.addWidget(bCancelled);

  origScreen.addWidget(bBack);

  destScreen = new Screen(bgCol);
  destScreen.addWidget(bHomeScreen);
  destScreen.addWidget(bLateness);
  destScreen.addWidget(bAirport);
  destScreen.addWidget(bOState);
  destScreen.addWidget(bDState);
  destScreen.addWidget(bCancelled);

  destScreen.addWidget(bBack);

  // * creating Array list
  widgetList = new ArrayList();

  widgetList.add(bHomeScreen);
  widgetList.add(bLateness);
  widgetList.add(bAirport);
  widgetList.add(bOState);
  widgetList.add(bDState);
  widgetList.add(bCancelled);

  widgetList.add(tLate);
  widgetList.add(tAirport);
  widgetList.add(tOState);
  widgetList.add(tDState);
  widgetList.add(tCancelled);

  widgetList.add(jan1);
  widgetList.add(jan2);
  widgetList.add(jan3);
  widgetList.add(jan4);
  widgetList.add(jan5);
  widgetList.add(jan6);
  widgetList.add(jan7);
  widgetList.add(jan8);
  widgetList.add(jan9);
  widgetList.add(jan10);
  widgetList.add(jan11);
  widgetList.add(jan12);
  widgetList.add(jan13);
  widgetList.add(jan14);
  widgetList.add(jan15);
  widgetList.add(jan16);
  widgetList.add(jan17);
  widgetList.add(jan18);
  widgetList.add(jan19);
  widgetList.add(jan20);
  widgetList.add(jan21);
  widgetList.add(jan22);
  widgetList.add(jan23);
  widgetList.add(jan24);
  widgetList.add(jan25);
  widgetList.add(jan26);
  widgetList.add(jan27);
  widgetList.add(jan28);
  widgetList.add(jan29);
  widgetList.add(jan30);
  widgetList.add(jan31);


  screenList = new ArrayList();
  screenList.add(currentScreen);
  screenList.add(introScreen);
  screenList.add(mainScreen);

  screenList.add(totalLateScreen);
  screenList.add(totalAirportScreen);
  screenList.add(totalDestScreen);
  screenList.add(totalOriginScreen);
  screenList.add(totalCanScreen);

  screenList.add(lateScreen);
  screenList.add(canScreen);
  screenList.add(airpScreen);
  screenList.add(origScreen);
  screenList.add(destScreen);

  screenList.add(jan1Screen);
  screenList.add(jan2Screen);
  screenList.add(jan3Screen);
  screenList.add(jan4Screen);
  screenList.add(jan5Screen);
  screenList.add(jan6Screen);
  screenList.add(jan7Screen);
  screenList.add(jan8Screen);
  screenList.add(jan9Screen);
  screenList.add(jan10Screen);
  screenList.add(jan11Screen);
  screenList.add(jan12Screen);
  screenList.add(jan13Screen);
  screenList.add(jan14Screen);
  screenList.add(jan15Screen);
  screenList.add(jan16Screen);
  screenList.add(jan17Screen);
  screenList.add(jan18Screen);
  screenList.add(jan19Screen);
  screenList.add(jan20Screen);
  screenList.add(jan21Screen);
  screenList.add(jan22Screen);
  screenList.add(jan23Screen);
  screenList.add(jan24Screen);
  screenList.add(jan25Screen);
  screenList.add(jan26Screen);
  screenList.add(jan27Screen);
  screenList.add(jan28Screen);
  screenList.add(jan29Screen);
  screenList.add(jan30Screen);
  screenList.add(jan31Screen);



  currentScreen = introScreen;
  currAirBC = j1AirBC;

  currFlight.countAirp();
}

void draw()
{

  currentScreen.draw();
  
  for (int i = 0; i<widgetList.size(); i++)
  {
    Widget aWidget = (Widget)widgetList.get(i);
    aWidget.mouseOnButton(mouseX, mouseY);
  }
}


void mousePressed()
{
  int event = currentScreen.getEvent();

  switch(event)
  {
  case MAIN_SCREEN:
    currentScreen = mainScreen;

    break;

  case JAN1:
    currentScreen = jan1Screen;
    lateScreen.addHeader(jan1Head);
    canScreen.addHeader(jan1Head);
    origScreen.addHeader(jan1Head);
    destScreen.addHeader(jan1Head);
    airpScreen.addHeader(jan1Head);
    
    currStateOBC = j1StateOBC;
    currStateDBC = j1StateDBC;
    break;

  case JAN2:
    currentScreen = jan2Screen;
    lateScreen.addHeader(jan2Head);
    canScreen.addHeader(jan2Head);
    origScreen.addHeader(jan2Head);
    destScreen.addHeader(jan2Head);
    airpScreen.addHeader(jan2Head);
    
    currStateOBC = j2StateOBC;
    currStateDBC = j2StateDBC;
    break;

  case JAN3:
    currentScreen = jan3Screen;
    lateScreen.addHeader(jan3Head);
    canScreen.addHeader(jan3Head);
    origScreen.addHeader(jan3Head);
    destScreen.addHeader(jan3Head);
    airpScreen.addHeader(jan3Head);
    
    currStateOBC = j3StateOBC;
    currStateDBC = j3StateDBC;
    break;

  case JAN4:
    currentScreen = jan4Screen;
    lateScreen.addHeader(jan4Head);
    canScreen.addHeader(jan4Head);
    origScreen.addHeader(jan4Head);
    destScreen.addHeader(jan4Head);
    airpScreen.addHeader(jan4Head);
    
    break;

  case JAN5:
    currentScreen = jan5Screen;
    lateScreen.addHeader(jan5Head);
    canScreen.addHeader(jan5Head);
    origScreen.addHeader(jan5Head);
    destScreen.addHeader(jan5Head);
    airpScreen.addHeader(jan5Head);
    break;

  case JAN6:
    currentScreen = jan6Screen;
    lateScreen.addHeader(jan6Head);
    canScreen.addHeader(jan6Head);
    origScreen.addHeader(jan6Head);
    destScreen.addHeader(jan6Head);
    airpScreen.addHeader(jan6Head);
    break;

  case JAN7:
    currentScreen = jan7Screen;
    lateScreen.addHeader(jan7Head);
    canScreen.addHeader(jan7Head);
    origScreen.addHeader(jan7Head);
    destScreen.addHeader(jan7Head);
    airpScreen.addHeader(jan7Head);
    break;

  case JAN8:
    currentScreen = jan8Screen;
    lateScreen.addHeader(jan8Head);
    canScreen.addHeader(jan8Head);
    origScreen.addHeader(jan8Head);
    destScreen.addHeader(jan8Head);
    airpScreen.addHeader(jan8Head);
    break;

  case JAN9:
    currentScreen = jan9Screen;
    break;

  case JAN10:
    currentScreen = jan10Screen;
    break;

  case JAN11:
    currentScreen = jan11Screen;
    break;

  case JAN12:
    currentScreen = jan12Screen;
    break;

  case JAN13:
    currentScreen = jan13Screen;
    break;

  case JAN14:
    currentScreen = jan14Screen;
    break;

  case JAN15:
    currentScreen = jan15Screen;
    break;

  case JAN16:
    currentScreen = jan16Screen;
    break;

  case JAN17:
    currentScreen = jan17Screen;
    break;

  case JAN18:
    currentScreen = jan18Screen;
    break;

  case JAN19:
    currentScreen = jan19Screen;
    break;

  case JAN20:
    currentScreen = jan20Screen;
    break;

  case JAN21:
    currentScreen = jan21Screen;
    break;

  case JAN22:
    currentScreen = jan22Screen;
    break;

  case JAN23:
    currentScreen = jan23Screen;
    break;

  case JAN24:
    currentScreen = jan24Screen;
    break;

  case JAN25:
    currentScreen = jan25Screen;
    break;

  case JAN26:
    currentScreen = jan26Screen;
    break;

  case JAN27:
    currentScreen = jan27Screen;
    break;

  case JAN28:
    currentScreen = jan28Screen;
    break;

  case JAN29:
    currentScreen = jan29Screen;
    break;

  case JAN30:
    currentScreen = jan30Screen;
    break;

  case JAN31:
    currentScreen = jan31Screen;
    break;

  case T_LATE:
    currentScreen = totalLateScreen;
    break;

  case T_CAN:
    currentScreen=totalCanScreen;
    break;

  case T_AIRPORT:
    currentScreen = totalAirportScreen;
    break;

  case T_DEP:
    currentScreen = totalOriginScreen;
    totalOriginScreen.addBarChart(tStateOBC);
    break;

  case T_ARR:
    currentScreen = totalDestScreen;
    totalDestScreen.addBarChart(tStateDBC);
    break;

  default:
    break;
  }

  switch (event)
  {
  case EVENT_LATE:
    currentScreen=lateScreen;
    currentScreen.addLabel(lLateness);
    break;

  case EVENT_AIRPORT:
    currentScreen=airpScreen;
    currentScreen.addLabel(lAirport);
    break;

  case EVENT_OSTATE:
    currentScreen = origScreen;
    currentScreen.addLabel(lOState);
    break;

  case EVENT_DSTATE:
    currentScreen = destScreen;
    currentScreen.addLabel(lDState);
    break;

  case EVENT_CANCEL:
    currentScreen=canScreen;
    currentScreen.addLabel(lCancelled);
    break;

  case T_ARR:
    totalDestScreen.addBarChart(tStateDBC);
    break;

  case T_DEP:
    totalOriginScreen.addBarChart(tStateOBC);
    break;

  default:
    break;
  }
  
  if(currentScreen==mainScreen)
  {
    currentScreen.removeBarChart(currStateDBC);
    currentScreen.removeBarChart(currStateOBC);
    destScreen.removeBarChart(currStateDBC);
    origScreen.removeBarChart(currStateOBC);
  }
  else if(currentScreen==destScreen)
  {
    origScreen.removeBarChart(currStateOBC);
    currentScreen.addBarChart(currStateDBC);
  }
  else if(currentScreen==origScreen)
  {
    destScreen.removeBarChart(currStateDBC);
    currentScreen.addBarChart(currStateOBC);
  }
  else if(currentScreen==lateScreen)
  {
    destScreen.removeBarChart(currStateDBC);
    origScreen.removeBarChart(currStateOBC);
  }
  else if(currentScreen==canScreen)
  {
    destScreen.removeBarChart(currStateDBC);
    origScreen.removeBarChart(currStateOBC);
  }
  else if(currentScreen==airpScreen)
  {
    destScreen.removeBarChart(currStateDBC);
    origScreen.removeBarChart(currStateOBC);
  }
}
