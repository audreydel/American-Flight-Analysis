// screen

class Screen
{
  ArrayList widgets, headerList, labelList, pieChartList, barChartList;
  color backgroundColor;
  float perc1, perc2, perc3;
  PieChart currPie;

  // normal screeen
  Screen(color backgroundColor)
  {
    this.backgroundColor = backgroundColor;

    widgets = new ArrayList();
    headerList = new ArrayList();
    labelList = new ArrayList();
    pieChartList = new ArrayList();
    barChartList = new ArrayList();
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
    } else
    {
      background(backgroundColor);
    }

    if (currentScreen == mainScreen)
    {
      fill (186, 111, 96);
      text("Click on a date to see the stats", 550, 295);
    }
    if (currentScreen==totalLateScreen || currentScreen == lateScreen)
    {
      stroke(0);
      fill(0);
      textFont(italicFont);
      textSize(30);
      text("Key:", 910, 300);

      fill(#FBE29F);
      rect(910, 300+15, 40, 40);
      fill(0);
      textSize(23);
      text("Flights departing on time (±5 mins): "+ round(currOnTimePerc) +"%", 960, 300+40);
      
      fill(#E8A09A);
      rect(910, 300+100, 40, 40);
      fill(0);
      text("Flights departing early: "+ round(currEarlyPerc) +"%", 960, 300+130);
      
      fill(#9BBFE0);
      rect(910, 300+170, 40, 40);
      fill(0);
      text("Flights departing late: "+ round(currLatePerc) +"%", 960, 300+200);
    }

    if (currentScreen==totalCanScreen || currentScreen == canScreen)
    {
      stroke(0);
      fill(0);
      textFont(italicFont);
      textSize(30);
      text("Key:", 910, 300);
      fill(#FBE29F);
      rect(910, 315, 40, 40);
      fill(0);
      textSize(25);
      text("Flights not cancelled: "+ round(currNotCanPerc) +"%", 960, 340);
      fill(#E8A09A);
      rect(910, 400, 40, 40);
      fill(0);
      text("Flights cancelled: "+ round(currCanPerc) +"%", 960, 430);
    }

    if (currentScreen == totalOriginScreen || currentScreen == totalDestScreen)
    {
      fill(0);
      textFont(italicFont);
      textSize(15.6);
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

    for (int i=0; i<barChartList.size(); i++)
    {
      BarChart barChart = (BarChart) barChartList.get(i);
      barChart.draw();
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

  void addBarChart (BarChart barChart)
  {
    barChartList.add(barChart);
  }

  void removeBarChart(BarChart barChart)
  {
    barChartList.remove(barChart);
  }
}
