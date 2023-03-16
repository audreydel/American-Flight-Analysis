
void setup()
{

  String[] flights2k = loadStrings("flights2k(1).csv");
  println("Flights 2k:");
  
    for ( String Line2k : flights2k)
    {
      if (Line2k != null) 
      {
        println(Line2k);
      }
      else 
      {
        println("no file found");
      }
    }
    
    
    
   //String[] flights10k = loadStrings("flights10k(1).csv");
   //println("Flights 10K");
   //for ( String Line10k : flights10k)
   // {
   //   if (Line10k != null) 
   //   {
       
   //     println(Line10k);
   //   }
   //   else 
   //   {
   //     println("no file found");
   //   }
   // }
   
   //String[] flights100k = loadStrings("flights100k(1).csv");
   //   println("Flights 100k:"); 

   //for ( String Line100k : flights100k)
   // {
   //   if (Line100k != null) 
   //   {
   //     println(Line100k);
   //   }
   //   else 
   //   {
   //     println("no file found");
   //   }
   // }
   
   //String[] flightsFull = loadStrings("flights_full (1).csv");
   //println("Flights full:");
   //for ( String LineFull : flightsFull)
   // {
   //   if (LineFull != null) 
   //   {
   //     println(LineFull);
   //   }
   //   else 
   //   {
   //     println("no file found");
   //   }
   // }
    
    
  
  
}





  
