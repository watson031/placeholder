<%@page import="model.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
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
                    <h1>Product Categories</h1>
                    <div id="categories">
                        <%if (categories != null) {
                                for (Category c : categories) {%>
                        <a href="productController?category_id=<%=c.getId()%>" title="<%=c.getDescription()%>" name="category_id">
                            <div class="category">
                                <h3><%=c.getDescription()%></h3>
                                <div><img alt="Gallery Product 1" src="images/categories/150x150/<%=c.getImg_url()%>"></div>
                            </div>
                        </a>
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
