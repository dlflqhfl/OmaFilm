package web.main.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.NoticeVO;

public class AdminAddEventAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String n_time = dateFormat.format(new Date());
        //여기서 값을 받아서 넣을 계획입니다

		 String viewPath = null; //경로 초기화
		 String enc_type = request.getContentType();
		 if(enc_type == null) {
				viewPath = "/jsp/admin/adminAddEvent.jsp";
			}
		 else if(enc_type.startsWith("multipart")) {
			 

        //만약에 해당 값이 하나도 없다면 그냥 바로 넘기기
        int n_status=0;
        
        try {
        	ServletContext application = request.getServletContext();
            String realPath = application.getRealPath("/img");//절대경로 생성
        	
        	//첨부파일과 다른 파라미터들을 받기 위해
			//MultipartRequest객체를 생성
        	MultipartRequest mr = new MultipartRequest(request, realPath, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

			
			//이때 이미 첨부파일은 upload라는 폴더에 저장된 상태다.
			File f = mr.getFile("file");
			File f1= mr.getFile("file1");
			String fname = null;
			String oname = null;
			String f1name=null;
			String o1name=null;
			String title = mr.getParameter("title");
			System.out.println(title+"값?");
	        String content = mr.getParameter("content");
	        String eventType = (String) mr.getParameter("eventType");	//Attribute가 아니라 Parameter다....
	       
	        
	        if (title == null || title.isEmpty() ||
		            content == null || content.isEmpty()) {
	        		System.out.println("값 없음");
		            return "jsp/admin/adminAddEvent.jsp";
		        }
			//만약! 파일첨부하지 않았다면 f에는 null이다.
			if(f != null) {
				fname = f.getName();// 현재 저장된 파일명
				
				//원래 파일명
				oname = mr.getOriginalFileName("file");
			}
			if(f1 != null) {
				f1name=f1.getName();
				o1name=mr.getOriginalFileName("file1");
			}
			
			NoticeVO notice = new NoticeVO();
	        notice.setN_title(title);
	        notice.setN_content(content);
	        notice.setN_time(n_time);
	        notice.setN_status(n_status);
	        notice.setNt_ct_code(eventType);
	        notice.setN_img(oname);
	        notice.setN_banner(o1name);
	        System.out.println(eventType+"테스트");
	        System.out.println("=====");
	        System.out.println(notice.getNt_ct_code());
	        AdminDAO dao = new AdminDAO();
	        dao.insertEvent(notice);
	        System.out.println("이벤트 등록성공");
	        viewPath= "/jsp/admin/adminAddEvent.jsp";
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		}
        
        
        return viewPath;
	}

}
