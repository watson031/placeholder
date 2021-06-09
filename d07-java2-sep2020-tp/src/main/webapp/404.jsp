<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/_head.jsp" %>
    </head>
    <body>
        <main>
            <div id="error_page">
                <section class="error">
                    <img src="images/errors/404.png" alt="Error 404" />
                    <form action="indexController" method="post">                    
                        <input type="submit" value="Return to Index" />
                    </form>
                </section>

            </div>
        </main>
    </body>
</html>