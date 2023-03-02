package metier;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Tracking {
	
	public String makeTracking(int num_doss)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd"); 
		LocalDateTime now = LocalDateTime.now();  
		String date = dtf.format(now);
		
		int count = 0, num = num_doss;
        while(num != 0)
        {
            // num = num/10
            num /= 10;
            ++count;
        }
        
        int zeros = 6 - count;
        String tracking = "TR" + date;
        for(int i = 0 ; i < zeros ; i++)
        {
        	tracking = tracking + "0";
        }
        
        tracking = tracking + num_doss;
		
		return tracking;
	}

}
