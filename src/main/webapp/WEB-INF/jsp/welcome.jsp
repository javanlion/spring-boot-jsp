<%@ page import="java.util.Map" %>
<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<body>
	<c:url value="/resources/text.txt" var="url"/>
	<spring:url value="/resources/text.txt" htmlEscape="true" var="springUrl" />
	Spring URL: ${springUrl} at ${time}
	<br>
	JSTL URL: ${url}
	<br>
	Message: ${message}
<br>
Message from c:out tag [<b><c:out value="${message}"/></b>]
<br>
<table>
	<tbody>
		<tr>
			<td>1</td>
			<td>1</td>
			<td><input type="text" value="<c:out value="${message}"/>"/></td>
		</tr>
	</tbody>
</table>
</body>
<br>
<pre>
	<%
		Object errorMsg = request.getParameter("message");
		Map<String, String[]> parameterMap = request.getParameterMap();
		if (errorMsg != null) {
			out.println("<pre>");
			out.println("Error message: " + errorMsg);
			out.println("</pre>");
		} else {
			out.println("<pre>");
			out.println("Else message: null . Params: " + parameterMap);
			out.println("</pre>");
		}
	%>
</pre>

</html>
