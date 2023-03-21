
  ArrayList<String> flightDates;
  ArrayList<String> carrier;
  ArrayList carrierNum;
  ArrayList<String> origin;
  ArrayList<String> originCity;
  ArrayList<String> destination;

  void initialiseData() 
  {
    Table table=loadTable("flights2k.csv", "header");
    flightDates=new ArrayList<String>();
    carrier=new ArrayList<String>();
    carrierNum=new ArrayList();
    origin=new ArrayList<String>();
    originCity=new ArrayList<String>();
    destination=new ArrayList<String>();
    
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
      String dest=row.getString("DEST");
      destination.add(dest);
    }
  }