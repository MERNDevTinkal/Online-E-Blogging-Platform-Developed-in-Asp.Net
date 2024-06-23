<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
 
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string cond = " 1 = 1 ";

        if (txtTitle.Text.Length > 0)
            cond += " and title like '%" + txtTitle.Text + "%'";

        if (txtAuthor.Text.Length > 0)
            cond += " and fname like '%" + txtAuthor.Text + "%'";

        if (txtFromDate.Text.Length > 0)
            cond += " and postedon >='" + txtFromDate.Text + "'";

        if (txtToDate.Text.Length > 0)
            cond += " and postedon <='" + txtToDate.Text + "'";

        // get data from database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select u.uid, bid,title,fname,postedon from users u, blogs b where u.uid = b.uid and " + cond, con);
        DataSet ds = new DataSet();
        da.Fill(ds, "blogs");

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
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
            Search Blogs</h2>
        <table>
            <tr>
                <td style="width: 100px">
                    Title :</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Width="204px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 18px">
                    Author Name :
                </td>
                <td style="height: 18px">
                    <asp:TextBox ID="txtAuthor" runat="server" Width="205px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    From Date :
                </td>
                <td>
                    <asp:TextBox ID="txtFromDate" runat="server" Width="86px"></asp:TextBox>
                    (MM/DD/YY)&nbsp; To Date :
                    <asp:TextBox ID="txtToDate" runat="server" Width="90px"></asp:TextBox>
                    (MM/DD/YY)</td>
            </tr>
        </table>
    
    </div>
        <br />
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" /> &nbsp; &nbsp; <a href="login.aspx">Go Back</a>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" Cellpadding="5" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="bid" DataNavigateUrlFormatString="showblog.aspx?bid={0}"
                    DataTextField="title" HeaderText="Title" />
                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="showuser.aspx?uid={0}"
                    DataTextField="fname" HeaderText="Author" />
                <asp:BoundField DataField="postedon" HeaderText="Posted On" />
            </Columns>
            <HeaderStyle BackColor="#404040" ForeColor="White" />
        </asp:GridView>
    </form>
</body>
</html>
