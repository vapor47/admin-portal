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

        }

        protected void adminMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            adminMultiView.ActiveViewIndex = Int32.Parse(e.Item.Value);
        }

        protected void fv_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            this.fv.DataBind();
        }
    }
}