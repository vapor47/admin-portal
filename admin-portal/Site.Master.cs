using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin_portal
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Convert.ToString(Session["Username"])!="" && Convert.ToInt32(Session["Usertype"]) == 3)
                aAdminActions.Visible = true;
            else
                aAdminActions.Visible = false;

        }

        protected void Abandon_Session()
        {
            Session.Abandon();
        }
    }
}