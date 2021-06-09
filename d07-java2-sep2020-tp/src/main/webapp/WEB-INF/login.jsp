<%
    String userEmail = (String) request.getAttribute("emailUser");
    Boolean isLoggedIn = (Boolean) request.getAttribute("isLoggedIn");
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
                    <h1>Login to your Placeholder Computer account</h1>
                    <div id="account_form">
                        <% if (isLoggedIn != null) {%>
                        <% if (isLoggedIn == false) {%>
                        <div id="invalid_login">
                            <p>Invalid email and/or password!</p>
                        </div>
                        <% }  %>
                        <% }%>
                        <form action="loginController" method="post">
                            <fieldset id="contact_fields">
                                <label for="email">
                                    <span>Email address</span>
                                    <input placeholder="youremail@email.com" type="email" class="input-field" id="email" name="email" value="<%=userEmail != null ? userEmail : ""%>" <%=userEmail == null ? "autofocus" : ""%> required />
                                </label>

                                <label for="password">
                                    <span>Password </span>
                                    <input placeholder="Password" type="password" class="input-field" id="password" name="password" value="" <%=userEmail == null ? "" : "autofocus"%> required />
                                </label>

                            </fieldset>

                            <fieldset id="remember_me">
                                <input type="checkbox" id="remember" name="remember" value="remember" checked >
                                <label for="remember">Remember me</label>
                            </fieldset>

                            <div>
                                <fieldset>
                                    <input type="submit" value="Login" />
                                </fieldset>
                            </div>
                        </form>
                    </div>
                </section>
            </div>

            <footer>
                <%@include file="../includes/_footer.jsp" %>
            </footer>
        </main>
    </body>
</html>