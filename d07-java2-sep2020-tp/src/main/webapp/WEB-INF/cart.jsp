<%@page import="java.util.HashMap"%>
<%@page import="model.entities.Item"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
    double itemsPrice = 0;
    double totalPrice = 0;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/_head.jsp" %>
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
                        <%if (cart == null || cart.isEmpty()) { %>
                        <h1>Your cart is empty!</h1>
                        <%} else {%>
                        <table>
                            <tr>
                                <th class="prod_name">Item name</th>
                                <th class="prod_price">Price</th>
                                <th class="prod_quantity">Quantity</th>
                                <th class="full_price">Total price</th>
                                <th class="delete">Delete</th>
                            </tr>
                            <% for (HashMap.Entry<Integer, Item> pair : cart.entrySet()) {%>
                            <tr>
                                <td><img src="images/products/<%=pair.getValue().getImgUrl()%>" /> <p><%=pair.getValue().getName()%></p></td>
                                <td><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(pair.getValue().getPrice())%></td>
                                <td>
                                    <div class="qty_buttons">
                                        <form action="cartController" method="post">
                                            <input name="prodId" type="hidden" value="<%=pair.getValue().getId()%>">
                                            <input type="submit" value="-" name="action" <%=pair.getValue().getQty() == 1 ? "disabled" : ""%>>
                                            <input type="text" name="quantity" value="<%=pair.getValue().getQty()%>" disabled>
                                            <input type="submit" value="+" name="action">
                                        </form>
                                    </div>
                                </td>
                                <%
                                    itemsPrice = (pair.getValue().getPrice() * pair.getValue().getQty());
                                    itemsPrice = Math.round(itemsPrice * 100);
                                    itemsPrice = itemsPrice / 100;
                                    totalPrice += itemsPrice;
                                %>
                                <td><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(itemsPrice)%></td>
                                <td>
                                    <div class="qty_buttons">
                                        <form action="cartController" method="post">
                                            <input name="prodId" type="hidden" value="<%=pair.getValue().getId()%>">
                                            <input type="submit" value="x" name="action">
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%}%>
                            <tr id="total">
                                <td colspan="5">Total: <%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(totalPrice)%></td>
                            </tr>
                        </table>
                        <form action="orderController" method="post">
                            <div id="order_button">
                                <fieldset>
                                    <input type="submit" value="Place Order" name="submit" />
                                </fieldset>
                            </div>
                        </form>
                        <%}%>
                </section>
            </div>
            <footer>
                <%@include file="../includes/_footer.jsp" %>
            </footer>
        </main>
    </body>
</html>