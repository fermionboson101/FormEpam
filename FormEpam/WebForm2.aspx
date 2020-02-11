<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="FormEpam.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script src="Scripts\jquery-3.4.1.js" type="text/javascript"> </script> 
    <script src=" Scripts\jquery.validate.js" type="text/javascript"> </script> 
                      <script type="text/javascript">
                          $(document).ready(function () {
                              $('#Login').click(function () {
                                  var userName = $('#userName').val();
                                  var passWord = $('#password').val();
                                  if (!userName || !passWord) {
                                      alert("Please enter the both username and password");
                                      return false;
                                  }
                                  return true;
                              })
                          })
                        //Jquery Validation
                      </script>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 25%;
        }
        .auto-style2 {
            width: 68px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Username</td>
                <td>
                    <asp:TextBox ID="userName" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td>
                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="Login" runat="server" OnClick="Button1_Click" Text="Login" />
        <br />
        Try&nbsp;[&#39; or 1=1--] in username, It will Login</form>
    <p>
        Try [&#39;; delete from users;--] in username, It will delete all the tables</p>
</body>
</html>
