<%@page import="src.java.model.DTO.Plant"%>
<%@page import="src.java.lib.utils.Config.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./asset/css/style.css">
        <link rel="stylesheet" href="./asset/css/quantityBox.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
        <link rel="icon" href="./asset/images/brand/logo.jpg">
    </head>
    <body>
        <jsp:include page="/component/header.jsp"/>
        <!-- component -->
        <% Plant plant = (Plant) request.getAttribute(Attribute.DETAIL);%>
        
        <section class="text-gray-700 body-font overflow-hidden bg-white">
            <div class="container py-8 mx-auto">
                <div class="lg:w-4/5 mx-auto flex flex-wrap">
                    <img alt="ecommerce" class="lg:w-1/2 w-full object-cover object-center rounded-lg border border-gray-200" src="<%=plant.getImgPath()%>">
                    <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
                        <h2 class="text-sm title-font text-gray-500 tracking-widest">LETU SHOP</h2>
                        <h1 class="text-gray-900 text-3xl title-font font-medium mb-1"><%= plant.getPlantName() %></h1>
                        <div class="flex mb-4">
                            <span class="flex items-center">
                                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-red-500" viewBox="0 0 24 24">
                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                                </svg>
                                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-red-500" viewBox="0 0 24 24">
                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                                </svg>
                                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-red-500" viewBox="0 0 24 24">
                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                                </svg>
                                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-red-500" viewBox="0 0 24 24">
                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                                </svg>
                                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-red-500" viewBox="0 0 24 24">
                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                                </svg>
                                <span class="text-gray-600 ml-3">4 Reviews</span>
                            </span>
                        </div>
                        <p class="leading-relaxed"><%= plant.getDescription() %></p>
                        <form action="<%=Url.ADD_TO_CART%>" method="get" class="flex mt-6 items-center pb-5 border-b-2 border-gray-200 mb-5 justify-between">
                            <input type="hidden" name="<%=Param.ID%>" value="<%=plant.getPlantID()%>">
                            <div class="flex ml-6 items-center">
                             <span class="mr-3">Quantity</span>
                               <div class="relative">
                                   <jsp:include page="/component/quantityBox.jsp"/>
                               </div>
                           </div>
                           <div class="flex gap-4">
                               <span class="title-font font-medium text-2xl text-gray-900">$<%= plant.getPrice() %></span>
                               <input type="submit" value="Add to cart" class="rounded-lg flex ml-auto text-white bg-green-500 border-0 py-2 px-6 focus:outline-none hover:bg-green-600">
                               <div class="rounded-lg hover:text-red-500 w-10 h-10 bg-gray-200 p-0 border-0 inline-flex items-center justify-center text-gray-500 ml-4">
                                   <span class="material-symbols-outlined">favorite</span>
                               </div>
                           </div>
                       </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="./asset/js/quantityBox.js"></script>
        <jsp:include page="/component/footer.jsp"/>
    </body>
</html>
