import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;
import java.util.Collections;
import java.util.Set;
import java.util.HashSet;

class Histogram{
  
  void drawHistogram(ArrayList<Integer> dataValues){
    
    float barWidth=width/dataValues.size();
    float barHeight=height/ Collections.max(dataValues);
    
    for(int i=0; i<dataValues.size(); i++)
    {
      float barValue=dataValues.get(i);
      float barHeights=map(barValue, 0, Collections.max(dataValues), 0, height);
    
      fill((i*30)%255,(i*50)%255,(i*80)%255);
      
      rect(i*barWidth, height-barHeights, barWidth, barHeight);
    }
  }
}
