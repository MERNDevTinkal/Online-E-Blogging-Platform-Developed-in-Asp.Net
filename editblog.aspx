<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" ValidateRequest ="false" %>

<script runat="server">

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
    Edit Blog</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="bid" DataSourceID="SqlDataSource1" DefaultMode="Edit">
          <EditItemTemplate>
            Title <br />
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' Width="300px">
            </asp:TextBox>
            <br /> 
            Text <br />
            <asp:TextBox ID="textTextBox" runat="server" Text='<%# Bind("text") %>' TextMode ="MultiLine" Rows="10" Columns = "50">
            </asp:TextBox>
            <p />
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:Button>
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:Button>
        </EditItemTemplate>
        <ItemTemplate>
            Title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>'></asp:Label><br />
            text:
            <asp:Label ID="textLabel" runat="server" Text='<%# Bind("text") %>'></asp:Label><br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit">
            </asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [blogs] WHERE [bid] = @bid" 
        InsertCommand="INSERT INTO [blogs] ([bid], [title], [text]) VALUES (@bid, @title, @text)"
        SelectCommand="SELECT [bid], [title], [text] FROM [blogs] WHERE ([bid] = @bid)"
        UpdateCommand="UPDATE [blogs] SET [title] = @title, [text] = @text WHERE [bid] = @bid">
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="text" Type="String" />
            <asp:Parameter Name="bid" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="bid" QueryStringField="bid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

