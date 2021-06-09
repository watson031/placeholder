<%@page import="model.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    ArrayList<Product> indexPromos = (ArrayList<Product>) request.getAttribute("indexPromos");
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
                    <h1>Welcome on Placeholder Computers</h1>
                    <h4>We offer all the computer parts you need! We also offer a wide range of services which you can
                        select upon placing your order!</h4>
                    <h4>Take a look at our current deals down below!</h4>

                    <section class="slideshow">
                        <h2>Weekly Deals!</h2>
                        <div class="slideshow-container slide">
                            <img src="images/slideshow/slideshow1.jpg" alt="Weekly Deal 1" />
                            <img src="images/slideshow/slideshow2.jpg" alt="Weekly Deal 2" />
                            <img src="images/slideshow/slideshow3.jpg" alt="Weekly Deal 3" />
                            <img src="images/slideshow/slideshow4.jpg" alt="Weekly Deal 4" />
                        </div>
                    </section>

                    <div id="deals">
                        <h2>Daily Deals!</h2>
                        <%if (indexPromos != null && indexPromos.size() >= 3) { %>                                
                        <% for (Product p : indexPromos) {%>
                        <article>
                            <a href="productController?product_id=<%=p.getId()%>" title="Daily Deal 1">                                
                                <p class="product_description "><%=p.getName()%></p>
                                <div><img src="images/products/<%=p.getImgUrl()%>" alt="<%=p.getName()%>" /></div>
                                
                                <p class="product_old_price "><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(p.getPrice())%></p>
                                <%promoPrice = p.getPrice() - (p.getPrice() * p.getPromo());
                                    promoPrice = Math.round(promoPrice * 100);
                                    promoPrice = promoPrice / 100;
                                %>
                                <p class="product_price "><%=NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(promoPrice)%></p>
                            </a>
                        </article>
                        <%}
                            }%>
                    </div>
                </section>
            </div>

            <footer>
                <%@include file="../includes/_footer.jsp" %>
            </footer>
        </main>
    </body>
</html>
