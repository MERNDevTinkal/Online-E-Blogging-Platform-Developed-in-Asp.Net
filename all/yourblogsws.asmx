<%@ WebService Language="C#" Class="yourblogsws" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class yourblogsws  : System.Web.Services.WebService {

    [WebMethod]
    public int BlogCount()
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(bid) from blogs", con);
            return (int)cmd.ExecuteScalar(); 
        }
        catch (Exception ex)
        {
            return -1; 
        }
        finally
        {
            con.Close();
        }
    }

    [WebMethod]
    public DataSet RecentBlogs(int count)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            SqlDataAdapter cmd = new SqlDataAdapter("select top " + count.ToString() + " title, url ='http://localhost:1049/yourblogs/all/showblog.aspx?bid=' +  ltrim(str(bid))  from blogs order by bid desc", con);
            DataSet ds = new DataSet();
            cmd.Fill(ds, "blogs");
            return ds;
        }
        catch (Exception ex)
        {
            return null;
        }
    }


    [WebMethod]
    public DataSet Search(string pattern)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            SqlDataAdapter cmd = new SqlDataAdapter("select title, url ='http://localhost:1049/yourblogs/all/showblog.aspx?bid=' +  ltrim(str(bid))  from blogs where title like '%" + pattern + "%'", con);
            DataSet ds = new DataSet();
            cmd.Fill(ds, "blogs");
            return ds;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    
    
    
}

