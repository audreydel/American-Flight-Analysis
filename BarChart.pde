class BarChart
{
  Flights currFlight;

  int[] statesCount = new int[50];
  ArrayList<String> data;
  
  BarChart(ArrayList<String> data)
  {
    this.data = data;
  }

  void countTState()
  {

    for (int i = 0; i < data.size(); i++)
    {
      String destSt = data.get(i);

      switch (destSt)
      {
      case "AL" :
        statesCount[0]++;
        break;
      case "AK" :
        statesCount[1]++;
        break;

      case "AZ" :
        statesCount[2]++;
        break;

      case "AR" :
        statesCount[3]++;
        break;

      case "CA" :
        statesCount[4]++;
        break;

      case "CO" :
        statesCount[5]++;
        break;

      case "CT" :
        statesCount[6]++;
        break;

      case "DE" :
        statesCount[7]++;
        break;

      case "FL" :
        statesCount[8]++;
        break;

      case "GA" :
        statesCount[9]++;
        break;

      case "HI" :
        statesCount[10]++;
        break;

      case "ID" :
        statesCount[11]++;
        break;

      case "IL" :
        statesCount[12]++;
        break;

      case "IN" :
        statesCount[13]++;
        break;

      case "IA" :
        statesCount[14]++;
        break;

      case "KS" :
        statesCount[15]++;
        break;

      case "KY" :
        statesCount[16]++;
        break;

      case "LA" :
        statesCount[17]++;
        break;

      case "ME" :
        statesCount[18]++;
        break;

      case "MD" :
        statesCount[19]++;
        break;

      case "MA" :
        statesCount[20]++;
        break;

      case "MI" :
        statesCount[21]++;
        break;

      case "MN" :
        statesCount[22]++;
        break;

      case "MS" :
        statesCount[23]++;
        break;

      case "MO" :
        statesCount[24]++;
        break;

      case "MT" :
        statesCount[25]++;
        break;

      case "NE" :
        statesCount[26]++;
        break;

      case "NV" :
        statesCount[27]++;
        break;

      case "NH" :
        statesCount[28]++;
        break;

      case "NJ" :
        statesCount[29]++;
        break;

      case "NM" :
        statesCount[30]++;
        break;

      case "NY" :
        statesCount[31]++;
        break;

      case "NC" :
        statesCount[32]++;
        break;

      case "ND" :
        statesCount[33]++;
        break;

      case "OH" :
        statesCount[34]++;
        break;

      case "OK" :
        statesCount[35]++;
        break;

      case "OR" :
        statesCount[36]++;
        break;

      case "PA" :
        statesCount[37]++;
        break;

      case "RI" :
        statesCount[38]++;
        break;

      case "SC" :
        statesCount[39]++;
        break;

      case "SD" :
        statesCount[40]++;
        break;

      case "TN" :
        statesCount[41]++;
        break;

      case "TX" :
        statesCount[42]++;
        break;

      case "UT" :
        statesCount[43]++;
        break;

      case "VT" :
        statesCount[44]++;
        break;

      case "VA" :
        statesCount[45]++;
        break;

      case "WA" :
        statesCount[46]++;
        break;

      case "WV" :
        statesCount[47]++;
        break;

      case "WI" :
        statesCount[48]++;
        break;

      case "WY" :
        statesCount[49]++;
        break;

      default:
        break;
      }
    }
  }

  void draw()
  {
    countTState();
    stroke(0);
    strokeWeight(2);
    line(60, 180, 60, 850); // y axis
    line(60, 850, 1340, 850); // x axis
    fill(0);
    textFont(italicFont);
    textSize(15.6);
    text("AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY", 60, 870);

    fill(0);
    int maxHeight = max(statesCount)/3;
    for (int i = 0; i < statesCount.length; i++)
    {
      fill(colsPC[i% colsPC.length]);
      rect(60+i*26, 850-(statesCount[i]*200/maxHeight), 25, 200*statesCount[i]/maxHeight); // adjust the y-coordinate for each state
    }
  }
}
