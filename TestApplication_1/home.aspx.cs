using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestApplication_1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportGeneration.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://www.igcar.gov.in/");
        }
    }
}