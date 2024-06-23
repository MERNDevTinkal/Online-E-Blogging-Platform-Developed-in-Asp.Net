<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("addcomment", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@bid", SqlDbType.Int).Value = Request.QueryString["bid"];
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = txtEmail.Text;
            cmd.Parameters.Add("@text", SqlDbType.Text).Value = txtText.Text;
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Comment has been posted successfully!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error ->" + ex.Message;
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="bid" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <h2><%# Eval("title") %></h2>
                <h4>Author : <%# Eval("fname")%>  Posted On : <%# Eval("postedon") %></h4>
                
                <%# Eval("text") %>
            </ItemTemplate>
        </asp:FormView>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="select bid, title,postedon, text, fname from users u, blogs b&#13;&#10;where u.uid = b.uid and bid = @bid">
            <SelectParameters>
                <asp:QueryStringParameter Name="bid" QueryStringField="bid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p />
        <a href="../login.aspx">Go Back</a>
        <h4>
            Add Comment</h4>
        <p>
            <table>
                <tr>
                    <td style="width: 135px">
                        Email Address :</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtEmail" runat="server" Width="280px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 135px">
                        Comment :
                    </td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtText" runat="server" Height="59px" TextMode="MultiLine" Width="540px"></asp:TextBox></td>
                </tr>
            </table>
        </p>
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Comment" /><br />
        <br />
        <asp:Label ID="lblMsg" runat="server"></asp:Label><br />
        
    </form>
</body>
</html>
