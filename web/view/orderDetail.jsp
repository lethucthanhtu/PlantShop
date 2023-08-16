<%@page import="src.java.model.DTO.Plant"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="src.java.lib.utils.Config.*"%>
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
        <title>Order detail</title>
    </head>
    <body>
        <jsp:include page="/component/header.jsp"/>
        
        <div class="h-screen justify-center align-center">
            <table class="w-fit text-sm text-left text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3">id</th>
                        <th scope="col" class="px-6 py-3">name</th>
                        <th scope="col" class="px-6 py-3">image</th>
                        <th scope="col" class="px-6 py-3">price</th>
                        <th scope="col" class="px-6 py-3">quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% Map<Integer, Integer> orderCart = (Map<Integer, Integer>) request.getAttribute(Attribute.ORDER); %>
                    <% List<Plant> plants = (List<Plant>) request.getAttribute(Attribute.PLANTS); %>
                    <% for(Plant plant: plants){ %>
                        <tr class="bg-white border-b">
                            <td class="px-6 py-4">
                                <%= plant.getPlantID() %>
                            </td>
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                <%= plant.getPlantName() %>
                            </th>
                            <td class="px-6 py-4">
                                <img class="w-10 h-10 rounded"  src="<%=plant.getImgPath()%>">
                            </td>
                            <td class="px-6 py-4">
                                <%= plant.getPrice() %>
                            </td>
                            <td class="px-6 py-4">
                                <%= orderCart.get(plant.getPlantID()) %>
                            </td>
                        </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
            
        <jsp:include page="/component/footer.jsp"/>
    </body>
</html>
