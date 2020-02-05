<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="mybeans.FUploads" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="mybeans.NameType" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
else
{
String uid=session.getAttribute("userid").toString();
File file;
int maxFileSize = 500000 * 1024;
int maxMemSize = 500000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = "D:\\Sohams-JavaEE-August2019\\05-Mission-IDEs\\eclipse-jee-2019-06-R-win32-x86_64\\JavaEEProjects\\Shareit\\WebContent\\uploadedfiles\\";

// Verify the content type
String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) {
   DiskFileItemFactory factory = new DiskFileItemFactory();
   // maximum size that will be stored in memory
   factory.setSizeThreshold(maxMemSize);
   
   // Location to save data that is larger than maxMemSize.
   //factory.setRepository(new File("D:\\Softwares\\Sohams-JavaEE-August2019\\05-Mission-IDEs\\eclipse-jee-2019-06-R-win32-x86_64\\JavaEEProjects\\Shareit\\uploadedfiles\\"));

   // Create a new file upload handler
   ServletFileUpload upload = new ServletFileUpload(factory);
   
   // maximum file size to be uploaded.
   upload.setSizeMax( maxFileSize );
   
   try { 
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);

      // Process the uploaded file items
      Iterator i = fileItems.iterator();
      
      while ( i.hasNext () ) {
         FileItem fi = (FileItem)i.next();
         if ( !fi.isFormField () ) {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ) {
               file = new File( filePath + 
               fileName.substring( fileName.lastIndexOf("\\"))) ;
            } else {
               file = new File( filePath + 
               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            int a=fileName.lastIndexOf("\\");

            //out.println("<h3>File uploaded successfully</h3>");
            NameType nm = new NameType(a);
            nm.setPath(fileName);
            nm.process();
            String name=nm.getName();
            String type=nm.getType();
            
            
            DateTimeFormatter tf = DateTimeFormatter.ofPattern("HH:mm:ss");
			DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			LocalDateTime now = LocalDateTime.now();
            String udate=df.format(now);
            String utime=tf.format(now);
            FUploads fu = new FUploads();
			fu.setUid(uid);
			fu.setFname(name);
			fu.setUdate(udate);
			fu.setUtime(utime);
			fu.setFtype(type);
			fu.execute();
			String s=fu.getStatus();
			if(s.equals("success"))
			{
			%>
				<h3><b>File Uploaded Successfully!!!</b></h3>
			<%
			}
			else
			{
			%>
			<h3><b>Error in File Uploading!!!</b></h3>
			<%
			}
				}
			}
		} catch (Exception e) {
			%>
			
			<h2><b>File Already Exist!</b></h2>
			<%
		}
	} else {
		%>
		<h2><b>No file uploaded</b></h2>
		<%
	}

//Write JDBC code to insert entry of each users upload in the DB
}
%>
<br><br>
<a href="members.jsp">Members Page</a>

</body>
</html>