<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="src.java.model.DTO.Account" %>
<%@page import="src.java.lib.utils.Config.*" %>
<header class="pt-20">
    <nav class="bg-white px-2 sm:px-4 py-2.5 fixed w-full z-20 top-0 left-0 border-b border-gray-200">
        <%-- logo --%>
        <div class="container flex flex-wrap items-center justify-around mx-auto">
            <jsp:include page="/component/logo.jsp"/>
            
            <% Account acc = (Account) session.getAttribute(Attribute.USER); %>

            <%-- search box --%>
            <form action="<%=Url.SEARCH%>" method="get" class="flex items-center">
                
                <select name="<%=Param.OPTION%>" class="py-1.5 px-2 mr-2 text-lg my-font font-medium text-center text-gray-700 bg-white border border-gray-300 rounded-lg">
                    <% Object x = request.getAttribute(Attribute.OPTION); %>
                    <% String opt = x == null ? Option.NAME : (String) x; %>
                    <c:choose>
                        <c:when test="<%= opt.equals(Option.NAME) %>">
                            <option value="<%=Option.NAME%>" class="py-2 px-2 mr-2 text-lg my-font text-center text-gray-700 bg-white border border-gray-300 rounded-lg">Name</option>
                            <option value="<%=Option.CATEGORY%>" class="py-2 px-2 mr-2 text-lg my-font text-center text-gray-700 bg-white border border-gray-300 rounded-lg">Category</option>
                        </c:when>
                        <c:when test="<%= opt.equals(Option.CATEGORY) %>">
                            <option value="<%=Option.CATEGORY%>" class="py-2 px-2 mr-2 text-lg my-font text-center text-gray-700 bg-white border border-gray-300 rounded-lg">Category</option>
                            <option value="<%=Option.NAME%>" class="py-2 px-2 mr-2 text-lg my-font text-center text-gray-700 bg-white border border-gray-300 rounded-lg">Name</option>
                        </c:when>
                    </c:choose>
                </select>

                <div class="relative w-full">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                clip-rule="evenodd">
                            </path>
                        </svg>
                    </div>
                    <input type="text" name="<%=Param.SEARCH%>" 
                           value="<c:if test="<%=request.getAttribute(Attribute.SEARCH_VALUE) != null%>"><%=request.getAttribute(Attribute.SEARCH_VALUE)%></c:if>" 
                           id="simple-search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full pl-10 p-2.5"
                        placeholder="Search" required>
                </div>
                <button type="submit" value="submit" class="p-2.5 ml-2 text-sm font-medium text-white bg-green-700 rounded-lg border border-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                    <span class="sr-only">Search</span>
                </button>
            </form>              
            <%-- user item --%>
            <div class="flex md:order-2">
                <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white md:dark:bg-gray-900">
                    <li class="block py-2 pl-3 pr-4 text-gray-700 rounded cursor-pointer hover:bg-gray-100 md:hover:bg-transparent md:hover:text-green-700 md:p-0">
                        <a href="
                           <c:if test="<%= acc != null%>">
                               <%= Url.CART %>
                           </c:if>
                           <c:if test="<%= acc == null%>">
                               <%= Url.LOGIN %>
                           </c:if>
                           ">
                            <span class="material-symbols-outlined">shopping_cart</span>
                        </a>
                    </li>
                    <li class="block py-2 pl-3 pr-4 text-gray-700 rounded cursor-pointer hover:bg-gray-100 md:hover:bg-transparent md:hover:text-green-700 md:p-0 md:dark:hover:text-white md:dark:hover:bg-transparent">
                        <a href="
                           <c:if test="<%= acc != null%>">
                                <c:choose>
                                    <c:when test="<%=  acc.getRole() == Role.BUYER %>">
                                        <%= Url.USER%>
                                    </c:when>
                                    <c:when test="<%=  acc.getRole() == Role.ADMIN %>">
                                        <%= Url.ADMIN %>
                                    </c:when>
                                </c:choose>
                           </c:if>
                           <c:if test="<%= acc == null%>">
                               <%= Url.LOGIN %>
                           </c:if>
                        ">
                            <div class=" relative inline-block text-left dropdown">
                                <span class="material-symbols-outlined">account_circle</span>
                                <c:if test="<%= acc != null%>">
                                    <div class="opacity-0 invisible dropdown-menu transition-all duration-300 transform origin-top-right -translate-y-2 scale-95">
                                        <div class="absolute right-0 w-56 mt-2 origin-top-right bg-white border border-gray-200 divide-y divide-gray-100 rounded-md shadow-lg outline-none"
                                            aria-labelledby="headlessui-menu-button-1" id="headlessui-menu-items-117"
                                            role="menu">
                                            <div class="px-4 py-3">
                                                <p class="text-sm leading-5">Signed in as</p>
                                                <p class="text-sm font-medium leading-5 text-gray-900 truncate">
                                                    <%=  acc.getEmail() %></p>
                                            </div>
                                            <div class="py-1">
                                                <a href="#" tabindex="0"
                                                    class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                                    role="menuitem">Account settings</a>
                                                <a href="#" tabindex="1"
                                                    class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                                    role="menuitem">Support</a>
                                                <span role="menuitem" tabindex="-1"
                                                    class="flex justify-between w-full px-4 py-2 text-sm leading-5 text-left text-gray-700 cursor-not-allowed opacity-50"
                                                    aria-disabled="true">New feature (soon)</span>
                                                <a href="#" tabindex="2"
                                                    class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                                    role="menuitem">License</a>
                                            </div>
                                            <div class="py-1">
                                                <a href="<%= Url.LOGOUT %>" tabindex="3"
                                                    class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                                    role="menuitem">Sign out</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </a>
                    </li>
                    <li class="block py-2 pl-3 pr-4 text-gray-700 rounded cursor-pointer hover:bg-gray-100 md:hover:bg-transparent md:hover:text-green-700 md:p-0 md:dark:hover:text-white md:dark:hover:bg-transparent">
                        <div class=" relative inline-block text-left dropdown">
                            <span class="material-symbols-outlined">settings</span>
                            <div
                                class="opacity-0 invisible dropdown-menu transition-all duration-300 transform origin-top-right -translate-y-2 scale-95">
                                <div class="absolute right-0 w-56 mt-2 origin-top-right bg-white border border-gray-200 divide-y divide-gray-100 rounded-md shadow-lg outline-none"
                                    aria-labelledby="headlessui-menu-button-1" id="headlessui-menu-items-117"
                                    role="menu">
                                    <div class="px-4 py-3">
                                        <p class="text-sm leading-5">Signed in as</p>
                                        <p class="text-sm font-medium leading-5 text-gray-900 truncate">
                                            mail@example.com</p>
                                    </div>
                                    <div class="py-1">
                                        <a href="" tabindex="0"
                                            class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                            role="menuitem">Account settings</a>
                                        <a href="" tabindex="1"
                                            class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                            role="menuitem">Support</a>
                                        <span role="menuitem" tabindex="-1"
                                            class="flex justify-between w-full px-4 py-2 text-sm leading-5 text-left text-gray-700 cursor-not-allowed opacity-50"
                                            aria-disabled="true">New feature (soon)</span>
                                        <a href="" tabindex="2"
                                            class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                            role="menuitem">License</a>
                                    </div>
                                    <div class="py-1">
                                        <a href="" tabindex="3"
                                            class="text-gray-700 flex justify-between w-full px-4 py-2 text-sm leading-5 text-left"
                                            role="menuitem">Sign out</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <%-- nav item --%>
            <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
                <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white">
                    <li>
                        <a href="#" class="block py-2 pl-3 pr-4 text-white bg-green-700 rounded md:bg-transparent md:text-green-700 md:p-0" aria-current="page">Plants</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-green-700 md:p-0 md:dark:hover:text-white md:dark:hover:bg-transparent">Pots</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-green-700 md:p-0 md:dark:hover:text-white md:dark:hover:bg-transparent">Plant care</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-green-700 md:p-0 md:dark:hover:text-white md:dark:hover:bg-transparent">Bussinesses</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-green-700 md:p-0 md:dark:hover:text-white md:dark:hover:bg-transparent">Gifts</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
