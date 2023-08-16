<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="src.java.model.DTO.Account" %>
<%@page import="src.java.lib.utils.Config.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/component/headlink.jsp"/>
        <title>User Page</title>
    </head>
    <body>
        <% int act = (Integer)session.getAttribute(Attribute.ACTIVITY); %>
        <jsp:include page="/component/header.jsp"/>

        <div class="flex h-screen">
            <div class="w-1/5">
                <jsp:include page="/component/sideBar.jsp"/>
            </div>
            <!-- profile -->
            <div class="w-4/5 mx-24 mt-10 mb-auto flex items-center justify-center align-center">
                <c:choose>
                    <c:when test="<%= act == User.PROFILE %>">
                        <jsp:include page="/component/profileInfo.jsp"/>
                    </c:when>
                    <c:when test="<%= act == User.ORDERS %>">
                        <jsp:include page="/component/order.jsp"/>
                    </c:when>
                </c:choose>
                <span id="message" class="text-red-500">
                    <%= session.getAttribute(Attribute.MSG) == null ? "": session.getAttribute(Attribute.MSG)%>
                    <% session.removeAttribute(Attribute.MSG); %>
                </span>
            </div>
        </div>
        <jsp:include page="/component/footer.jsp"/>
    </body>
</html>
