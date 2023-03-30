// screen 

class Screen 
{   
  ArrayList widgets , headerList, labelList;
  color backgroundColor;

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
  
  
  
  
  
  
} 
