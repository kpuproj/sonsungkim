<%@ page contentType="application/download;charset=KSC5601" %>
<%@ page import="java.io.*" %>
<%
//파일 이름을 전달 받는다.
 String fileName = request.getParameter("fileName");
//다운로드창 설정
 response.setContentType("application/download");

 //아래처럼 attachment 를 사용하면 브라우저는 무조건 다운로드 창을 띄우고 파일명을 보여준다.
 response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");

 //파일을 outputstream으로 받는다.
 //outputstream은 파일을 바이트 단위로 쪼개서 보내는 방식이다.
 ServletOutputStream sos = null;
 try{
  sos = response.getOutputStream();
 }catch(Exception e){e.printStackTrace();}

 FileInputStream fio = null;
 byte[] buf = new byte[1024];

 //서버에 3d_files 폴더에서 전달 받은 파일을 지정한다.
 //바이트 단위로 전송을 준비하는 과정이다.
 fio = new FileInputStream("C:/Tomcat5.5/webapps/ROOT/webContent/3d_files"+fileName);
 int n = 0;

 //반복문을 사용하여 서버에서 오는 바이트가 안올때까지 계속해서 바이트 데이털 받는다.
 while((n=fio.read(buf, 0, buf.length))!=-1) {
  sos.write(buf, 0, n);
  sos.flush();
 }
 sos.close();
%>