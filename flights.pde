class Flights {
  ArrayList<String> flightDates;
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
  void initialiseData() {
    Table table=loadTable("flights2k.csv", "header");
    flightDates=new ArrayList<String>();
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
      flightDates.add(date);
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
  void countTime() {
    for (int i=0; i<currFlight.schDept.size(); i++)
    {
      int scheduledTime=currFlight.schDept.get(i);
      int actualTime=currFlight.accDept.get(i);
      if (scheduledTime==actualTime)
        countOnTime++;
      if (scheduledTime<actualTime)
        countLate++;
      if (scheduledTime>actualTime)
        countEarly++;
    }
    println(countOnTime);
    println(countLate);
    println(countEarly);
    
  }
}
