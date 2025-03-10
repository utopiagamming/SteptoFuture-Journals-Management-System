<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.rain.bean.TypeBean,com.rain.dao.AdminDao,com.rain.dao.TypeDao,com.rain.bean.BookBean,com.rain.dao.BookDao,com.rain.bean.AdminBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">

<head>
<meta charset="UTF-8">
<title>期刊馆管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<script src="static/js/bootstrap.min.js"></script>
<script src="static/jQuery/jquery-3.1.1.min.js"></script>
<script src="static/js/bootstrap-dropdown.min.js"></script>
<script src="static/js/adminUpdateInfo.js"></script>
<script src="static/js/adminUpdatePwd.js"></script>
<style>
body {
	background-image: url("01.jpg");
}
</style>
</head>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<body class="bootstrap-admin-with-small-navbar">
	<%
		AdminBean admin = new AdminBean();
		String aid = (String) session.getAttribute("aid");
		AdminDao admindao = new AdminDao();
		admin = admindao.get_AidInfo2(aid);
	%>
	<nav
		class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small"
		role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="collapse navbar-collapse main-navbar-collapse">
						<a class="navbar-brand" href="admin.jsp"><strong>欢迎使用期刊馆管理系统</strong></a>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" role="button"
								class="dropdown-toggle" data-hover="dropdown"> <i
									class="glyphicon glyphicon-user"></i> 欢迎您，<%out.write(admin.getName());%>
										(<%=session.getAttribute("aid")%>) <i class="caret"></i></a>
								<ul class="dropdown-menu">
									<li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
									<li role="presentation" class="divider"></li>
									<li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
									<li role="presentation" class="divider"></li>
									<li><a href="/login.jsp">退出</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<!-- left, vertical navbar & content -->
		<div class="row">
			<!-- left, vertical navbar -->
			<div class="col-md-2 bootstrap-admin-col-left">
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/admin_book.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 期刊管理</a></li>
					<li><a href="/admin_user.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 读者管理</a></li>
					<li><a href="/admin_booktype.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 期刊分类管理</a></li>
					<li><a href="/admin_borrow.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 期刊借阅信息</a></li>
					<li><a href="/admin_history.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 期刊归还信息</a></li>
					<li><a href="/admin_login.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i>管理员管理(需登录)</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/admin_bdtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 热门推荐</a></li>
					<li><a href="/admin_brtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 最佳读者</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/admin_feedback.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 读者反馈</a></li>
				</ul>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/admin_log.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 登录日志</a></li>
				</ul>
			</div>

			<!-- content -->
			<div class="col-md-10">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">查询</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal" action="/selectServlet"
									method="post">
									<!-- <input type="hidden" name="tip" value="1"> -->
									<input type="hidden" name="tip" value="1">
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">期刊信息</label>
										<div class="col-lg-8">
											<input class="form-control" id="bookName" name="name"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-3 form-group">

										<button type="submit" class="btn btn-primary" id="btn_query">查询</button>
									</div>
									<div class="col-lg-3 form-group">
										<button type="button" class="btn btn-primary" id="btn_add"
											data-toggle="modal" data-target="#addModal">添加期刊</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<table id="data_list" class="table table-hover table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>期刊号</th>
									<th>期刊类型</th>
									<th>期刊名称</th>
									<th>作者1</th>
									<th>作者2</th>
									<th>出版社</th>
									<th>内容</th>
									<th>年</th>
									<th>卷</th>
									<th>期</th>
									<th>关键字1</th>
									<th>关键字2</th>
									<th>关键字3</th>
									<th>关键字4</th>
									<th>关键字5</th>
									<%--<th>期刊价格</th>--%>
									<%--<th>借阅价格</th>--%>
									<%--<th>逾期金额</th>--%>
									<th>借阅状态</th>
									<th>操作</th>
								</tr>
							</thead>

							<!---在此插入信息-->
							<%
								ArrayList<BookBean> bookdata = new ArrayList<BookBean>();
								bookdata = (ArrayList<BookBean>) request.getAttribute("data");
								if (bookdata == null) {
									BookDao bookdao = new BookDao();
									bookdata = (ArrayList<BookBean>) bookdao.get_ListInfo();
								}
	
								for (BookBean bean : bookdata) {
							%>
							<tbody>
								<td><%=bean.getCard()%></td>
								<td><%=bean.getType()%></td>
								<td><%=bean.getName()%></td>
								<td><%=bean.getAutho()%></td>
								<td><%=bean.getAutho2()%></td>
								<td><%=bean.getPress()%></td>
								<td><%=bean.getContent()%></td>
								<td><%=bean.getYear()%></td>
								<td><%=bean.getColunm()%></td>
								<td><%=bean.getItem()%></td>
								<td><%=bean.getKey1()%></td>
								<td><%=bean.getKey2()%></td>
								<td><%=bean.getKey3()%></td>
								<td><%=bean.getKey4()%></td>
								<td><%=bean.getKey5()%></td>
								<%--<td><%=bean.getPress()%></td>--%>
								<%--<td><%=bean.getBookPrice()%></td>--%>
								<%--<td><%=bean.getBorrowPrice()%></td>--%>
								<%--<td><%=bean.getOverduePrice()%></td>--%>
								<td>
								<%
								int state = bean.getState();
								if(state==1){
								%>
								可借阅
								<%}else{ %>
								已被借阅
								<%} %>
								</td>
								<td><button type="button" class="btn btn-warning btn-xs"
										data-toggle="modal" data-target="#updateModal" id="btn_update"
										onclick="showInfo2('<%=bean.getBid()%>','<%=bean.getCard()%>','<%=bean.getType()%>','<%=bean.getName()%>',
											'<%=bean.getAutho()%>','<%=bean.getPress()%>','<%=bean.getBookPrice()%>','<%=bean.getBorrowPrice()%>','<%=bean.getOverduePrice()%>')">修改</button>
									<button type="button" class="btn btn-danger btn-xs"
										onclick="deletebook(<%=bean.getBid()%>)">删除</button></td>
							</tbody>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function showInfo2(bid, card, type, name, autho, press, bookPrice,borrowPrice,overduePrice) {
			document.getElementById("updateISBN").value = card;
			document.getElementById("updateBookName").value = name;
			document.getElementById("updateAutho").value = autho;
			document.getElementById("updatePress").value = press;
			document.getElementById("updateBookType").value = type;
			document.getElementById("updateBookId").value = bid;
			document.getElementById("updateBookPrice").value = bookPrice;
			document.getElementById("updateBorrowPrice").value = borrowPrice;
			document.getElementById("updateOverduePrice").value = overduePrice;
		}

		function deletebook(bid) {
			con = confirm("是否删除?");
			if(con == true) {
				location.href = "/deleteServlet?bid=" + bid;
			}
		}
	</script>

	<!-------------------------------------------------------------->

	<!-- 修改模态框（Modal） -->
	<form class="form-horizontal" method="post"
		action="/updateBookServlet">
		<!--保证样式水平不混乱-->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
			aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="updateModalLabel">修改期刊信息</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊号</label>
							<div class="col-sm-7">
								<input type="hidden" id="updateBookId" name="updatebid">
								<input type="text" class="form-control" id="updateISBN"
									name="card" placeholder="请输入书号"> <label
									class="control-label" for="updateISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateBookName"
									name="name" placeholder="请输入期刊名称"> <label
									class="control-label" for="updateBookName"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="updateBookType" name="type"
									onPropertyChange="showValue(this.value)">
									<option value="-1">请选择</option>
									<%
										TypeDao typedao = new TypeDao();
										ArrayList<TypeBean> data = (ArrayList<TypeBean>) typedao.get_ListInfo();
										data = (ArrayList<TypeBean>) typedao.get_ListInfo();
										for (TypeBean bean : data) {
									%>
									<option value="<%=bean.getName()%>">
										<%=bean.getName()%>
									</option>
									<%
										}
									%>
								</select> <label class="control-label" for="updateBookType"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">作者名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateAutho"
									name="autho" placeholder="请输入作者名称"> <label
									class="control-label" for="updateAutho" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">出版社</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatePress"
									name="press" placeholder="请输入出版社"> <label
									class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊价格</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateBookPrice"
									name="bookPrice" placeholder="请输入期刊价格"> <label
									class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">借阅价格</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateBorrowPrice"
									name="borrowPrice" placeholder="请输入借阅价格"> <label
									class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">逾期金额</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateOverduePrice"
									name="overduePrice" placeholder="请输入逾期金额"> <label
									class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>
	<!-------------------------------------------------------------->

	<!--------------------------------------添加的模糊框------------------------>
	<form class="form-horizontal" method="post"
		action="/AddBookServlet">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">添加新期刊</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addISBN"
									required="required" name="card" placeholder="请输入书号"> <label
									class="control-label" for="addISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addBookName"
									required="required" name="name" placeholder="请输入期刊名称">
								<label class="control-label" for="addBookName"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="addBookType" name="type">
									<option value="无分类">请选择</option>
									<%
										data = (ArrayList<TypeBean>) typedao.get_ListInfo();
										for (TypeBean bean : data) {
									%>
									<option value="<%=bean.getName()%>">
										<%=bean.getName()%>
									</option>
									<%
										}
									%>
								</select> <label class="control-label" for="addBookType"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">作者名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addAutho"
									required="required" name="autho" placeholder="请输入作者名称">
								<label class="control-label" for="addAutho"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">出版社</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addPress"
									required="required" name="press" placeholder="请输入出版社">
								<label class="control-label" for="addPress"
									style="display: none;"></label>
							</div>
						</div>

						
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">期刊价格</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addBookPrice"
									required="required" name="bookPrice" placeholder="请输入期刊价格">
								<label class="control-label" for="addBookPrice" style="display: none;"></label>
							</div>
						</div>
						
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">借阅价格</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addBorrowPrice"
									required="required" name="borrowPrice" placeholder="请输入借阅价格">
								<label class="control-label" for="addBorrowPrice" style="display: none;"></label>
							</div>
						</div>
						
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">逾期金额</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addOverduePrice"
									required="required" name="overduePrice" placeholder="请输入借阅价格">
								<label class="control-label" for="addOverduePrice" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">作者2</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addAutho2"
									   required="required" name="autho2" placeholder="请输入作者2">
								<label class="control-label" for="addAutho2" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">内容</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addContent"
									   required="required" name="content" placeholder="请输入内容">
								<label class="control-label" for="addContent" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">年份</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addYear"
									   required="required" name="year" placeholder="请输入年份">
								<label class="control-label" for="addYear" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">卷</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addColunm"
									   required="required" name="colunm" placeholder="请输入卷">
								<label class="control-label" for="addColunm" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">项</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addItem"
									   required="required" name="item" placeholder="请输入项">
								<label class="control-label" for="addItem" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">关键字1</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addKeyword1"
									   required="required" name="keyword1" placeholder="请输入关键字1">
								<label class="control-label" for="addKeyword1" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">关键字2</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addKeyword2"
									   required="required" name="keyword2" placeholder="请输入关键字2">
								<label class="control-label" for="addKeyword2" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">关键字3</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addKeyword3"
									   required="required" name="keyword3" placeholder="请输入关键字3">
								<label class="control-label" for="addKeyword3" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">关键字4</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addKeyword4"
									   required="required" name="keyword4" placeholder="请输入关键字4">
								<label class="control-label" for="addKeyword4" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">关键字5</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addKeyword5"
									   required="required" name="keyword5" placeholder="请输入关键字5">
								<label class="control-label" for="addKeyword5" style="display: none;"></label>
							</div>
						</div>

						<!---------------------表单-------------------->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">添加</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>
	<!--------------------------------------修改密码的模糊框------------------------>

	<!-------------------------------------------------------------->

	<form class="form-horizontal" method="post"
		action="/AdminServlet">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改密码</h4>
					</div>
					<div class="modal-body">

						<!--正文-->
						<input type="hidden" name="tip" value="1"> <input
							type="hidden" name="url" value="admin_book">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">原密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password"
									id="oldPwd" placeholder="请输入原密码"> <label
									class="control-label" for="oldPwd" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">新密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password2"
									id="newPwd" placeholder="请输入新密码"> <label
									class="control-label" for="newPwd" style="display: none"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>
	<!-------------------------------------------------------------->

	<!-------------------------个人资料模糊框------------------------------------->

	<form class="form-horizontal" method="post"
		action="/AdminServlet">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="ModalLabel">个人资料</h4>
					</div>

					<div class="modal-body">

						<!--正文-->
						<input type="hidden" name="tip" value="2"> <input
							type="hidden" name="url" value="admin_book">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请输入您的真实姓名" value='<%out.write(admin.getName());%>'>
								<label class="control-label" for="name" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="请输入您的手机号" value='<%out.write(admin.getPhone());%>'>
								<label class="control-label" for="phone" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="请输入您的邮箱" value='<%out.write(admin.getEmail());%>'>
								<label class="control-label" for="email" style="display: none"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>
</body>
</html>