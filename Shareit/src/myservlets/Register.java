package myservlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id,ps,nm,gn,mo,em,sq,an,srno;
		int ag,c1,c2,c3,c4;
		Connection con;
		PreparedStatement pst,pst1,pst2,pst3,pst4;
		ResultSet rs;
		PrintWriter out=response.getWriter();
		try
		{
		id=request.getParameter("uid");
		ps=request.getParameter("psw");
		nm=request.getParameter("unm");
		ag=Integer.parseInt(request.getParameter("age"));
		gn=request.getParameter("gender");
		mo=request.getParameter("mob");
		em=request.getParameter("email");
		sq=request.getParameter("ques");
		an=request.getParameter("ans");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shareit?user=root&password=volkswagen");
		//New User
		pst=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,default,?,?);");
		pst.setString(1, id);
		pst.setString(2, ps);
		pst.setString(3, nm);
		pst.setInt(4, ag);
		pst.setString(5, gn);
		pst.setString(6, mo);
		pst.setString(7, em);
		pst.setString(8, sq);
		pst.setString(9, an);
		
		//Members Table
		c1=pst.executeUpdate();
		pst1=con.prepareStatement("insert into members values(?,default);");
		pst1.setString(1, id);
		c2=pst1.executeUpdate();
		
		//Loginlog Table
		pst2=con.prepareStatement("insert into loginlog values(?,NULL,NULL,0);");
		pst2.setString(1, id);
		c3=pst2.executeUpdate();
		
		//Sr no.
		pst3=con.prepareStatement("select count(*) from members;");
		rs=pst3.executeQuery();
		rs.next();
		int cnt=rs.getInt("count(*)");
		srno=Integer.toString(cnt);
		
		//Permissionslog Table
		pst4=con.prepareStatement("insert into permissionslog values(?,?,'|');");
		pst4.setString(1, srno);
		pst4.setString(2,id);
		c4=pst4.executeUpdate();
		
		con.close();
		if(c1>0 && c2>0 && c3>0 && c4>0)
		response.sendRedirect("RegSuccess.jsp");
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

}







