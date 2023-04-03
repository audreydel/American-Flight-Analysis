// screen 

class Screen 
{   
  ArrayList widgets , headerList, labelList, pieChartList;
  color backgroundColor;
  float perc1, perc2, perc3;
  
  // normal screeen
  Screen(color backgroundColor) 
  {     
    this.backgroundColor = backgroundColor;

    widgets = new ArrayList();   
    headerList = new ArrayList();
    labelList = new ArrayList();
    pieChartList = new ArrayList();
  }
  
  // screen for lateness pie chart
  Screen(color backgroundColor, float perc1, float perc2, float perc3)
  {
    this.backgroundColor = backgroundColor;
    this.perc1 = perc1;
    this.perc2 = perc2; 
    this.perc3 = perc3;
    widgets = new ArrayList();   
    headerList = new ArrayList();
    labelList = new ArrayList();
    pieChartList = new ArrayList();
  }
  
  // screen for cancelled pie chart
  Screen (color backgroundColor, float perc1, float perc2)
  {
    this.backgroundColor = backgroundColor;
    this.perc1 = perc1;
    this.perc2 = perc2;
    widgets = new ArrayList();   
    headerList = new ArrayList();
    labelList = new ArrayList();
    pieChartList = new ArrayList();
  }
  

  int getEvent() 
  {     
    if (currentScreen == introScreen)
    {
      if (mousePressed)
      {
        currentScreen = mainScreen;
      }
    }
    
    
    for (int i = 0; i < widgets.size(); i++) 
    {       
      Widget widget = (Widget) widgets.get(i);       
      int event = widget.getEvent(mouseX, mouseY);       
      if (event != EVENT_NULL) 
      {         
        return event;
      }
    }     
    return EVENT_NULL;
  }
  
  void draw() 
  {     
    if (currentScreen == introScreen)
    {
      background(logo);
      fill (186, 111, 96);
      text("Click anywhere to continue", 500, 700);
    }
    else 
    {
      background(backgroundColor);  
    }
    
    if (currentScreen == mainScreen)
    {
      fill (186, 111, 96);
      text("Click on a date to see the stats", 550, 250);
      
    }
    if (currentScreen==totalLateScreen)
    {
      stroke(0);
      fill(0);
      textFont(italicFont);
      textSize(30);
      text("Key:", 900, 150);
      fill(#FBE29F);
      rect(900, 165, 40, 40);
      fill(0);
      
      textSize(23);
      text("Flights departing on time (±5 mins) "+ round(perc1) +"%", 950, 190);
      fill(#E8A09A);
      rect(900, 250, 40, 40);
      fill(0);
      text("Flights departing early "+ round(perc2) +"%", 950, 280);
      fill(#9BBFE0);
      rect(900, 330, 40, 40);
      fill(0);
      text("Flights departing late "+ round(perc3) +"%", 950, 360);
    }
    
    if(currentScreen==totalCanScreen)
    {
      stroke(0);
      fill(0);
      textFont(italicFont);
      textSize(30);
      text("Key:", 900, 150);
      fill(#FBE29F);
      rect(900, 165, 40, 40);
      fill(0);
      textSize(25);
      text("Flights not cancelled "+ round(perc1) +"%", 950, 190);
      fill(#E8A09A);
      rect(900, 250, 40, 40);
      fill(0);
      text("Flights cancelled "+ round(perc2) +"%", 950, 280);
    }
    
    for (int i = 0; i<headerList.size(); i++)
    {
      Header header = (Header) headerList.get(i);
      header.draw();
    }
    
    for (int i = 0; i<labelList.size(); i++)
    {
      Label label = (Label) labelList.get(i);
      label.draw();
    }
    for (int i = 0; i < pieChartList.size(); i++)
    {
      PieChart pieChart = (PieChart) pieChartList.get(i);
      pieChart.draw();
    }
    
    for (int i = 0; i < widgets.size(); i++) 
    {       
      Widget widget = (Widget) widgets.get(i);       
      widget.draw();
    }

  }
  
  void addWidget(Widget widget) 
  {     
    widgets.add(widget);
  }
  
  void addHeader(Header header)
  {
    headerList.add(header);
  }
  
  void addLabel (Label label)
  {
    labelList.add(label);
  }
  
  void addPieChart (PieChart pieChart)
  {
    pieChartList.add(pieChart);
  }

} 
