<%@page import="model.entities.Order"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.entities.Item"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    Order order = (Order) request.getAttribute("order");
    HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
    double itemsPrice = 0;
    double totalPrice = 0;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/_head.jsp" %>
        <link rel="stylesheet" href="css/order.css">
        <link rel="stylesheet" href="css/cart.css">
    </head>
    <body>
        <main>

            <header>
                <%@include file="../includes/_header.jsp" %>
            </header>

            <div>
                <nav>
                    <%@include file="../includes/_nav.jsp" %>
                </nav>

                <aside>
                    <%@include file="../includes/_aside.jsp" %>
                </aside>

                <section class="content">
                    <h1>Thank you for your order!</h1>
                    <div id="order">
                        <h3>Your order number is: <%=order.getId()%></h3>
                        <h3>Time of order: <%=order.getDateTime()%></h3>
                        <div id="client_info">
                            <h2>Your information</h2>
                            <p>Full name: <%=user.getFirstName() + " " + user.getLastName()%></p>
                            <p>Email address: <%=user.getEmail()%></p>
                            <p>Telephone number: 0000000000</p>
                            <p>Address: <%=user.getAddress()%></p>
                        </div>
                        <div id="order_information">
                            <h2>Order information</h2>
                            <table>
                                <% for (HashMap.Entry<Integer, Item> pair : cart.entrySet()) {%>
                                <tr>
                                    <td><img src="images/products/<%=pair.getValue().getImgUrl()%>" /> <p><%=pair.getValue().getName()%></p></td>
                                    <td><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(pair.getValue().getPrice())%></td>
                                    <td>
                                        <div class="qty_buttons">
                                            <input type="text" name="quantity" value="<%=pair.getValue().getQty()%>" disabled>
                                        </div>
                                    </td>
                                    <%
                                        itemsPrice = (pair.getValue().getPrice() * pair.getValue().getQty());
                                        itemsPrice = Math.round(itemsPrice * 100);
                                        itemsPrice = itemsPrice / 100;
                                        totalPrice += itemsPrice;
                                    %>
                                    <td><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(itemsPrice)%></td>                                   
                                </tr>
                                <%}%>
                                <tr id="total">
                                    <td colspan="5">Total: <%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(totalPrice)%></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </section>
                <%cart.clear();%>
            </div>

            <footer>
                <%@include file="../includes/_footer.jsp" %>
            </footer>
        </main>
    </body>
</html>
