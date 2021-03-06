<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.EditTaskVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="script/twitter-signup.css" type="text/css">
<link rel="stylesheet" href="script/main.css" type="text/css">
<link rel="stylesheet" href="script/css/jquery-ui.css" type="text/css">
<script src="script/js/jquery.js"></script>
<script src="script/js/jquery-ui.min.js"></script>
<%
EditTaskVO editTaskVO = (EditTaskVO) request.getAttribute("editTaskVO");
%>
</head>
<body>
	<div id="container">
		<br>
		<div class="label">Task</div>
		<br> <br>
		<div id="twitter-outer">
			<div id="twitter-logo">
				<img src="images/task_logo_header.png" alt="Task" height="36"
					width="155">
				<div class="content-bubble-arrow"></div>
			</div>

			<div id="twitter">
				<form action="modifytask" method="post">
					<div id='title' class='outerDiv'>
						<label for="title">任务标题:</label> <input type="text" name="title" value="<%=editTaskVO.getTask().getTitle() %>" />
						<input type="hidden" name="id" value="<%=editTaskVO.getTask().getId()%>" />
					</div>
					<div class='clearfix'></div>
					<div id='description' class='outerDiv'>
						<label for="description">任务描述:</label>
						<!-- <input type="text" name="description" required  />  -->
						<textarea name="description" rows="3" cols="20"> <%=editTaskVO.getTask().getDescription() %></textarea>
					</div>
					<div class='clearfix'></div>

					<div id='executor' class='outerDiv'>
						<label for="executor">执行人员:</label>
						<!-- 	<input type="text" name="executor" required />  -->
						<select
							style="position: relative; left: -2px; top: -2px; font-size: 12px; width: 183px; line-height: 14px; bo rder: 0px; color: #909993; padding: 8px;"
							name="executor">
							<%
								for (int i = 0; i < editTaskVO.getUsers().size(); i++) {
							%>
							<option value="<%=editTaskVO.getUsers().get(i).getUserCode()%>"><%=editTaskVO.getUsers().get(i).getUserCode()%>_<%=editTaskVO.getUsers().get(i).getUserName()%>
							</option>
							<%
								}
							%>
						</select>
					</div>
						<div id='executor' class='outerDiv'>
						<label for="executor">任务类型:</label>
						<!-- 	<input type="text" name="executor" required />  -->
						<select style="position:relative;left:-2px;top:-2px;font-size:12px;width:183px;line-height:14px;bo rder:0px;color:#909993;padding:8px;"  name="type" required>
						<%for(int i=0;i<editTaskVO.getTypelist().size();i++){ %>		
								<option value="<%=editTaskVO.getTypelist().get(i).getCode()%>"><%=editTaskVO.getTypelist().get(i).getName()%> </option>
						<%} %>
							</select>
					</div>
					<div class='clearfix'></div>
					<div id='executor' class='outerDiv'>
						<label for="executor">任务状态:</label>
						<!-- 	<input type="text" name="executor" required />  -->
						<select style="position:relative;left:-2px;top:-2px;font-size:12px;width:183px;line-height:14px;bo rder:0px;color:#909993;padding:8px;"  name="executestatus" required>
						<%for(int i=0;i<editTaskVO.getTaskStatusList().size();i++){ %>		
								<option value="<%=editTaskVO.getTaskStatusList().get(i).getCode()%>"><%=editTaskVO.getTaskStatusList().get(i).getName()%> </option>
						<%} %>
							</select>
					</div>
					<div class='clearfix'></div>
					<div id='executendtime' class='outerDiv'>
						<label for="enddate">任务到期日:</label> <input type="text"
							name="executendtime" id="enddate" value="<%=editTaskVO.getTask().getExecutendtime() %>" />
					</div>
					<div class='clearfix'></div>
					<div class='clearfix'></div>
					<div id='submit' class='outerDiv'>
						<input type="submit" value="edit the task" />
					</div>
				</form>
				<div class="clearfix"></div>
			</div>
		</div>
		<br>
		<!--  <div id="warning" style="margin-top: 20px; color: rgb(85, 85, 85); text-align: center; font-size: 14px;">适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</div>
			<div style="margin-top: 15px; color: rgb(85, 85, 85); text-align: center;">来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></div>
-->
	</div>
<script type="text/javascript">
$(document).ready(function() {     
    $('#enddate').datepicker({ dateFormat: 'yy-mm-dd' });     
}); 
</script>
</body>
</html>