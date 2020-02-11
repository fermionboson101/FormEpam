function userValid() {
    var firstName, lastName,EmailId, phone;
    firstName = document.getElementById("FirstName").value;
    lastName = document.getElementById("LastName").value;
    email = document.getElementById("Email").value;
    phone = document.getElementById("Phone").value;
  
    if (firstName == '' || lastName == '' || email =='' || phone == '') {
        alert("Enter All Fields");
        return false;
    }  
    return true;
}