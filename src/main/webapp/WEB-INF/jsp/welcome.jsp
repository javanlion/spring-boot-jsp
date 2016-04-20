<%@ page import="java.util.Map" %>
<%@ page import="com.hp.gagawa.java.elements.Pre" %>
<%@ page import="com.hp.gagawa.java.elements.Script" %>
<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
	<style>
		table, th, td {
			border: 1px solid black;
			border-collapse: collapse;
		}
	</style>
</head>
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
<p>=============================Java jsp generated code===================================</p>
<pre>

	<%
		request.setAttribute("errorMessage", "Error.......!");
	%>
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
<p>=============================1: Html tags using Gagawa lib===================================</p>
<pre>
	<%
		Map<String, String[]> parameterMap2 = request.getParameterMap();
		Pre pre = new Pre();
		pre.appendText("Map: " + parameterMap2.toString());
		out.println(pre.write());
	%>
</pre>
<p>=============================2: < %=request.getAttribute("errorMessage")% >===================================</p>
<pre><c:out value='<%=request.getAttribute("errorMessage")%>'/></pre>
<p>=============================3: set, if===================================</p>
<c:set var="errorMessage" scope="request" value='<%=request.getAttribute("errorMessage")%>'/>
<c:if test="${errorMessage != null}">
	<pre>If condition: <c:out value="${errorMessage}"/></pre>
	<script>
		alert('<c:out value="${errorMessage}"/>')
	</script>
</c:if>
<p>=============================4: choose{when, otherwise}===================================</p>
<c:choose>
	<c:when test="${errorMessage != null}">
		<pre>When condition: <c:out value="${errorMessage}"/></pre>
	</c:when>
	<c:otherwise>
		<pre>Otherwise condition</pre>
	</c:otherwise>
</c:choose>
</html>
