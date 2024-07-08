package main.java.web.main.control;

import web.main.action.Action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

/**
 * Servlet implementation class Controller
 */
@WebServlet(
		urlPatterns = { "/Controller" },
		initParams = {
				@WebInitParam(name = "myParam", value = "/WEB-INF/action.properties")
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//action.properties파일의 내용들 (클래스 경로)들을 가져와서
	// 객체로 생성한 후 생성된 객체의 주소를 저장할 Map구조 선언
	private Map<String, Action> actionMap;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		actionMap = new HashMap<>();
	}

	public void init() throws ServletException {
		// 생성자 다음으로 딱! 한번 수행하는 메소드
		// 첫 요청자에 의해 단 한번만 수행하는 곳이다.

		// 현재 서블릿이 생성될 때 전달되는 초기 파라미터를 가져온다.
		// props_path = "/WEB-INF/action.properties" 들어옴
		String props_path = getInitParameter("myParam");

		// 받은 action.properties파일의 경로를 절대경로화 시킨다.
		// 절대경로를 얻기 위해서는 jsp에서 application이라는 내장 객체와
		// 같은 객체가 필요하다. (ServletContext)
		ServletContext application = getServletContext();

		String realPath = application.getRealPath(props_path);

		//절대경로화 시킨 이유는
		// 해당 파일의 내용(클래스 경로)을 스트림을 이용하여
		// 읽어와서 Properties객체에 담기 위함이다.
		Properties prop = new Properties();

		//Properties의 load함수를 이용하여 내용들을 읽기한다 이때
		// 필요한 객체가 InputSteram이다.
		FileInputStream fis = null;
		try {
			//action.properties파일과 연결되는 스트림 준비
			fis = new FileInputStream(realPath);

			//=을 중심으로 앞에 있는 애가 key 뒤에 있는 애가 value로 알아서 저장이된다.
			prop.load(fis); // action.properties파일의 내용들을
			// 읽어서 비어있던 Properties객체에 키와 값을 쌍으로 저장한다.
			// 예) "emp": "test.action.EmpAction"
		} catch (Exception e) {
			e.printStackTrace();
		}
		//여기까지는 단순히 action.properties 파일의 내용을 
		// 키와 값으로 구분하여 Properties객체로 인식화 했다.
		// ---------------------------------------------------------

		//이제는 Properties객체에 있는 값들을 객체로 생성하여
		// actionMap에 저장해야한다.
		//Iterator타입의 반복자 받을수있음 key만 넘어옴 ex) emp
		Iterator<Object> it = prop.keySet().iterator();

		//키들을 모두 얻었으니 키에 연결된 클래스경로들을 하나씩 
		// 가져와서 객체를 생성한 후 actionMap에 저장한다.
		while( it.hasNext()) {//다음칸에 객체가 있냐? 라는 함수
			// 먼저 키를 하나 얻어내어 문자열로 변환
			String key = (String)it.next();
			//		"emp"

			//위에서 얻어낸 키와 연결된 값(value:클래스 경로)을 얻어낸다.
			//	"test.action.EmpAction" value 전체 경로 얻어옴
			String value = prop.getProperty(key);

			try {
				Object obj = Class.forName(value).newInstance();
				//쉽게 말해서 Class를 통해 정확한 클래스의 경로가 있다면
				// 위와 같이 객체를 생성할 수 있다.

				//생성된 객체를 Action으로 형 변환하여
				// actionMap 구조에 저장한다
				actionMap.put(key, (Action)obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//while의 끝

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 한글처리
		request.setCharacterEncoding("utf-8");

		String type = request.getParameter("type");
		if( type == null) {
			type = "index";
		}

		Action action = actionMap.get(type);

		String viewPath = action.execute(request, response);

		if( viewPath != null) {
			//forward로 이동~~~!
			RequestDispatcher disp = request.getRequestDispatcher(viewPath);
			disp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}