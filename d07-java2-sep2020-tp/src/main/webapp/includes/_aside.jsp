<%@page import="model.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Category> asideCategories = (ArrayList<Category>) request.getAttribute("asideCategories");
%>
<h3>Popular Categories</h3>
<ul>
    <%if (asideCategories != null) {
            for (Category c : asideCategories) {%>
    <li><a href="productController?category_id=<%=c.getId()%>" title="CPU Category"><%=c.getDescription()%></a></li>
    <%}
                                    }%>
</ul>