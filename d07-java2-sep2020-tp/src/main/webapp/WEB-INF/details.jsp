<%@page import="java.util.ArrayList"%>
<%@page import="model.entities.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    Product product = (Product) request.getAttribute("product");
    double promoPrice = 0;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/_head.jsp" %>
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
                    <h1>Product Details</h1>
                    <div id="product_detail">

                        <h1><%=product.getName()%></h1>
                        <img src="images/products/<%=product.getImgUrl()%>" alt="<%=product.getName()%>" />
                        <p><%=product.getDescription()%></p>
                        <ul>                           
                            <li><%=product.getSpec_1()%></li>
                            <li><%=product.getSpec_2()%></li>
                            <li><%=product.getSpec_3()%></li>
                            <li><%=product.getSpec_4()%></li>
                            <li><%=product.getSpec_5()%></li>
                        </ul>

                        <div class="stock">
                            <p>Current Stock: <%=product.getStock()%></p>
                            <fieldset>
                                <form action="cartController" method="post">
                                    <input id="action" name="action" type="hidden" value="add">
                                    <input id="prodId" name="prodId" type="hidden" value="<%=product.getId()%>">
                                    <input type="submit" value="Add to Cart"/>
                                </form>
                            </fieldset>
                        </div>

                        <div class="prices">
                            <div>
                                <% if (product.getPromo() > 0) {%>
                                <h2>Promotion!!</h2>
                                <p class="full_price"><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(product.getPrice())%></p>
                                <%promoPrice = product.getPrice() - (product.getPrice() * product.getPromo());
                                    promoPrice = Math.round(promoPrice * 100);
                                    promoPrice = promoPrice / 100;
                                %>                                             
                                <p class="promo_price"><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(promoPrice)%></p>
                                <%} else {%>
                                <h2>Regular Price:</h2>
                                <p class="promo_price"><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(product.getPrice())%></p>
                                <%}%>
                            </div>
                        </div>
                    </div>

            </div>

        </section>

    </div>

    <footer>
        <%@include file="../includes/_footer.jsp" %>
    </footer>
</main>
</body>
</html>