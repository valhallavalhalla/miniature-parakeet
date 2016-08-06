<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Admin Panel</title>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	</head>
	<body>
		<h3>Library admin panel</h3>
		<br/>
		<form action="ControllerServlet" method="post">
		<button type="submit" value="LOGOUT" name="command" class="btn btn-default">Logout</button>
		</form>
		<br/>
		<h2>Order Management</h2>
		<br/>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Order ID</th>
					<th>User login</th>
					<th>Book title</th> 
					<th>Book author</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ordersToProcess" items="${requestScope.ordersToProcess}">
				<c:set var="order" value="${ordersToProcess.key}"/>
				<c:set var="additionalInfo"  value="${ordersToProcess.value}"/>
				<c:forEach var="entry" items="${additionalInfo}">
					<c:set var="user" value="${entry.key}"/>
					<c:set var="book" value="${entry.value}"/>
						<tr>
							<td>${order.id}</td>
							<td>${user.login}</td>
							<td>${book.title}</td>
							<td>${book.author}</td>
							<td>
								<form action="ControllerServlet" method="post">
									<input name="idOrder" value="${order.id}" type="hidden"/>
									<input name="idBook" value="${book.id}" type="hidden"/>
									<button type="submit" value="CONFIRM_ORDER" name="command" class="btn btn-default">
									Confirm order</button>
									<button type="submit" value="REFUSE_ORDER" name="command" class="btn btn-default">
									Refuse to order</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>