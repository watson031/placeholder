<%@page import="model.entities.Service"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Service> services = (ArrayList<Service>) request.getAttribute("services");
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
                    <h1>Services</h1>

                    <div id="services">

                        <table>
                            <thead>
                                <tr>
                                    <th>Service</th>
                                    <th>Price</th>
                                    <th>Delay</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%if (services != null) {
                                        for (Service s : services) {%>
                                <tr>
                                    <td><%=s.getName()%></td>
                                    <td>$<%=s.getPrice()%></td>
                                    <td><%=s.getDelay()%></td>
                                </tr>
                                <%}
                                    }%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="3"></th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>

                </section>
            </div>

            <footer>
                <%@include file="../includes/_footer.jsp" %>
            </footer>
        </main>
    </body>
</html>
