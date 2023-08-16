<%@page import="java.util.List"%>
<%@page import="src.java.model.DTO.Plant"%>
<%@page import="java.util.Map"%>
<%@page import="src.java.lib.utils.Config.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/component/headlink.jsp"/>
        <link rel="stylesheet" href="./asset/css/quantityBox.css">
        <title>cart</title>
    </head>
    <body>        
        <jsp:include page="/component/header.jsp"/>
        
        <% Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute(Attribute.CART); %>
        <% List<Plant> cartItem = (List<Plant>) session.getAttribute(Attribute.CART_ITEMS); %>
        <c:if test="<%= cart.isEmpty() %>">
            <div class="container max-w-screen-lg mx-auto pb-10">
                <img class="mx-auto" src="./asset/images/brand/empty-cart.png">
            </div>
        </c:if>
        <c:if test="<%= !cart.isEmpty() %>">
            <div class="mx-8">
                <div class="container mx-auto mt-10">
                    <div class="flex shadow-lg my-10 rounded-lg">
                        <div class="w-3/4 bg-white px-10 py-10 rounded-l-lg border-r-gray-900">
                            <div class="flex justify-between border-b pb-8">
                                <h1 class="font-semibold text-2xl">Shopping Cart</h1>
                                <h2 class="font-semibold text-2xl"><%=cart.size()%> Items</h2>
                            </div>
                            <div class="flex mt-10 mb-5">
                                <h3 class="font-semibold text-gray-600 text-xs uppercase w-2/5">Product Details</h3>
                                <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Quantity</h3>
                                <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Price</h3>
                                <!--<h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Total</h3>-->
                            </div>
                            <% int total = 0;%>                            
                            <% for(Plant plant: cartItem) {%>
                                <% total += cart.get(plant.getPlantID())*plant.getPrice(); %>
                                <!--<a href="<%=Url.DETAIL%>?<%=Param.ID%>=<%=plant.getPlantID()%>"></a>-->
                                <div class="flex items-center hover:bg-gray-100 -mx-8 px-6 py-5 rounded-lg">
                                    <div class="flex w-2/5"> <!-- product -->
                                        <a href="<%=Url.DETAIL%>?<%=Param.ID%>=<%=plant.getPlantID()%>">
                                            <div class="w-20">
                                                <img class="h-24" src="<%=plant.getImgPath()%>" alt="">
                                            </div>
                                        </a>
                                        <div class="flex flex-col justify-between ml-4 flex-grow">
                                            <span class="font-bold text-sm"><%=plant.getPlantName()%></span>
                                            <span class="text-red-500 text-xs">LETU SHOP</span>
                                            <a href="<%=Url.REMOVE%>?<%=Param.ID%>=<%=plant.getPlantID()%>" class="font-semibold hover:text-red-500 text-gray-500 text-xs">Remove</a>
                                        </div>
                                    </div>
                                    <div class="flex justify-center w-1/5">
                                        <div class="custom-number-input h-10 w-32">
                                            <form action="<%=Url.ADD_TO_CART%>" class="flex flex-row h-10 w-full rounded-lg relative bg-transparent mt-1">
                                                <input type="hidden" name="<%=Param.ID%>" value="<%=plant.getPlantID()%>">
                                                <button data-action="decrement" class=" bg-gray-100 text-gray-600 hover:text-gray-700 hover:bg-gray-200 h-full w-20 rounded-l cursor-pointer outline-none">
                                                    <span class="m-auto text-2xl font-thin">-</span>
                                                </button>
                                                <input type="number"
                                                       
                                                       name="<%=Param.QUANTITY%>" 
                                                       value="<%=cart.get(plant.getPlantID())%>" 
                                                       class="outline-none focus:outline-none text-center w-full bg-gray-100 font-semibold text-md hover:text-black focus:text-black md:text-basecursor-default flex items-center text-gray-700  outline-none"></input>
                                                <button data-action="increment" class="bg-gray-100 text-gray-600 hover:text-gray-700 hover:bg-gray-200 h-full w-20 rounded-r cursor-pointer">
                                                    <span class="m-auto text-2xl font-thin">+</span>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <span class="text-center w-1/5 font-semibold text-sm">$<%=plant.getPrice()%></span>
                                </div>
                            <%}%>
                            <%--</c:forEach>--%>
                            <a href="<%=Url.HOME%>" class="flex font-semibold text-green-700 text-sm mt-10">
                                <svg class="fill-current mr-2 text-green-700 w-4" viewBox="0 0 448 512">
                                    <path d="M134.059 296H436c6.627 0 12-5.373 12-12v-56c0-6.627-5.373-12-12-12H134.059v-46.059c0-21.382-25.851-32.09-40.971-16.971L7.029 239.029c-9.373 9.373-9.373 24.569 0 33.941l86.059 86.059c15.119 15.119 40.971 4.411 40.971-16.971V296z"/>
                                </svg>
                                Continue Shopping
                            </a>
                        </div>

                        <div id="summary" class="w-1/4 px-8 py-10 bg-white rounded-r-lg border-l">
                            <h1 class="font-semibold text-2xl border-b pb-8">Order Summary</h1>
                            <div class="flex justify-between mt-10 mb-5">
                                <span class="font-semibold text-sm uppercase">Items <%=cart.size()%></span>
                                <span class="font-semibold text-sm">$<%=total%></span>
                            </div>
                            <div>
                                <label class="font-medium inline-block mb-3 text-sm uppercase">Shipping</label>
                                <select class="block p-2 text-gray-600 w-full text-sm rounded-lg">
                                    <option>Standard shipping - $10.00</option>
                                </select>
                            </div>
                            <div class="py-10">
                                <label for="promo" class="font-semibold inline-block mb-3 text-sm uppercase">Promo Code</label>
                                <input type="text" id="promo" placeholder="Enter your code" class="p-2 text-sm w-full rounded-lg">
                            </div>
                            <button class="bg-red-500 rounded-lg hover:bg-red-600 px-5 py-2 text-sm text-white uppercase">Apply</button>
                            <div class="border-t mt-8">
                                <div class="flex font-semibold justify-between py-6 text-sm uppercase">
                                    <span>Total cost</span>
                                    <span>$<%=total%></span>
                                </div>
                                <a href="<%=Url.CHECKOUT%>" class="align-center px-28 bg-green-700 rounded-lg font-semibold hover:bg-green-700 py-3 text-sm text-white uppercase w-full">
                                    Checkout
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <script src="./asset/js/quantityBoxCart.js"></script>
        <jsp:include page="/component/footer.jsp"/>
    </body>
</html>
