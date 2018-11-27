using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin_portal
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Int16.Parse(Session["Usertype"].ToString()) != 3)
                {
                    Response.Redirect("Login.aspx");
                }
            } catch(NullReferenceException ex)
            {
                Console.WriteLine(ex.StackTrace);
                Response.Redirect("Login.aspx");
            }
        
        }

        protected void adminMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            adminMultiView.ActiveViewIndex = Int32.Parse(e.Item.Value);
        }

        protected void fv_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            this.fv.DataBind();
        }
        protected void ufv_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            this.fv.DataBind();
        }
    }
}