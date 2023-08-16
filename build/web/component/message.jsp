<%@page import="src.java.lib.utils.Config.*"%>
<span id="message" class="text-red-500">
    <%= request.getAttribute(Attribute.MSG) == null ? "": request.getAttribute(Attribute.MSG)%>
</span>
