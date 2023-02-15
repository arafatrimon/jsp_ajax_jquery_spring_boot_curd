<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>

<head>
    <title>Student Management</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.css"
          integrity="sha512-YdYyWQf8AS4WSB0WWdc3FbQ3Ypdm0QCWD2k4hgfqbQbRCJBEgX0iAegkl2S1Evma5ImaVXLBeUkIlP6hQ1eYKQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .footer {

            left: 0;
            bottom: 0;
            width: 100%;
            background-color: black;
            color: white;
            height: 100px;
            text-align: center;
        }
    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/list">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/form">Register Student</a>
            </li>

        </ul>


        <p style="color: white" class="mr-2"> Welcome to <%= session.getAttribute("userName")%>
        </p>


        <form class="form-inline my-2 my-lg-0" action="/list">
            <input class="form-control mr-sm-2" type="search" name="title" id="title" placeholder="Search"
                   aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

            <a class="btn btn-outline-danger" href="/logout">Logout</a>
        </form>
    </div>
</nav>


<div class="container-fluid px-5
 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class=" col-md-6  card">
            <form method="post" id="userForm" name="userForm">

                <div class="mb-3">
                    <input type="hidden" class="form-control" id="id" name="id">
                </div>

                <div class="mb-3">
                    <label for="userName" class="form-label">User Name</label>
                    <input type="text" class="form-control" id="userName" name="userName">

                </div>
                <div class="mb-3">
                    <label for="fatherName" class="form-label">Father Name</label>
                    <input type="text" class="form-control" id="fatherName" name="fatherName">
                </div>
                <div class="mb-3">
                    <label for="motherName" class="form-label">Mother Name</label>
                    <input type="text" class="form-control" id="motherName" name="motherName">
                </div>

                <div class="mb-3">
                    <label for="dateOfBirth" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control"  id="dateOfBirth" name="dateOfBirth">
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address">
                </div>


                <div class="mb-3">
                    <label>Designation:</label>
                    <select class="form-control" name="designation" id="designation">
                        <c:forEach items="${designationList}" var="designationList">
                            <option value="${designationList.value}">${designationList.value}</option>
                        </c:forEach>
                    </select>
                </div>


                <div class="mb-3">
                    <label class="form-label">Gender</label>
                    <div class="form-check-inline ">
                        <c:forEach items="${genderList}" var="genderList">
                            <label class="form-check-label mr-3">
                                <input type="radio" class="form-check-input" name="gender" id="${genderList.value}"
                                       value="${genderList.value}">${genderList.value}
                            </label>
                        </c:forEach>

                    </div>
                </div>


                <div class="mb-3">
                    <label class="form-label">Hobby</label>
                    <div class="form-check-inline">

                        <c:forEach items="${certificateList}" var="certificateList">
                            <label class="form-check-label mr-3">
                                <input type="checkbox" name="certificateList" class="form-check-input"
                                       id="${certificateList.value}"
                                       value="${certificateList.value}">${certificateList.value}
                            </label>
                        </c:forEach>

                    </div>

                </div>

                <button id="saveUser" type="button" class="btn btn-outline-success mt-3">Add User</button>

                <button id="updateUser" type="button" onclick="updateUserBtn()" class="btn btn-outline-success mt-3">
                    Update
                </button>

            </form>
        </div>

        <div class=" col-md-6  card table-responsive ">
            <table class="table">
                <thead>
                <th>User Name</th>
                <th>Father Name</th>
                <th>Mother Name</th>
                <th>Date of Birth</th>
                <th>Address</th>
                <th>Gender</th>
                <th>Designation</th>
                <th>Edu. status</th>
                <th>Action</th>
                </thead>

                <tbody id="userTable">


                </tbody>

            </table>
        </div>
    </div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript">

    $(document).ready(function () {

        getAllUser();


        $('#saveUser').click(function () {


            let myCheckboxes = new Array();
            $('input[name="certificateList"]:checked').each(function () {
                myCheckboxes.push($(this).val());
            });

            $.ajax({

                type: "POST",
                url: "/user/save",
                data: {
                    userName: $('#userName').val(),
                    fatherName: $('#fatherName').val(),
                    motherName: $('#motherName').val(),
                    dateOfBirth: $('#dateOfBirth').val(),
                    address: $('#address').val(),
                    gender: $('input[name="gender"]:checked').val(),
                    designation: $("#designation").val(),
                    educationQualification: myCheckboxes


                    // $('input[type=checkbox]:checked').map(function(_, el) {  return $(el).val();  }).get()

                },
                success: function (response) {
                    $("#userForm")[0].reset();
                    getAllUser();

                },
                error: function (err) {
                    alert("Something went wrong");
                }
            });
        });

    });
    var data = "";

    function getAllUser() {
        $.ajax({
            type: "GET",
            url: "/user/list",

            success: function (response) {

                data = response;
                $('.tr').remove();
                for (i = 0; i < data.length; i++) {
                    $('#userTable').append(
                        '<tr class="tr">' +
                        '<td>' + data[i].userName + '</td>' +
                        '<td>' + data[i].fatherName + '</td>' +
                        '<td>' + data[i].motherName + '</td>' +
                        '<td>' + data[i].dateOfBirth + '</td>' +
                        '<td>' + data[i].address + '</td>' +
                        '<td>' + data[i].gender + '</td>' +
                        '<td>' + data[i].designation + '</td>' +
                        '<td>' + data[i].educationQualification + '</td>' +
                        '<td> ' +

                        '<button class="btn btn-outline-warning btn-sm" onclick="editUser(' + data[i].id + ')"" >Edit</button>' +
                        '<button class="btn btn-outline-danger btn-sm" onclick="deleteUser(' + data[i].id + ')" >Delete</button>'
                        + '</td>'
                        + '</tr>'
                    )
                }
            }
        });
    }

    function editUser(id) {
        $.ajax({
            type: "GET",
            url: "/user/getUser/" + id,
            dataType: 'json',

            success: function (response) {

                let myArray = [];
                $('input[type="checkbox"]').prop('checked', false);

                myArray = response.educationQualification.split(",");
                $("#id").val(id),
                    $("#userName").val(response.userName),
                    $("#fatherName").val(response.fatherName),
                    $("#motherName").val(response.motherName),
                    $("#dateOfBirth").val(response.dateOfBirth),
                    $("#address").val(response.address),
                    $("#designation").val(response.designation),
                    $("#" + response.gender).prop('checked', true).val(response.gender),


                    // $.each(myArray, function (index, value) {
                    //      $("#" + myArray[index]).prop('checked', true).val(value[index]);
                    // });

                    $.map(myArray, function (val, i) {
                        $("#" + myArray[i]).prop('checked', true).val(val);
                    });

            },
            error: function (err) {
                alert("Error is : " + err)
            }
        })
    }


    function updateUserBtn() {
        let myCheckboxes = new Array();
        $('input[name="certificateList"]:checked').each(function () {
            myCheckboxes.push($(this).val());
        });
        $.ajax({
            type: "POST",
            url: "/user/update",

            data: {
                id: $('#id').val(),
                userName: $('#userName').val(),
                fatherName: $('#fatherName').val(),
                motherName: $('#motherName').val(),
                dateOfBirth: $('#dateOfBirth').val(),
                address: $('#address').val(),
                gender: $('input[name="gender"]:checked').val(),
                designation: $("#designation").val(),
                educationQualification: myCheckboxes
            },
            success: function (result) {
                $("#userForm")[0].reset();
                dataType: 'json',
                    getAllUser();
            }
        })
    }


    function deleteUser(id) {
        $.ajax({
            url: "/user/delete/" + id,
            success: function (response) {
                getAllUser();
            },
            error: function (err) {
                alert("error is " + err);
            }
        })
    }


</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/1.1.2/js/bootstrap-multiselect.min.js"
        integrity="sha512-lxQ4VnKKW7foGFV6L9zlSe+6QppP9B2t+tMMaV4s4iqAv4iHIyXED7O+fke1VeLNaRdoVkVt8Hw/jmZ+XocsXQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js"
        integrity="sha512-RCgrAvvoLpP7KVgTkTctrUdv7C6t7Un3p1iaoPr1++3pybCyCsCZZN7QEHMZTcJTmcJ7jzexTO+eFpHk4OCFAg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>--%>


</html>