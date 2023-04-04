ArrayList<ArrayList<String>> subListsAirO = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<String>> subListsAirD = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<Integer>> subListsSchDept = new ArrayList<ArrayList<Integer>>();
ArrayList<ArrayList<Integer>> subListsAccDept = new ArrayList<ArrayList<Integer>>();
ArrayList<ArrayList<Integer>> subListsCancelled = new ArrayList<ArrayList<Integer>>();
ArrayList<ArrayList<Integer>> subListsDistance = new ArrayList<ArrayList<Integer>>();
ArrayList<ArrayList<String>> subListsStateO = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<String>> subListsStateD = new ArrayList<ArrayList<String>>();

class Flights
{

  TreeMap<Integer, Integer> flights;

  ArrayList<Integer> flightDates;
  ArrayList<String> airO;
  ArrayList<String> airD;
  ArrayList<Integer> schDept;
  ArrayList<Integer> accDept;
  ArrayList<Integer> cancelled;
  ArrayList<Integer> distance;
  ArrayList<String> stateO;
  ArrayList<String> stateD;
  
  int countOnTime=0;
  int countEarly=0;
  int countLate=0;
  int notCanCount = 0;
  int cancelledCount = 0;
  int airOCount = 0;
 

  //Table table=loadTable("flights_full (1).csv", "header");
  Table table=loadTable("flights2k.csv", "header");

  void initialiseData()
  {
    flightDates=new ArrayList<Integer>();
    airO=new ArrayList<String>();
    airD=new ArrayList<String>();
    schDept=new ArrayList<Integer>();
    accDept=new ArrayList<Integer>();
    cancelled= new ArrayList<Integer>();
    distance=new ArrayList<Integer>();
    stateO=new ArrayList<String>();
    stateD=new ArrayList<String>();

    for (int i=0; i<table.getRowCount(); i++)
    {
      TableRow row=table.getRow(i);
      
      String dateTime = row.getString("FL_DATE");
      int[] dateParts=int(dateTime.split("/"));
      int date=dateParts[1];
      flightDates.add(date);
      
      String airOInfo=row.getString("ORIGIN");
      airO.add(airOInfo);
      
      String dest=row.getString("DEST");
      airD.add(dest);
      
      int scheduledDept=row.getInt("CRS_DEP_TIME");
      schDept.add(scheduledDept);
      
      int actualDept=row.getInt("DEP_TIME");
      accDept.add(actualDept);
      
      int can=row.getInt("CANCELLED");
      cancelled.add(can);
      
      int dist=row.getInt("DISTANCE");
      distance.add(dist);
      
      String stateOInfo = row.getString("ORIGIN_STATE_ABR");
      stateO.add(stateOInfo);
      
      String stateDInfo = row.getString("DEST_STATE_ABR");
      stateD.add(stateDInfo);
    }

    flights=new TreeMap<Integer, Integer>();

    for (int date : flightDates)
    {
      if (flights.containsKey(date)) 
      {
        int count = flights.get(date);
        flights.put(date, count + 1);
      }
      else 
      {
        flights.put(date, 1);
      }
    }
    

    
    
    ArrayList<Integer> subListSize = new ArrayList<Integer>(flights.values());
    
    int startIndex=0;
    int endIndex;
    
    for(int i=0; i<subListSize.size(); i++)
    {
      endIndex=startIndex+subListSize.get(i);
      ArrayList<String> subListAO=new ArrayList<String>(airO.subList(startIndex, endIndex));
      ArrayList<String> subListAD=new ArrayList<String>(airD.subList(startIndex, endIndex));
      ArrayList<Integer> subListSchD=new ArrayList<Integer>(schDept.subList(startIndex, endIndex));
      ArrayList<Integer> subListAccDept=new ArrayList<Integer>(accDept.subList(startIndex, endIndex));
      ArrayList<Integer> subListDist=new ArrayList<Integer>(distance.subList(startIndex, endIndex));
      ArrayList<Integer> subListCan=new ArrayList<Integer>(cancelled.subList(startIndex, endIndex));
      ArrayList<String> subListSO=new ArrayList<String>(stateO.subList(startIndex, endIndex));
      ArrayList<String> subListSD=new ArrayList<String>(stateD.subList(startIndex, endIndex));
      
      subListsAirO.add(subListAO);
      subListsAirD.add(subListAD);
      subListsSchDept.add(subListSchD);
      subListsAccDept.add(subListAccDept);
      subListsDistance.add(subListDist);
      subListsCancelled.add(subListCan);
      subListsStateO.add(subListSO);
      subListsStateD.add(subListSD);
      startIndex=endIndex;
    }
  }
  
     void countAirp()
    {
      HashSet<String> airports = new HashSet<>();
      for (String airport : airO)
      {
        if (!airports.contains(airport))
        {
          airports.add(airport);
          airOCount++;
        }
        
      }
      println(airports);
      println(airOCount);
      
    }
  
  void countTime()
  {
    for (int i=0; i<airO.size(); i++)
    {
      int scheduledTime=currFlight.schDept.get(i);
      int actualTime=currFlight.accDept.get(i);
      if ((actualTime>scheduledTime-5)&&(actualTime<scheduledTime+5))
        countOnTime++;
      else if (scheduledTime<actualTime)
        countLate++;
      else if (scheduledTime>actualTime)
        countEarly++;
    }
  }


  void cancelledFlights()
  {
    for (int i=0; i<airO.size(); i++)
    {
      int isItCancelled=currFlight.cancelled.get(i);
      if (isItCancelled == 0)
      {
        notCanCount += 1;
      } 
      else if (isItCancelled == 1)
      {
        cancelledCount += 1;
      }
    }
  }

  
}
