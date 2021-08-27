<%@ tag body-content="scriptless" pageEncoding="EUC-KR" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%
	HttpSession httpSession = request.getSession(false);
	if (httpSession == null || httpSession.getAttribute("authUser") == null) {
%>
<jsp:doBody />
<%
	}
%>