<%@include file="common/header.jspf" %>
<div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-4 col-lg-5 col-md-6 col-7 card">

            <c:if test="${not empty msg}">
                ${msg}
            </c:if>


            <form action="${formAction}" method="post" modelAttribute="user">
                <%--    modelAttribute="reg_form"--%>
                <legend>${pageTitle}</legend>
                <fieldset class="form-group">
                    <%--        <form:errors path="username" class="error" />--%>
                    <input type="text" name="username" id="username" tabindex="1" class="form-control"
                           placeholder="Username"/>
                </fieldset>

                <c:if test="${loginPage}">
                    <fieldset class="form-group">
                        <input type="email" name="email" id="email" tabindex="1" class="form-control"
                               placeholder="Email Address"/>
                    </fieldset>
                </c:if>


                <fieldset class="form-group">
                    <input type="password" name="password" id="password" tabindex="2" class="form-control"
                           placeholder="Password"/>

                </fieldset>
                <fieldset class="form-group">
                    <input type="password" name="confirmPassword" id="confirm-password" tabindex="2"
                           class="form-control"
                           placeholder="Confirm Password"/>

                </fieldset>
                    <c:if test="${not empty passwordNotMatch}">
                        <div class="alert alert-danger alert-dismissible fade show">
                            <strong>Error!</strong> ${passwordNotMatch}
                        </div>
                    </c:if>

                <fieldset class="form-group">
                    <%--                    <div class="row">--%>
                    <%--                        <div class="col-sm-offset-3">--%>
                    <input type="submit" name="register-submit" id="register-submit" tabindex="4"
                           class="form-control btn btn-success" value="${pageTitle}"/>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                </fieldset>
            </form>
            <a class="center-block outline col-lg-offset-12 text-center"
               href="${switchLoginSignUpAction}">${switchLoginSignUpLabel}</a>
        </div>
    </div>
</div>
<%@include file="common/footer.jspf" %>