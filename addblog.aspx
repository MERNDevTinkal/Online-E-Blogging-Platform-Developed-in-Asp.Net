<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void btnPost_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("addblog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@userid", SqlDbType.Int).Value = Session["uid"];
            cmd.Parameters.Add("@title", SqlDbType.VarChar,100).Value = txtTitle.Text;
            cmd.Parameters.Add("@text", SqlDbType.Text).Value = txtText.Text;
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Blog has been posted successfully! Click <a href=default.aspx>here</a> to continue..";  
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

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Add Blog</h2>
    Title<br />
    <asp:TextBox ID="txtTitle" runat="server" Width="498px"></asp:TextBox><br />
    Text<br />
    <asp:TextBox ID="txtText" runat="server" Height="140px" TextMode="MultiLine" Width="498px"></asp:TextBox><br />
    <br />
    <asp:Button ID="btnPost" runat="server" OnClick="btnPost_Click" Text="Post Blog" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label><br />
</asp:Content>

