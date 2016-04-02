package taskweb.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.AddTaskVO;
import model.TaskType;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import service.TaskService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import controller.cenum.TaskTypeEnum;

public class DetailTaskAction extends ActionSupport {
	
	private AddTaskVO addTaskVO ;

	/**
	 * 
	 */
	private static final long serialVersionUID = -3637230051143753428L;
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); 
		TaskService taskService = new TaskService();
		String taskid = request.getParameter("id");
		if (StringUtils.isBlank(taskid)) {
			return "addtask";
		}
		AddTaskVO addTaskVO = taskService.DetailTask(taskid);
		List<TaskType> typelist = new ArrayList<TaskType>();
		for (TaskTypeEnum item : TaskTypeEnum.values()) {
			TaskType tasktype = new TaskType();
			tasktype.setCode(item.getCode());
			tasktype.setName(item.getName());
			typelist.add(tasktype);
		}
		addTaskVO.setTypelist(typelist);
		request.setAttribute("addTaskVO", addTaskVO);
		return SUCCESS;
	}

	public AddTaskVO getAddTaskVO() {
		return addTaskVO;
	}

	public void setAddTaskVO(AddTaskVO addTaskVO) {
		this.addTaskVO = addTaskVO;
	}

}
