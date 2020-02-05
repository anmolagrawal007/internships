package myservlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import mybeans.DBConnector;
import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import javax.servlet.ServletContext;
/**
 * Servlet implementation class Download
 */
@WebServlet("/Download")
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession ses=request.getSession(true);	
		
		if(ses.getAttribute("userid")==null)
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
		String dbyid=String.valueOf(ses.getAttribute("userid"));
		
		Connection con;
		PreparedStatement pst1,pst2;
		ResultSet rs;
		String fnm = request.getParameter("fnm");
		
		
		try {
        
			
		  // reads input file from an absolute path
        String filePath = "D:/Sohams-JavaEE-August2019/05-Mission-IDEs/eclipse-jee-2019-06-R-win32-x86_64/JavaEEProjects/Shareit/WebContent/uploadedfiles/"+fnm;
        File downloadFile = new File(filePath);
        FileInputStream inStream = new FileInputStream(downloadFile);
         
        // if you want to use a relative path to context root:
        String relativePath = getServletContext().getRealPath("");
        System.out.println("relativePath = " + relativePath);
         
        // obtains ServletContext
        ServletContext context = getServletContext();
         
        // gets MIME type of the file
        String mimeType = context.getMimeType(filePath);
        if (mimeType == null) {        
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        System.out.println("MIME type: " + mimeType);
         
        // modifies response
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());
         
        // forces download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
        response.setHeader(headerKey, headerValue);
         
        // obtains response's output stream
        OutputStream outStream = response.getOutputStream();
         
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
         
        while ((bytesRead = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
         
        inStream.close();
        outStream.close(); 
        
		DBConnector db = new DBConnector();
		con=db.getDbconnection();
		String uid;
		pst1=con.prepareStatement("select userid,ftype from uploads where fname=?;");
		pst1.setString(1, fnm);
		rs=pst1.executeQuery();
		rs.next();
		
		String ubyid=rs.getString("userid");
		String ftype=rs.getString("ftype");
		
		//HttpSession ses=request.getSession(true);	
		//String dbyid=String.valueOf(ses.getAttribute("userid"));
		
        DateTimeFormatter tf = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		pst2=con.prepareStatement("insert into downloadlog values(?,?,?,?,?,?); ");
		pst2.setString(1, fnm);
		pst2.setString(2, ubyid);
		pst2.setString(3, dbyid);
		pst2.setString(4, df.format(now));
		pst2.setString(5, tf.format(now));
		pst2.setString(6, ftype);
		int p=pst2.executeUpdate();
		PrintWriter out=response.getWriter();
		if(p<=0)
			out.println("Error in Inserting Records in DownloadLog!!!");
		}
		catch(Exception e)
		{
			PrintWriter out=response.getWriter();
			out.println(e);
		}
	}
	}

}
