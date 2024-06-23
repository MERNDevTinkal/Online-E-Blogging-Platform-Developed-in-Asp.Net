<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Change Profile</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="uid"
            DataSourceID="SqlDataSource1" DefaultMode="Edit" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                <asp:BoundField DataField="occupation" HeaderText="Occupation" SortExpression="occupation" />
                <asp:BoundField DataField="uid" HeaderText="uid" ReadOnly="True" SortExpression="uid"
                    Visible="False" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        &nbsp;</p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [users] WHERE [uid] = @uid" InsertCommand="INSERT INTO [users] ([fname], [lname], [location], [occupation], [uid]) VALUES (@fname, @lname, @location, @occupation, @uid)"
        SelectCommand="SELECT [fname], [lname], [location], [occupation], [uid] FROM [users] WHERE ([uid] = @uid)"
        UpdateCommand="UPDATE [users] SET [fname] = @fname, [lname] = @lname, [location] = @location, [occupation] = @occupation WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="occupation" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="uid" SessionField="uid" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="occupation" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

