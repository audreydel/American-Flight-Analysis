
//Table table;

//table=loadTable("flightsList.csv", "header");
//for(TableRow row : table.rows()){
//  String dates=row.getString("FL_DATE");
//  String origin=row.getString("ORIGIN");
//  String originCity=row.getString("ORIGIN_CITY_NAME");
//  String destCity=row.getString("DEST_CITY_NAME");
//  println(origin);
//}
//println(table.getRowCount());
  
  Table table;

void setup() {
  table = loadTable("flights2k(1).csv", "header");
  
  println(table.getRowCount() + " total columns in table");
  
  for (TableRow row : table.rows()) {
    String FL_DATE = row.getString("FL_DATE");
    String MKT_CARRIER = row.getString("MKT_CARRIER");
    int MKT_CARRIER_FL_NUM = row.getInt("MKT_CARRIER_FL_NUM");
    String ORIGIN_CITY_NAME = row.getString("ORIGIN_CITY_NAME");
    String ORIGIN_STATE_ABR = row.getString("ORIGIN_STATE_ABR");
    int ORIGIN_WAC = row.getInt("ORIGIN_WAC");
    String DEST = row.getString("DEST");
    String DEST_CITY_NAME = row.getString("DEST_CITY_NAME");
    String DEST_STATE_ABR = row.getString("DEST_STATE_ABR");
    int DEST_WAC = row.getInt("DEST_WAC");
    int CRS_DEP_TIME = row.getInt("CRS_DEP_TIME");
    int DEP_TIME = row.getInt("DEP_TIME");
    int CRS_ARR_TIME = row.getInt("CRS_ARR_TIME");
    int ARR_TIME = row.getInt("ARR_TIME");
    int CANCELLED = row.getInt("CANCELLED");
    int DIVERTED = row.getInt("DIVERTED");
    int DISTANCE = row.getInt("DISTANCE");
    
    println("The distance is " + DISTANCE);
    
  }
}
