<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script runat="server">

    protected void btnChange_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update users set pwd = @newpwd where uid = @uid and pwd = @oldpwd", con);
            cmd.Parameters.Add("@uid", SqlDbType.VarChar, 10).Value = Session["uid"];
            cmd.Parameters.Add("@oldpwd", SqlDbType.VarChar, 10).Value = txtOldPwd.Text; 
            cmd.Parameters.Add("@newpwd", SqlDbType.VarChar, 10).Value = txtNewPwd.Text;
            if (cmd.ExecuteNonQuery() == 1)
                lblMsg.Text = "Password changed successfully!";
            else
                lblMsg.Text = "Old password is incorrect. Please try again!";  
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error-->" + ex.Message;
        }
        finally
        {
            con.Close();
        }

    }
</script>

    <h2>
        Change Password</h2>
    <p>
        <table>
            <tr>
                <td>
                    Enter old password :</td>
                <td>
                    <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd"
                        Display="None" ErrorMessage="Old Password Is Required!"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    Enter new password :
                </td>
                <td>
                    <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd"
                        Display="None" ErrorMessage="New  Password Is Required!"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    Enter new password again :
                </td>
                <td>
                    <asp:TextBox ID="txtNewPwd2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPwd2"
                        Display="None" ErrorMessage="Re-enter New  Password Is Required!"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPwd"
                        ControlToValidate="txtNewPwd2" Display="None" ErrorMessage="New and re-enter passwords do not match!"></asp:CompareValidator></td>
            </tr>
        </table>
    </p>
    <p>
        <asp:Button ID="btnChange" runat="server" OnClick="btnChange_Click" Text="Change Password" />&nbsp;</p>
    <p>
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True"></asp:Label>&nbsp;</p>
    <p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </p>
</asp:Content>

