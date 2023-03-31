int jan1Count=0;
int jan2Count=0;
int jan3Count=0;
int jan4Count=0;
int jan5Count=0;
int jan6Count=0;
int jan7Count=0;
int jan8Count=0;
int jan9Count=0;
int jan10Count=0;
int jan11Count=0;
int jan12Count=0;
int jan13Count=0;
int jan14Count=0;
int jan15Count=0;
int jan16Count=0;
int jan17Count=0;
int jan18Count=0;
int jan19Count=0;
int jan20Count=0;
int jan21Count=0;
int jan22Count=0;
int jan23Count=0;
int jan24Count=0;
int jan25Count=0;
int jan26Count=0;
int jan27Count=0;
int jan28Count=0;
int jan29Count=0;
int jan30Count=0;
int jan31Count=0;


class Flights
{

  ArrayList<String> fullDataSet;

  ArrayList<String> flightDates;
  ArrayList<Integer> jan1;
  ArrayList<String> carrier;

  ArrayList carrierNum;
  ArrayList<String> origin;
  ArrayList<String> originCity;
  ArrayList<String> originAbr;
  ArrayList<Integer> areaCode;
  ArrayList<String> destination;
  ArrayList<String> destCity;
  ArrayList<String> destAbr;
  ArrayList<String> destAreaCode;
  ArrayList<Integer> schDept;
  ArrayList<Integer> accDept;
  ArrayList<Integer> schArr;
  ArrayList<Integer> accArr;
  ArrayList<Integer> cancelled;
  ArrayList<Integer> diverted;
  ArrayList<Integer> distance;
  int countOnTime=0;
  int countEarly=0;
  int countLate=0;
  int notCanCount = 0;
  int cancelledCount = 0;

  Table table=loadTable("flights2k.csv", "header");

  void fullData()
  {
    fullDataSet=new ArrayList<String>();
    for (TableRow row: table.rows())
    {
      for (int x=0; x<row.getColumnCount(); x++)
      {
        fullDataSet.add(row.getString(x));
      }
    }
  }
  void initialiseData()
  {
    flightDates=new ArrayList<String>();
    jan1=new ArrayList<Integer>();
    carrier=new ArrayList<String>();
    carrierNum=new ArrayList();
    origin=new ArrayList<String>();
    originCity=new ArrayList<String>();
    originAbr=new ArrayList<String>();
    areaCode=new ArrayList<Integer>();
    destination=new ArrayList<String>();
    destCity=new ArrayList<String>();
    destAbr=new ArrayList<String>();
    destAreaCode=new ArrayList<String>();
    schDept=new ArrayList<Integer>();
    accDept=new ArrayList<Integer>();
    schArr=new ArrayList<Integer>();
    accArr=new ArrayList<Integer>();
    cancelled= new ArrayList<Integer>();
    diverted=new ArrayList<Integer>();
    distance=new ArrayList<Integer>();

    for (int i=0; i<table.getRowCount(); i++)
    {
      TableRow row=table.getRow(i);
      String date = row.getString("FL_DATE");
      int[] dateParts=int(date.split("/"));
      int day=dateParts[1];
      switch(day)
      {
      case 1:
        jan1Count++;
        break;
      case 2:
        jan2Count++;
        break;
      case 3:
        jan3Count++;
        break;
      case 4:
        jan4Count++;
        break;
      case 5:
        jan5Count++;
        break;
      case 6:
        jan6Count++;
        break;
      case 7:
        jan7Count++;
        break;
      case 8:
        jan8Count++;
        break;
      case 9:
        jan9Count++;
        break;
      case 10:
        jan10Count++;
        break;
      case 11:
        jan11Count++;
        break;
      case 12:
        jan12Count++;
        break;
      case 13:
        jan13Count++;
        break;
      case 14:
        jan14Count++;
        break;
      case 15:
        jan15Count++;
        break;
      case 16:
        jan16Count++;
        break;
      case 17:
        jan17Count++;
        break;
      case 18:
        jan18Count++;
        break;
      case 19:
        jan19Count++;
        break;
      case 20:
        jan20Count++;
        break;
      case 21:
        jan21Count++;
        break;
      case 22:
        jan22Count++;
        break;
      case 23:
        jan23Count++;
        break;
      case 24:
        jan24Count++;
        break;
      case 25:
        jan25Count++;
        break;
      case 26:
        jan26Count++;
        break;
      case 27:
        jan27Count++;
        break;
      case 28:
        jan28Count++;
        break;
      case 29:
        jan29Count++;
        break;
      case 30:
        jan30Count++;
        break;
      case 31:
        jan31Count++;
        break;
      }
      //println(day);
      flightDates.add(date);
      //println(date);
      String carrierInfo = row.getString("MKT_CARRIER");
      carrier.add(carrierInfo);
      int carrierInfoNum=row.getInt("MKT_CARRIER_FL_NUM");
      carrierNum.add(carrierInfoNum);
      String originInfo=row.getString("ORIGIN");
      origin.add(originInfo);
      String originCityInfo=row.getString("ORIGIN_CITY_NAME");
      originCity.add(originCityInfo);
      String originAbrInfo=row.getString("ORIGIN_STATE_ABR");
      originAbr.add(originAbrInfo);
      int codeArea=row.getInt("ORIGIN_WAC");
      areaCode.add(codeArea);
      String dest=row.getString("DEST");
      destination.add(dest);
      String destCityInfo=row.getString("DEST_CITY_NAME");
      destCity.add(destCityInfo);
      String destinationAbr=row.getString("DEST_STATE_ABR");
      destAbr.add(destinationAbr);
      int scheduledDept=row.getInt("CRS_DEP_TIME");
      schDept.add(scheduledDept);
      int actualDept=row.getInt("DEP_TIME");
      accDept.add(actualDept);
      int schArrInfo=row.getInt("CRS_ARR_TIME");
      schArr.add(schArrInfo);
      int accArrInfo=row.getInt("ARR_TIME");
      accArr.add(accArrInfo);
      int can=row.getInt("CANCELLED");
      cancelled.add(can);
      int div=row.getInt("DIVERTED");
      diverted.add(div);
      int dist=row.getInt("DISTANCE");
      distance.add(dist);
    }
  }

  void countTime(int x, int dateCount)
  {
    for (int i=x; i<dateCount; i++)
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
    println(countOnTime);
    println(countLate);
    println(countEarly);
  }


  void cancelledFlights()
  {

    for (int i=0; i<jan1Count; i++)
    {

      int isItCancelled=currFlight.cancelled.get(i);
      if (isItCancelled == 0)
      {
        notCanCount += 1;
      } else if (isItCancelled == 1)
      {
        cancelledCount += 1;
      }
    }
    println(notCanCount);
    println(cancelledCount);
  }
}
