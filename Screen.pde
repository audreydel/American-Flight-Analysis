// screen 

class Screen 
{   
  ArrayList widgets , headerList, labelList;
  color backgroundColor;
  PieChart latePieChart;

  Screen(color backgroundColor) 
  {     
    widgets = new ArrayList();   
    headerList = new ArrayList();
    labelList = new ArrayList();
    this.backgroundColor = backgroundColor;
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
      text("Key:", 900, 150);
      fill(#FBE29F);
      rect(900, 165, 40, 40);
      fill(0);
      text("Flights departing on time \n (±5 mins) "+latePieChart.countTimePercent+"%", 950, 190);
      fill(#E8A09A);
      rect(900, 250, 40, 40);
      fill(0);
      text("Flights departing early \n"+latePieChart.countErlyPercent+"%", 950, 280);
      fill(#9BBFE0);
      rect(900, 330, 40, 40);
      fill(0);
      text("Flights departing late \n"+latePieChart.countLtePercent+"%", 950, 360);
    }
    
    if(currentScreen==totalCanScreen)
    {
      stroke(0);
      fill(0);
      text("Key:", 900, 150);
      fill(#FBE29F);
      rect(900, 165, 40, 40);
      fill(0);
      text("Flights not cancelled \n"+latePieChart.notcanPercent+"%", 950, 190);
      fill(#E8A09A);
      rect(900, 250, 40, 40);
      fill(0);
      text("Flights cancelled \n"+latePieChart.canPercent+"%", 950, 280);
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
    
    for (int i = 0; i < widgets.size(); i++) 
    {       
      Widget widget = (Widget) widgets.get(i);       
      widget.draw();
    }
    
    if (latePieChart!=null)
      latePieChart.draw();
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
  
  void addPieChart(float diam) {
    latePieChart=new PieChart(diam);
  }
  
} 
