<%@include file="common/header.jspf" %>
<%@include file="common/navigation.jspf" %>


<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Employee Name</th>
        <th scope="col">Father Name</th>
        <th scope="col">Mother Name</th>
        <th scope="col">Gender</th>
        <th scope="col">Age</th>
        <th scope="col">Designation</th>
        <th scope="col">Nation Id</th>
        <th scope="col">Date of Birth</th>
        <th scope="col">Contact Number</th>
        <th scope="col">Address</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="employees" items="${employees}" varStatus="index">
        <tr >
            <th scope="row">${index.index+1}</th>
            <td>${employees.name}</td>
            <td>${employees.fatherName}</td>
            <td>${employees.motherName}</td>
            <td>${employees.gender}</td>
            <td>${employees.age}</td>
            <td>${employees.designation}</td>
            <td>${employees.nidNumber}</td>
            <td>${employees.dateOfBirth}</td>
            <td>${employees.contactNumber}</td>
            <td>${employees.address}</td>
            <td>
                <a class="btn btn-primary" href="/edit/${employees.id}">Edit</a>
                <a class="btn btn-danger" onclick="return confirm('Do you really want to delete?')" href="/delete/${employees.id}">Delete</a>
            </td>
        </tr>

    </c:forEach>

    </tbody>
</table>

<%@include file="common/footer.jspf" %>