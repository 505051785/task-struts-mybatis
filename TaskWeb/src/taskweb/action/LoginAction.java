package taskweb.action;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import service.TaskService;
import model.LoginVO;
import model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	private LoginVO loginVO;

	public LoginVO getLoginVO() {
		return loginVO;
	}

	public void setLoginVO(LoginVO loginVO) {
		this.loginVO = loginVO;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 2524622577223595731L;

	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		User loginuser = (User) session.get("taskuser");
		if (loginuser != null) {
			return SUCCESS;
		}
		String usercode="";
		String password="";
		Cookie curUserCodeCookie=getCookie(request,"userCode");
		Cookie curPasswordCookie=getCookie(request,"password");
		if(curUserCodeCookie!=null){
			usercode=curUserCodeCookie.getValue();
			password=curPasswordCookie.getValue();
		}else{
			 usercode = request.getParameter("usercode");
			 password = request.getParameter("password");
		}
		TaskService taskService = new TaskService();
		if (StringUtils.isBlank(usercode) || StringUtils.isBlank(password)) {
			return INPUT;
		}
		User user = taskService.Login(usercode);
		if (user.getUserCode() != null && user.getPassword().equals(password)) {
			session.put("taskuser", user);
			Cookie userCodecookie = new Cookie("userCode", user.getUserCode());
			Cookie passwordcookie = new Cookie("password", user.getPassword());
			response.addCookie(userCodecookie);
			response.addCookie(passwordcookie);
			return SUCCESS;
		} else {
			loginVO = new LoginVO();
			loginVO.setError("用户名或密码错误！");
			request.setAttribute("loginVO", loginVO);
			return INPUT;
		}
	}

	private Cookie getCookie(HttpServletRequest request, String cookieName) {
		Cookie result = null;
		Cookie[] cookies = request.getCookies();
		// cookies不为空，则清除
		if (cookies != null) {
			for (Cookie cookieTemp : cookies) {
				String tempcookieName = cookieTemp.getName();
				// 查找身份串
				if (tempcookieName.equals(cookieName)) {
					result = cookieTemp;
					break;
				}
			}
		}
		return result;
	}

}
