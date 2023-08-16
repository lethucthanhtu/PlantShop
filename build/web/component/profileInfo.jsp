<%@page import="src.java.model.DTO.Account"%>
<%@page import="src.java.lib.utils.Config.*" %>
<% Account acc = (Account) session.getAttribute(Attribute.USER); %>
<form action="<%=Url.UPDATE_ACCOUNT%>" method="get" class="">
    <div class="mb-6">
        <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email address</label>
        <input type="email" readonly="true"
               value="<%=acc.getEmail()%>" 
               
               id="email" 
               class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5" placeholder="your@email.com" required>
    </div> 
    <div class="grid gap-6 mb-6 md:grid-cols-2">
        <div>
            <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Full Name</label>
            <input type="text"
                   value="<%=acc.getFullname()%>" 
                   name="<%=Param.NAME%>" 
                   id="fullname" 
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5" placeholder="Full name" required>
        </div>
        <div>
            <label for="phone" id="phone-label" class="block mb-2 text-sm font-medium text-gray-900">Phone</label>
            <input type="text" 
                   value="<%=acc.getPhone()%>" 
                   name="<%=Param.PHONE%>" 
                   id="phone" 
                   onkeyup="phoneCheck(this)" 
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-green-500 dark:focus:border-green-500" placeholder="Doe" required>
        </div>
    </div>
    <div class="mb-6">
        <label for="password" id="password-label" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
        <input type="password" 
               value="<%=acc.getPassword()%>" 
               name="<%=Param.PASSWORD%>" 
               id="password" 
               class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-green-500 dark:focus:border-green-500" placeholder="" required>
    </div> 
               <!--onkeyup="passwordCheck(this)" -->
<!--    <div class="mb-6">
        <label for="confirm_password" id="confirm-label" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm password</label>
        <input type="password" 
               name="<%=Param.PASSWORD_CONFIRM%>" 
               id="password-confirm" 
               onkeyup="confirmCheck(this)" 
               class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-green-500 dark:focus:border-green-500" placeholder="">
    </div>-->
               <span id="message" class="text-red-500"><%= request.getAttribute(Attribute.MSG) == null ? "": request.getAttribute(Attribute.MSG)%></span><br>

    <button type="submit" id="submit-box" value="Update Profile" class="text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">
        Update Profile
    </button>
</form>