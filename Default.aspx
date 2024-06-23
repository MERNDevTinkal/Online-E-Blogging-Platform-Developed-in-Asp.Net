<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      //   Response.Write(e.Keys[0]);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        My Blogs</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="bid" width="100%" EmptyDataText="No blogs found!" OnRowDeleting="GridView1_RowDeleting" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="2px">
            <Columns>
                <asp:BoundField DataField="bid" HeaderText="bid" ReadOnly="True" SortExpression="bid"
                    Visible="False" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="postedon" HeaderText="Posted On" SortExpression="postedon" />
                <asp:HyperLinkField DataNavigateUrlFields="bid" DataNavigateUrlFormatString="editblog.aspx?bid={0}"
                    Text="Edit" />
                <asp:HyperLinkField DataNavigateUrlFields="bid" DataNavigateUrlFormatString="comments.aspx?bid={0}"
                    Text="Comments" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EmptyDataRowStyle Font-Bold="True" Font-Names="verdana" Font-Size="12pt" ForeColor="Red" />
            <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
        </asp:GridView>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [bid], [title], [postedon] FROM [blogs] WHERE ([uid] = @uid) ORDER BY [postedon] DESC" DeleteCommand="DeleteBlog" DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="uid" SessionField="uid" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="bid" Type="Int32"/>
            </DeleteParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

