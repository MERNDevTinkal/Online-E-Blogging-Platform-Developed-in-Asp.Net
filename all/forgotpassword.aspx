<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System.Net.Mail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select pwd from users where email = @email", con);
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
            Object pwd = cmd.ExecuteScalar();
            if ( pwd == null ) {
                lblMsg.Text = "Sorry! Invalid Email Account";
                return;
            }
            // send mail
            MailMessage msg = new MailMessage();
            msg.To.Add( new MailAddress(txtEmail.Text));
            msg.From = new MailAddress("admin@classroom.com");
            msg.Subject = "Password Recovery";
            msg.IsBodyHtml = true;
            msg.Body = "Dear User, <p/>Use following password to login.<p/>Password :  " + pwd.ToString() + "<p/>Webmaster<br/>yourblogs.com";
            SmtpClient server  = new SmtpClient("localhost");
            server.Send(msg);
            lblMsg.Text = "Your password is sent to your email. Use it to login!<p><a href=../login.aspx>Login</a>";
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
        <h2>
            Password Recovery</h2>
        <p>
            Enter your email address :
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></p>
        <p>
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </p>
        <p>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>&nbsp;</p>
    
    </div>
    </form>
</body>
</html>
