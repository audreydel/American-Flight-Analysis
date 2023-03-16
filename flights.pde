
Table table;

table=loadTable("flightsList.csv", "header");
for(TableRow row : table.rows()){
  String dates=row.getString("FL_DATE");
  String origin=row.getString("ORIGIN");
  String originCity=row.getString("ORIGIN_CITY_NAME");
  String destCity=row.getString("DEST_CITY_NAME");
  println(origin);
}
println(table.getRowCount());
  
