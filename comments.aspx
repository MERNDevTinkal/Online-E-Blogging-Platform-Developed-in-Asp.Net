<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
    Comments</h2>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
          <table width="100%">
          <tr>
           <td>Email</td>
           <td><%# Eval("email") %></td>
          </tr>
          <tr>
           <td valign="top">Text</td>
           <td><asp:textbox ID="tb1" runat="server" Text='<%# Eval("text") %>' TextMode="MultiLine" Rows="5" columns="50"></asp:textbox> </td>
          </tr>
          
          <tr>
           <td>Posted On</td>
           <td><%# Eval("postedon") %></td>
          </tr>
          </table>
          <p />
        </ItemTemplate>
                
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [email], [text], [postedon] FROM [comments] WHERE ([bid] = @bid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="bid" QueryStringField="bid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

