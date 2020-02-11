<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FormEpam.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Epam Registration Form</title>
    <link href="Style.css" rel="stylesheet"/>
    <script src="UserValidate.js" type="text/javascript"> </script>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="Container">
                   <fieldset id="User Form" style="width: 60%">
                    <legend>User Registration Form</legend>

                <div class="inner" id="RegisterButton">
                        <asp:TextBox ID="FirstName" runat="server" placeholder="First Name"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name Required" ControlToValidate="FirstName">
                        </asp:RequiredFieldValidator>
                    <br />
                        <asp:TextBox ID="MidName" runat="server" placeholder="Middle Name" style="margin-top: 10px; margin-left: -140px; margin-bottom: 0px;"></asp:TextBox>

                    <br />
                        <asp:TextBox ID="LastName" runat="server" placeholder="Last Name" style="margin-top: 10px; margin-left: -5px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="Last Name Required" ControlToValidate="LastName">
                        </asp:RequiredFieldValidator>
                        <br/>
                        <br/>
                        <asp:TextBox ID="Email" runat="server"  TextMode="Email"  placeholder="email@example.com" style="margin-left: 8px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Enter an email address" ControlToValidate="Email"></asp:RequiredFieldValidator>
                        <br/>
                        <br/>
                        <asp:TextBox ID="Phone" runat="server" OnTextChanged="TextBox1_TextChanged1" TextMode="Phone"  placeholder="+91" style="margin-left: 4px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ErrorMessage="Enter a phone number" ControlToValidate="Phone"></asp:RequiredFieldValidator>
   
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" style="margin-top: 30px; margin-left: 380px; margin-bottom: 0px;" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged1">
                            <asp:ListItem Text="Male" value="1"></asp:ListItem>
                            <asp:ListItem Text="Female" value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ErrorMessage="Select a gender" ControlToValidate="RadioButtonList1">
                    </asp:RequiredFieldValidator>
                    <div style="margin-top: 0px; margin-left: 260px; margin-bottom: 0px;">
                        <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged" DataSourceID="SqlDataSourceCountries" DataTextField="country" DataValueField="countryID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCountries" runat="server" ConnectionString="<%$ ConnectionStrings:CountriesConnectionString %>" SelectCommand="SELECT [country], [countryID] FROM [countries]"></asp:SqlDataSource>
                        <br/>
                        <br/>
                        <asp:DropDownList ID="StateDropDownList" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCountryState" DataTextField="state" DataValueField="stateID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCountryState" runat="server" ConnectionString="<%$ ConnectionStrings:CountriesConnectionString %>" SelectCommand="SELECT [stateID], [state] FROM [countryState] WHERE ([countryID] = @countryID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="CountryDropDownList" Name="countryID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br/>
                        <br/>

                        <asp:DropDownList ID="CityDropDownList" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCityStateCountry" DataTextField="city" DataValueField="cityID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCityStateCountry" runat="server" ConnectionString="<%$ ConnectionStrings:CountriesConnectionString %>" SelectCommand="SELECT DISTINCT [cityID], [city] FROM [cityState] WHERE (([countryID] = @countryID) AND ([stateID] = @stateID))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="CountryDropDownList" Name="countryID" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="StateDropDownList" Name="stateID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                        <asp:Calendar ID="DOB" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="282px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" style="margin-top:-100px; margin-left: 700px; margin-bottom: 0px;" Width="295px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                        <asp:Button ID="Button1" runat="server"  Text="Register" OnClick="Button1_Click2" />

                        <asp:CheckBoxList ID="StreamCheckBoxList" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" Width="342px" Height="99px" RepeatLayout="OrderedList" TextAlign="Left" style="margin-top: -200px; margin-left: 20px; margin-bottom: 0px;">
                            <asp:ListItem>Java</asp:ListItem>
                            <asp:ListItem>SDET</asp:ListItem>
                            <asp:ListItem>.NET</asp:ListItem>
                            <asp:ListItem>DEP</asp:ListItem>
                        </asp:CheckBoxList>
                </div>
                       </fieldset>
            </div>
        </section>
    </form>
</body>
</html>
