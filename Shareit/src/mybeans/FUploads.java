package mybeans;

import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FUploads {

	String uid,utime,udate,fname,ftype,status;

	public void setUid(String uid) {
		this.uid = uid;
	}

	public void setUtime(String utime) {
		this.utime = utime;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	public String getStatus() {
		return status;
	}

    public void execute()
    {
    	try {
    		Connection con;
    		PreparedStatement pst;
    		DBConnector db = new DBConnector();
    		con=db.getDbconnection();
    		pst=con.prepareStatement("insert into uploads values(?,?,?,?,?);");
    		pst.setString(1,uid);
    		pst.setString(2,fname);
    		pst.setString(3,udate);
    		pst.setString(4,utime);
    		pst.setString(5,ftype);
    	
    		int c=pst.executeUpdate();
    		
    		if(c>0)
    			status="success";
    		else
    			status="failure";
    	}
    	catch(Exception e)
    	{
    		System.out.println("File Already Exist");
    	}

	}
}

