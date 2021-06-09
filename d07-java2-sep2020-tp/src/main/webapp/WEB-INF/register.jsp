<%
    ArrayList<String> errorMessages = (ArrayList<String>) request.getAttribute("errorFields");
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
                    <h1>Register on Placeholder Computer today!</h1>
                    <div id="account_form">
                        <form action="registerController" method="post">
                            <fieldset id="contact_fields">
                                <ul id="error_messages">
                                    <% if (errorMessages != null) {
                                            for (String i : errorMessages) {%>
                                    <li><%=i%></li>
                                        <% }
                                        }%>
                                </ul>
                                <label for="firstName">
                                    <span>First name <span class="required">*</span></span>
                                    <input placeholder="Your first name" type="text" class="input-field" id="firstName" name="firstName" value="" autofocus />
                                </label>

                                <label for="lastName">
                                    <span>Last name <span class="required">*</span></span>
                                    <input placeholder="Your last name" type="text" class="input-field" id="lastName" name="lastName" value="" />
                                </label>

                                <label for="email">
                                    <span>Email <span class="required">*</span></span>
                                    <input placeholder="Your email address" type="email" class="input-field" id="email" name="email" value="" />
                                </label>

                                <label for="password">
                                    <span>Password <span class="required">*</span></span>
                                    <input placeholder="Your password" type="password" class="input-field" id="password" name="password" value="" />
                                </label>

                                <label for="confirmPassword">
                                    <span>Confirm password <span class="required">*</span></span>
                                    <input placeholder="Confirm your password" type="password" class="input-field" id="confirmPassword" name="confirmPassword" value="" /> 
                                </label>

                                <label for="phone_number">
                                    <span>Phone number </span>
                                    <input placeholder="Your phone number (optional)" type="text" class="input-field" id="phone_number" name="field3" value="" />
                                </label>

                                <label for="address">
                                    <span>Address  <span class="required">*</span></span>
                                    <textarea placeholder="Your address" name="address" id="address" class="textarea-field"  ></textarea>
                                </label>
                            </fieldset>

                            <div>
                                <fieldset>
                                    <input type="submit" name="create" value="Create Account" />
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