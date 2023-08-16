<%@page import="java.util.Map"%>
<%@page import="src.java.model.DTO.Plant"%>
<%@page import="java.util.List"%>
<%@page import="src.java.model.DTO.Account"%>
<%@page import="src.java.lib.utils.Config.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./asset/css/style.css">
        <link rel="stylesheet" href="./asset/css/dropdown.css">
        <link rel="icon" href="./asset/images/brand/logo.jpg">
        <title>Admin</title>
    </head>
    <body>
        <% int act = (Integer)session.getAttribute(Attribute.ACTIVITY); %>
        <% Account a = (Account) session.getAttribute(Attribute.USER); %>

        
        <jsp:include page="/component/header.jsp"/>

        
        
        <div class="flex h-screen w-screen">
            <div class="w-1/5">
                <jsp:include page="/component/sideBar.jsp"/>
            </div>
            
            <div class="w-4/5 mx-24 mt-10 mb-auto flex items-center justify-center align-center">
                <c:choose>
                    <c:when test="<%= act == User.PROFILE %>">
                        <jsp:include page="/component/profileInfo.jsp"/>
                    </c:when>
                    <c:when test="<%= act == User.ORDERS %>">
                        <jsp:include page="/component/order.jsp"/>
                    </c:when>
                    <c:when test="<%= act == Admin.ACCOUNTS %>">
                        <table class="w-max text-sm text-left text-gray-500">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3">id</th>
                                    <th scope="col" class="px-6 py-3">email</th>
                                    <th scope="col" class="px-6 py-3">name</th>
                                    <th scope="col" class="px-6 py-3">password</th>
                                    <th scope="col" class="px-6 py-3">phone</th>
                                    <th scope="col" class="px-6 py-3">status</th>
                                    <th scope="col" class="px-6 py-3">role</th>
                                    <th scope="col" class="px-6 py-3">action</th>
                                    <th scope="col" class="px-6 py-3">view detail</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<Account> accList = (List<Account>) request.getAttribute(Attribute.ACCOUNTS); %>
                                <% for(Account acc: accList){ %>
                                    <tr class="bg-white border-b">
                                        <td class="px-6 py-4">
                                            <%= acc.getAccID() %>
                                        </td>
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <%= acc.getEmail() %>
                                        </th>
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <%= acc.getFullname() %>
                                        </th>
                                        <td class="px-6 py-4">
                                            <%= acc.getPassword() %>
                                        </td>
                                        <td class="px-6 py-4">
                                            <%= acc.getPhone() %>
                                        </td>
                                        <td class="px-6 py-4">
                                            <c:if test="<%= acc.getStatus() == Status.ACTIVE %>">
                                                <p class="text-green-500">active</p>
                                            </c:if>
                                            <c:if test="<%= acc.getStatus() == Status.IN_ACTIVE %>">
                                                <p class="text-red-500">in-active</p>
                                            </c:if>
                                        </td>
                                        <td class="px-6 py-4">
                                            <c:if test="<%= acc.getRole() == Role.ADMIN %>">Admin</c:if>
                                            <c:if test="<%= acc.getRole() == Role.BUYER %>">Buyer</c:if>
                                        </td>
                                        <td class="px-6 py-4 text-center">
                                            <c:if test="<%= a.getAccID() == acc.getAccID() %>" >
                                                <span class="material-symbols-outlined">sentiment_satisfied</span>
                                            </c:if>
                                            <c:if test="<%= a.getAccID() != acc.getAccID() %>" >                                                        
                                                <form action="<%=Url.CHANGE_ACC_STATUS%>" method="get">
                                                    <input type="hidden" 
                                                           name="<%=Param.ID%>"
                                                           value="<%=acc.getAccID()%>">
                                                    <button class="hover:text-pink-500">
                                                        <c:if test="<%= acc.getStatus() == Status.ACTIVE %>">Block</c:if>
                                                        <c:if test="<%= acc.getStatus() == Status.IN_ACTIVE %>">Un-Block</c:if>
                                                    </button>
                                                </form>
                                            </c:if>
                                        </td>
                                        <td class="px-6 py-4">
                                            <a href="#" class="hover:text-pink-700">
                                                view
                                            </a>
                                        </td>
                                    </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </c:when>
                    <c:when test="<%= act == Admin.PLANTS %>">
                        <div class="w-max h-max">
                            <table class="text-sm text-left text-gray-500 w-1/2">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-5 py-3">id</th>
                                        <th scope="col" class="px-5 py-3">name</th>
                                        <th scope="col" class="px-5 py-3">price</th>
                                        <th scope="col" class="px-5 py-3">imgPath</th>
                                        <th scope="col" class="px-5 py-3">description</th>
                                        <th scope="col" class="px-5 py-3">status</th>
                                        <th scope="col" class="px-5 py-3">cateID</th>
                                        <th scope="col" class="px-5 py-3">action</th>
                                        <th scope="col" class="px-5 py-3">view detail</th>
                                    </tr>
                                </thead>
                                <tbody class="w-1/2">
                                    <% List<Plant> plants = (List<Plant>) request.getAttribute(Attribute.PLANTS) ; %>
                                    <% for(Plant plant: plants){ %>
                                        <tr class="bg-white border-b">
                                            <form action="<%= Url.UPDATE_PLANT%>" method="get">
                                                <td class="px-5 py-4">
                                                    <%= plant.getPlantID() %>
                                                    <input type="hidden" 
                                                           value="<%=plant.getPlantID()%>"
                                                           name="<%=Param.ID%>" class="w-1/2">
                                                </td>
                                                <th scope="row" class="px-5 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                    <input type="text" required
                                                           value="<%=plant.getPlantName()%>"
                                                           name="<%=Param.NAME%>" >
                                                </th>
                                                <td class="px-5 py-4">
                                                    <input type="number" min="1" required
                                                           value="<%=plant.getPrice()%>"
                                                           name="<%=Param.PRICE%>">
                                                </td>
                                                <td class="px-5 py-4">
                                                    <img class="w-10 h-10 rounded"  src="<%=plant.getImgPath()%>">
                                                    <input type="hidden" 
                                                           value="<%=plant.getImgPath()%>"
                                                           name="<%=Param.IMG%>">
                                                </td>
                                                <td class="px-5 py-4">
                                                    <input type="text" required
                                                           value="<%=plant.getDescription()%>"
                                                           name="<%=Param.DESCRIPTION%>">
                                                </td>
                                                <td class="px-5 py-4">
                                                    <input type="number" min="0" required
                                                           value="<%=plant.getStatus()%>"
                                                           name="<%=Param.STATUS%>">
                                                </td>
                                                <td class="px-5 py-4">
                                                    <input type="number" min="0" required 
                                                           value="<%=plant.getCateID()%>"
                                                           name="<%=Param.CATE_ID%>">
                                                </td>
                                                <td class="px-5 py-4">
                                                    <input type="submit" value="Update" class="cursor-pointer">
                                                </td>
                                            </form>
                                                <td class="px-5 py-4">
                                                    <a href="<%=Url.DETAIL%>?<%=Param.ID%>=<%=plant.getPlantID()%>">
                                                        <p class="hover:text-pink-700">view</p>
                                                    </a>
                                                </td>
                                        </tr>
                                    <%}%>
                                    <tr class="bg-white border-b w-1/2">
                                        <td class="px-6 py-4">
                                            X
                                        </td>
                                        <form action="<%=Url.ADD_PLANT%>" method="get">
                                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                <input type="text" required
                                                       name="<%=Param.NAME%>">
                                            </th>
                                            <td class="px-6 py-4">
                                                <input type="number" 
                                                       name="<%=Param.PRICE%>">
                                            </td>
                                            <td class="px-6 py-4">
                                                <input type="text" required
                                                       name="<%=Param.IMG%>">
                                            </td>
                                            <td class="px-6 py-4">
                                                <input type="text" required
                                                       name="<%=Param.DESCRIPTION%>">
                                            </td>
                                            <td class="px-6 py-4">
                                                <input type="text" required
                                                       name="<%=Param.STATUS%>">
                                            </td>
                                            <td class="px-6 py-4">
                                                <input type="text" required
                                                       name="<%=Param.CATE_ID%>">
                                            </td>
                                            <td class="px-6 py-4">
                                                <input type="submit" value="Add">
                                            </td>
                                        </form>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:when test="<%= act == Admin.CATEGORIES %>">
                        <table class="w-max text-sm text-left text-gray-500">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3">id</th>
                                    <th scope="col" class="px-6 py-3">name</th>
                                    <th scope="col" class="px-6 py-3">action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% Map<Integer, String> cates = (Map<Integer, String>) request.getAttribute(Attribute.CATEGORIES) ; %>
                                <% for(int id: cates.keySet()){ %>
                                    <tr class="bg-white border-b">
                                        <td class="px-6 py-4">
                                            <%= id %>
                                        </td>
                                        <form action="<%=Url.UPDATE_CATEGORY%>" method="get">
                                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                <input type="text" name="<%=Param.NAME%>" value="<%=cates.get(id)%>">
                                            </th>
                                            <td class="px-6 py-4">
                                                <input type="hidden" name="<%=Param.ID%>" value="<%=id%>">
                                                <input type="submit" value="Update" class="cursor-pointer">
                                            </td>
                                        </form>
                                    </tr>
                                <%}%>
                                <tr class="bg-white border-b">
                                    <td class="px-6 py-4">
                                        X
                                    </td>
                                    <form action="<%=Url.ADD_CATEGORY%>" method="get">
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <input type="text" name="<%=Param.NAME%>" required>
                                        </th>
                                        <td class="px-6 py-4">
                                            <input type="submit" value="Add" class="cursor-pointer">
                                        </td>
                                    </form>
                                </tr>
                            </tbody>
                        </table>
                    </c:when>
                        
                </c:choose>
                <span id="message" class="text-red-500">
                    <%= session.getAttribute(Attribute.MSG) == null ? "": session.getAttribute(Attribute.MSG)%>
                    <% session.removeAttribute(Attribute.MSG); %>
                </span>
            </div>
             
        </div>
        <jsp:include page="/component/footer.jsp"/>
        <script src="./asset/js/registerCheck.js"></script>
    </body>
</html>
