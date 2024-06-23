<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
<h2>User Profile</h2>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="100%">
            <ItemTemplate>
            <table width="100%">
            <tr>
           <td>
            <img width="200" height ="200" src='../photos/<%# Eval("uid")%>.jpg' />
           </td>
          <td>
            <table cellpadding="5" border="1"> 
            <tr>
             <td style="font-weight:700">First Name </td> 
             <td><%#Eval("fname") %></td> 
            </tr> 
           <tr>
             <td style="font-weight:700">Last Name </td> 
             <td><%#Eval("lname") %></td> 
            </tr>  
           <tr>
             <td style="font-weight:700"> Email Address</td> 
             <td><%#Eval("email") %></td> 
            </tr>  
           
           <tr>
             <td style="font-weight:700"> Location</td> 
             <td><%#Eval("location") %></td> 
            </tr>  
           
           <tr>
             <td style="font-weight:700">Occupation</td> 
             <td><%#Eval("occupation") %></td> 
            </tr>  
           
           <tr>
             <td style="font-weight:700">Joined On</td> 
             <td><%#Eval("dj") %></td> 
            </tr>  
           </table> 
          </td> 
            </tr> 
            </table>
            </ItemTemplate>
        </asp:FormView>
     <p />
     <a href="../login.aspx">Go Back</a>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT uid,[email], [occupation], [fname], [lname], [dj], [location] FROM [users] WHERE ([uid] = @uid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
