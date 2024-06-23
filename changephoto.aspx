<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // check whether file is uploaded
        if (!FileUpload1.HasFile)
        {
            lblMsg.Text = "Please select your photo file!";
            return;
        }
        SqlConnection con = new SqlConnection(Database.ConnectionString); 
        try
        {
            String filename = Request.MapPath("photos/" + Session["uid"].ToString() + ".jpg");
            FileUpload1.SaveAs(filename);
            // update PHOTO column
            con.Open();
            SqlCommand cmd = new SqlCommand("update users set photo = 'y' where uid = " + Session["uid"].ToString(), con);
            if (cmd.ExecuteNonQuery() == 1)
                lblMsg.Text = "Photo is uploaded successfully!";
            else
                lblMsg.Text = "Sorry! Could not upload photo. Please try again!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error->" + ex.Message;
        }
        finally
        {
            con.Close();
        } 
              
      

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Change Photo</h2>
    <p>
        Select your photo :
        <asp:FileUpload ID="FileUpload1" runat="server" /></p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />&nbsp;</p>
    <p>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>&nbsp;</p>
</asp:Content>

