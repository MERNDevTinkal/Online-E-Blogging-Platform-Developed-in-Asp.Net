<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select uid, fname from users where email = @email and pwd = @pwd", con);
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 50).Value = txtPwd.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) // valid user
            {
                Session.Add("uid", dr["uid"]);
                Session.Add("fname", dr["fname"]);
                FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, false);
            }
            else
                lblMsg.Text = "Invalid Login!";  
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            YOURBLOGS.COM</h1>
        <table width="100%" height="600px">
            <tr>
                <td width="70%" valign="top">
                    <h2>
                        What is this?<br />
                    </h2>
                    This is the place to post your blogs. Blogging is as simple as taking two steps:<br />
                    <br />
                    <ul>
                        <li>Register as a user for free</li>
                        <li>Start posting your blogs.</li>
                    </ul>
                    <h2>
                        Recently Posted Blogs</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bid,uid"
                        DataSourceID="SqlDataSource1" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="bid" HeaderText="bid" ReadOnly="True" SortExpression="bid"
                                Visible="False" />
                            <asp:BoundField DataField="uid" HeaderText="uid" ReadOnly="True" SortExpression="uid"
                                Visible="False" />
                            <asp:HyperLinkField DataNavigateUrlFields="bid" DataNavigateUrlFormatString="all/showblog.aspx?bid={0}"
                                DataTextField="title" HeaderText="Title" />
                            <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="all/showuser.aspx?uid={0}"
                                DataTextField="fname" HeaderText="Author" />
                            <asp:BoundField DataField="postedon" HeaderText="postedon" ReadOnly="True" SortExpression="postedon" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="select  top 5 bid, u.uid,title, fname, postedon = convert( varchar(10), postedon, 3) from blogs b, users u&#13;&#10;where  b.uid = u.uid order by bid desc">
                    </asp:SqlDataSource>
                    
                    <br />
                    <a href="all/searchblogs.aspx">Search Blogs</a>
                </td>
                <td valign="top" style="background-color:wheat">
                    <h3>
                        Login</h3>
                    Email Address<br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required!" ControlToValidate="txtEmail"></asp:RequiredFieldValidator><br />
                    Password<br />
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required!" ControlToValidate="txtPwd"></asp:RequiredFieldValidator><br />
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br />
                    <br />
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label><br />
                    <br />
                    <a href="all/forgotpassword.aspx">Forgot Password?</a> 
                    <br />
                    <a href="all/register.aspx">Register!</a> 
                    
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
