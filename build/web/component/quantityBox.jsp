<%@page import="src.java.lib.utils.Config.*" %>
<div class="custom-number-input h-10 w-32">
    <div class="flex flex-row h-10 w-full rounded-lg relative bg-transparent mt-1 ">
        <div data-action="decrement" class="justify-center items-center text-center bg-gray-100 text-gray-600 hover:text-gray-700 hover:bg-gray-200 h-full w-20 rounded-l cursor-pointer outline-none">
            <span class="m-auto text-2xl font-thin">-</span>
        </div>
        <input type="number" id="quantityBox" class="outline-none focus:outline-none text-center w-full bg-gray-100 font-semibold text-md hover:text-black focus:text-black md:text-basecursor-default flex items-center text-gray-700  outline-none" name="<%=Param.QUANTITY%>" value="1"></input>
        <div data-action="increment" class="justify-center items-center text-center bg-gray-100 text-gray-600 hover:text-gray-700 hover:bg-gray-200 h-full w-20 rounded-r cursor-pointer">
            <span class="m-auto text-2xl font-thin">+</span>
        </div>
    </div>
</div>