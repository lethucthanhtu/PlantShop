<%@page import="java.sql.Date"%>
<%@page import="src.java.model.DTO.Order"%>
<%@page import="java.util.Map"%>
<%@page import="src.java.model.DTO.Plant"%>
<%@page import="java.util.List"%>
<%@page import="src.java.model.DTO.Account"%>
<%@page import="src.java.lib.utils.Config.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% Account acc = (Account) session.getAttribute(Attribute.USER) ;%>
<% List<Order> orders = (List<Order>) request.getAttribute(Attribute.ORDERS); %>
<% Date date = new Date(System.currentTimeMillis()); %>

<div>
    <c:if test="<%= acc.getRole() == Role.ADMIN %>">
        <form action="<%=Url.ADMIN%>" method="get" class="flex items-center w-full gap-12 mb-4 justify-center">
            <div class="">
                <input type="hidden" value="<%=User.ORDERS%>" name="<%=Param.ACTIVITY%>"

                <label for="dateFrom">From</label>
                <input min="2000-01-01" max="<%=date%>" type="Date" id="dateFrom" name="<%=Param.FROM_DATE%>"/>

                <label for="dateTo" class="ml-4">To</label>
                <input max="<%=date%>" type="Date" id="dateTo" name="<%=Param.TO_DATE%>"/>
            </div>
            <div class="relative w-48">
                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
                    </svg>
                </div>
                <input type="number" name="<%=Param.ID%>" 
                       value="<c:if test="<%=request.getAttribute(Attribute.SEARCH_VALUE) != null%>"><%=request.getAttribute(Attribute.SEARCH_VALUE)%></c:if>" 
                       id="simple-search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full pl-10 p-2.5"
                    placeholder="User ID">
            </div>
                <button type="submit" value="submit" class="p-2.5 ml-2 text-sm font-medium text-white bg-green-700 rounded-lg border border-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300">
                    Sort
                </button>
        </form>

        <table class="w-max text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3">id</th>
                    <th scope="col" class="px-6 py-3">order date</th>
                    <th scope="col" class="px-6 py-3">ship date</th>
                    <th scope="col" class="px-6 py-3">customer id</th>
                    <th scope="col" class="px-6 py-3">status</th>
                    <th scope="col" class="px-6 py-3">action</th>
                    <th scope="col" class="px-6 py-3">view detail</th>
                </tr>
            </thead>
            <tbody>
                <% for(Order order: orders){ %>
                    <tr class="bg-white border-b">
                        <td class="px-6 py-4">
                            <%= order.getOrderID() %>
                        </td>
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                            <%= order.getOrdDate() %>
                        </th>
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                            <%= order.getShipDate() %>
                        </th>
                        <td class="px-6 py-4">
                            <%= order.getAccID() %>
                        </td>
                        <td class="px-6 py-4">
                            <c:if test="<%= order.getStatus() == Status.PENDING %>">
                                <p class="text-green-500">PENDING</p>
                            </c:if>
                            <c:if test="<%= order.getStatus() == Status.CANCEL %>">
                                <p class="text-red-500">CANCELED</p>
                            </c:if>
                        </td>
                        <td class="px-6 py-4">
                            <c:if test="<%= order.getAccID() == acc.getAccID() %>">   
                                <form action="<%=Url.UPDATE_ORDER%>" method="get">
                                    <input type="hidden" 
                                           name="<%=Param.ID%>"
                                           value="<%=order.getOrderID()%>">
                                    <input type="hidden" 
                                           name="<%=Param.STATUS%>"
                                           value="<%=order.getStatus()%>">
                                    <button class="hover:text-pink-500">
                                        <c:if test="<%= order.getStatus() == Status.PENDING %>">CANCEL</c:if>
                                        <c:if test="<%= order.getStatus() == Status.CANCEL %>">RE-ORDER</c:if>
                                    </button>
                                </form>
                            </c:if>
                            <c:if test="<%= order.getAccID() != acc.getAccID() %>">   
                                NO ACTION
                            </c:if>
                        </td>
                        <td class="px-6 py-4">
                            <a href="<%=Url.DETAIL_ORDER + "?" + Param.ID + "=" + order.getOrderID()%>" class="hover:text-pink-700">
                                view
                            </a>
                        </td>
                    </tr>
                <%}%>
            </tbody>
        </table>
    </c:if>
    <c:if test="<%= acc.getRole() == Role.BUYER %>" >
        <form action="<%=Url.USER%>" method="get" class="flex items-center w-full gap-12 mb-4 justify-cente">
            <div>
                <input type="hidden" value="<%=User.ORDERS%>" name="<%=Param.ACTIVITY%>"

                <label for="dateFrom">From</label>
                <input min="2000-01-01" max="<%=date%>" type="Date" id="dateFrom" name="<%=Param.FROM_DATE%>"/>

                <label for="dateTo" class="ml-4">To</label>
                <input max="<%=date%>" type="Date" id="dateTo" name="<%=Param.TO_DATE%>"/>
            </div>
            <div class="flex w-48">
                <button type="submit" value="submit" class="p-2.5 ml-2 text-sm font-medium text-white bg-green-700 rounded-lg border border-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300">
                    Sort
                </button>
            </div>
        </form>
        <table class="w-fit text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3">id</th>
                    <th scope="col" class="px-6 py-3">order date</th>
                    <th scope="col" class="px-6 py-3">ship date</th>
                    <th scope="col" class="px-6 py-3">status</th>
                    <th scope="col" class="px-6 py-3">action</th>
                    <th scope="col" class="px-6 py-3">view detail</th>
                </tr>
            </thead>
            <tbody>

                <% for(Order order: orders){ %>
                    <tr class="bg-white border-b">
                        <td class="px-6 py-4">
                            <%= order.getOrderID() %>
                        </td>
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                            <%= order.getOrdDate() %>
                        </th>
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                            <%= order.getShipDate() %>
                        </th>
                        <td class="px-6 py-4">
                            <c:if test="<%= order.getStatus() == Status.PENDING %>">
                                <p class="text-green-500">PENDING</p>
                            </c:if>
                            <c:if test="<%= order.getStatus() == Status.CANCEL %>">
                                <p class="text-red-500">CANCELED</p>
                            </c:if>
                        </td>
                        <td class="px-6 py-4">
                            <form action="<%=Url.UPDATE_ORDER%>" method="get">
                                <input type="hidden" 
                                       name="<%=Param.ID%>"
                                       value="<%=order.getOrderID()%>">
                                <input type="hidden" 
                                       name="<%=Param.STATUS%>"
                                       value="<%=order.getStatus()%>">
                                <button class="hover:text-pink-500">
                                    <c:if test="<%= order.getStatus() == Status.PENDING %>">CANCEL</c:if>
                                    <c:if test="<%= order.getStatus() == Status.CANCEL %>">RE-ORDER</c:if>
                                </button>
                            </form>
                        </td>
                        <td class="px-6 py-4">
                            <a href="<%=Url.DETAIL_ORDER + "?" + Param.ID + "=" + order.getOrderID()%>" class="hover:text-pink-700">
                                view
                            </a>
                        </td>
                    </tr>
                <%}%>
            </tbody>
        </table>   
    </c:if>
</div>
<script src="./asset/js/valiDate.js"></script>