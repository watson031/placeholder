<%
    Boolean emailSent = (Boolean) request.getAttribute("emailSent");
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
                    <h1>Contact Us</h1>
                    <div id="contact_us">
                        <div>
                            <div>
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2795.2267073633484!2d-73.55348038423163!3d45.52564323736196!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4cc918e0c061b07f%3A0x647a6b6d7cb681a7!2sISI%2C%20L&#39;institut%20Sup%C3%A9rieur%20d&#39;Informatique!5e0!3m2!1sen!2sca!4v1597840264772!5m2!1sen!2sca"
                                    width="250" height="250" style="border:0;" allowfullscreen="" aria-hidden="false"
                                    tabindex="0"></iframe>
                                <div>
                                    <p>Placeholder Computers</p>
                                    <p>123 De la Whatever</p>
                                    <p>Montreal, Quebec</p>
                                    <p> Tel: 514-123-4567</p>
                                </div>
                            </div>
                        </div>
                        <form action="contactUsController" method="post">
                            <fieldset id="contact_fields">

                                <label for="full_name">
                                    <span>Name <span class="required">*</span></span>
                                    <input placeholder="Full name" type="text" class="input-field" id="full_name" name="full_name" value="" autofocus />
                                </label>

                                <label for="email">
                                    <span>Email <span class="required">*</span></span>
                                    <input placeholder="email@email.com" type="email" class="input-field" id="email" name="email" value="" />
                                </label>

                                <label for="phone_number">
                                    <span>Phone number <span class="required">*</span></span>
                                    <input placeholder="(123)123-4567" type="text" class="input-field" id="phone_number" name="phone_number" value="" />
                                </label>

                                <label for="contact_method">
                                    <span>Contact method</span>
                                    <select name="contact_method" id="contact_method" class="select-field">
                                        <option value="phone">Phone</option>
                                        <option value="email">Email</option>
                                    </select>
                                </label>

                                <label for="message">
                                    <span>Message <span class="required">*</span></span>
                                    <textarea placeholder="Please enter your message here" name="message" id="message" class="textarea-field"></textarea>
                                </label>
                            </fieldset>

                            <fieldset id="contact_time">
                                <legend>Preferred time of contact</legend>
                                <input type="radio" id="day" name="contact_time" value="day" checked>
                                <label for="day">Day</label>
                                <input type="radio" id="afternoon" name="contact_time" value="afternoon">
                                <label for="afternoon">Afternoon</label>
                            </fieldset>

                            <fieldset id="commentcheck">
                                <input type="checkbox" id="comment" name="comment" value="comment">
                                <label for="comment">Comment only (do not contact)</label>
                            </fieldset>
                            
                            <% if (emailSent != null) {%>
                            <div id="confirmation">
                                <p>Your communication was sent sucessfully!</p>
                            </div>
                            <% }%>
                            <div>
                                <fieldset>
                                    <input type="submit" value="Submit" name="submit" />
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