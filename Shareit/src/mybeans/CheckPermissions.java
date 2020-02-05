package mybeans;

import java.sql.*;

public class CheckPermissions {

	String uid,adduid,tquery;
	ResultSet rs;
	
	public ResultSet getRs() {
		return rs;
	}

	public CheckPermissions() {
		adduid="'";
		uid="";
		tquery="";
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	

	public ResultSet ckPermission()
	{
		Connection con;
		PreparedStatement pst1,pst2;
		Statement st;
		ResultSet rs1,rs2;
		String gp;
		
		try
		{
			DBConnector dbc=new DBConnector();
			con=dbc.getDbconnection();
			pst1=con.prepareStatement("select srno from permissionslog where userid=?;");
			pst1.setString(1, uid);
			rs1=pst1.executeQuery();
			rs1.next();
			String srno=rs1.getString("srno");
			
			pst2=con.prepareStatement("select givep,userid from permissionslog where userid not in(?);");
			pst2.setString(1, uid);
			rs2=pst2.executeQuery();
			
			while(rs2.next())
			{
				gp=rs2.getString("givep");
				if(gp.contains(srno))
				{
					adduid+=rs2.getString("userid")+"','";
				}
					
			}

			adduid+=uid+"'";
			String tquery="select users.usernm,users.userid,uploads.fname,uploads.udate,uploads.utime,uploads.ftype from users inner join uploads on users.userid=uploads.userid where uploads.userid in("+adduid+");";
			st=con.createStatement();
			rs=st.executeQuery(tquery);
			//con.close();
			
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return rs;
	}
}


