<%@page import="model.entities.User"%>
<%
    User user = null;
    if (session != null) {
        user = (User) session.getAttribute("userLogin");
    }
%>
<div>   
    <div id="welcome">
        <p>Welcome, <%=user != null ? user.getFirstName() : "Guest"%></p>
    </div>
    <div id="logo">
        <img alt="Company Logo" src="images/logo.png" />
    </div>
    <div id="account">
        <div>
            <a href="registerController" title="Register Page"><%=user != null ? "" : "Register"%></a>
        </div>
        <div>
            <% if (user != null) {%>
            <a href="loginController?logout=logout"><p>Logout</p></a>
            <%} else {%>
            <p>/</p> 
            <%}
            %>
        </div>
        <div>
            <a href="loginController" title="Login Page"><%=user != null ? "" : "Login"%></a>
        </div>
    </div>
    <a href="cartController" title="Cart">
        <div id="cart">
            <img alt="Cart" src="images/icons/cart.png" />
        </div>
    </a>
</div>
