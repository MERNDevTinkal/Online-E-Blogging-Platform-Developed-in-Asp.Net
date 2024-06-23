using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

/// <summary>
/// Summary description for Database
/// </summary>
public class Database
{
    public static String ConnectionString
    {
        get
        {
            return WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
    }

}
