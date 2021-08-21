//Updated 2021.08.09 오전 10:20

package calendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Calendar {

	public boolean small(String d1, String d2) {
		try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
	        Date date1 = dateFormat.parse(d1);
	        Date date2 = dateFormat.parse(d2);
	        if(date1.before(date2)){
	            return true;
	        }
	    } catch (ParseException ex) {
	    }
		return false;
	}
	
	public boolean big(String d1, String d2) {
		try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
	        Date date1 = dateFormat.parse(d1);
	        Date date2 = dateFormat.parse(d2);
	        if(date1.after(date2)){
	            return true;
	        }
	    } catch (ParseException ex) {
	    }
		return false;
	}
	
	public boolean same(String d1, String d2) {
		try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
	        Date date1 = dateFormat.parse(d1);
	        Date date2 = dateFormat.parse(d2);
	        if(date1.equals(date2)){
	            return true;
	        }
	    } catch (ParseException ex) {
	    }
		return false;
	}
	
	public int totalDay(String d1, String d2) {
		int result = 0;
		try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
	        Date date1 = dateFormat.parse(d1);
	        Date date2 = dateFormat.parse(d2);
	        long calDate = (date2.getTime() - date1.getTime())/(24*60*60*1000);
	        result = (int)(Math.abs(calDate));
	    } catch (ParseException ex) {
	    }
		return result;
	}
}
