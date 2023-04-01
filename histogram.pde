import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;
import java.util.Collections;
import java.util.Set;
import java.util.HashSet;

//HashMap<String, Integer> airportCount;

//class Histogram {
//  String xAxisLabel;
//  String yAxisLabel;
//  String title;
//  ArrayList<Widget> barArray = new ArrayList<Widget>();
//  color theColour = color(#FA90E1);
//  ArrayList<String> uniqueValues = new ArrayList<String>();
//  ArrayList<String> airportNames = currFlight.origin;
//  Set<String> set = new HashSet<>(airportNames);
//  int xAxisWidth = (SCREENX*2)/3;

//  Histogram(ArrayList<String> airportNames, String xAxis, String yAxis, String header) {
//    airportCount = new HashMap<>();
//    xAxisLabel = xAxis;
//    yAxisLabel = yAxis;
//    title = header;

//    // iterate over the list of airport names
//    for (String airport : airportNames) {
//      // if the airport is already in the map, increment its count
//      if (airportCount.containsKey(airport)) {
//        int count = airportCount.get(airport);
//        airportCount.put(airport, count + 1);
//      }
//      // otherwise, add the airport to the map with a count of 1
//      else {
//        airportCount.put(airport, 1);
//      }
//    }
//  }

//  void draw()
//  {
//    background(0);
//    uniqueValues.addAll(set);
//    int barWidth = xAxisWidth/uniqueValues.size();
//    fill(255);
//    text(title, SCREENX/5, MARGIN-70);
//    fill(255);
//    line(MARGIN-10, SCREENY-MARGIN, xAxisWidth+50, SCREENY-MARGIN);
//    stroke(255);
//    line(MARGIN, SCREENY-MARGIN+10, MARGIN, 90);
//    stroke(255);
//    text(yAxisLabel, 0, SCREENY/2);
//    fill(255);
//    text(xAxisLabel, SCREENX/3, SCREENY-MARGIN+40);
//    fill(255);
//    for (int i=0; i<airportCount.size(); i++)
//    {
//      Widget newWidget = new Widget(MARGIN+(i*barWidth), SCREENY-(MARGIN+(2*airportCount.get(uniqueValues.get(i)))), 
//      barWidth, 2*airportCount.get(uniqueValues.get(i)),  "", theColour, stdFont, i+9);
//      barArray.add(newWidget);
//    }
//    for (int i=0; i<barArray.size(); i++)
//    {
//      barArray.get(i).draw();
//      int event = barArray.get(i).getEvent(mouseX, mouseY);
//      if (event == i+9)
//      {
//        fill(255);
//        text(uniqueValues.get(i) +":", SCREENX-300, SCREENY/2);
//        fill(255);
//        text(airportCount.get(uniqueValues.get(i)) +" Flights", SCREENX-300, (SCREENY/2)+50);
//      }
//    }
//  }
//}
