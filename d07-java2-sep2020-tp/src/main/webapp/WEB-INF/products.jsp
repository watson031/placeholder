<%@page import="model.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
    double promoPrice;
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
                    <h1>All products</h1>
                    <div id="products" name="prod_type">
                        <%if (products != null) {
                                for (Product p : products) {%>
                        <a href="productController?product_id=<%=p.getId()%>">
                            <div class="product" >
                                <h3><%=p.getName()%></h3>
                                <img src="images/products/<%=p.getImgUrl()%>" alt="<%=p.getName()%>" />
                                <p><%=p.getDescription()%></p>

                                <div class="prod_footer">
                                    <div>
                                        <% if (p.getPromo() > 0) {%>
                                        <p class="full_price"><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(p.getPrice())%></p>
                                        <%promoPrice = p.getPrice() - (p.getPrice() * p.getPromo());
                                            promoPrice = Math.round(promoPrice * 100);
                                            promoPrice /= 100;
                                        %>
                                        <p class="promo_price"><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(promoPrice)%></p>
                                        <%} else {%>
                                        <p class="promo_price"><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(p.getPrice())%></p>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <%}
                        } else {%>
                        <h3>No products found for this category!</h3>
                        <%}%>

                    </div>

                </section>

            </div>

            <footer>
                <%@include file="../includes/_footer.jsp" %>
            </footer>
        </main>
    </body>
</html>