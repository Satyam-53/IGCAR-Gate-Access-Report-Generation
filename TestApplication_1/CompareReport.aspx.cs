using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data.SqlClient;
using System.Configuration;

namespace TestApplication_1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                Calendar3.Visible = false;
                Calendar4.Visible = false;
                GetChart1Data();
                GetChart2Data();
                GetChartTypes();

            }
        }

        public void GetChart1Data()
        {
            string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select COUNT(TransactionNumber) AS TotTransactions, DoorName FROM Transactions WHERE DateTimeofEvt BETWEEN '" + TextBox1.Text + "' AND '" + TextBox2.Text + "' GROUP BY DoorName Order By DoorName ASC", con);
                Series series = Chart1.Series["Series1"];
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    series.Points.AddXY(rdr["DoorName"].ToString(), rdr["TotTransactions"]);

                }
            }
        }

        public void GetChart2Data()
        {
            string cs2 = ConfigurationManager.ConnectionStrings["CS2"].ConnectionString;
            using (SqlConnection con2 = new SqlConnection(cs2))
            {
                SqlCommand cmd1 = new SqlCommand("Select COUNT(TransactionNumber) AS TotTransactions, DoorName FROM Transactions WHERE DateTimeofEvt BETWEEN '" + TextBox3.Text + "' AND '" + TextBox4.Text + "' GROUP BY DoorName ORDER BY DoorName ASC;", con2);
                Series series1 = Chart2.Series["Series2"];
                con2.Open();
                SqlDataReader rdr1 = cmd1.ExecuteReader();
                while (rdr1.Read())
                {
                    series1.Points.AddXY(rdr1["DoorName"].ToString(), rdr1["TotTransactions"]);
                }
            }
        }

        private void GetChartTypes()
        {
            foreach (int chartType in Enum.GetValues(typeof(SeriesChartType)))
            {
                ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), chartType), chartType.ToString());
                DropDownList1.Items.Add(li);
                DropDownList2.Items.Add(li);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChart1Data();
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList1.SelectedValue);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChart2Data();
            Chart2.Series["Series2"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList2.SelectedValue);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            else
            {
                Calendar2.Visible = true;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd HH:mm:ss");
            Calendar1.Visible = false;
        }

        protected void Calendar2_SelectionChanged1(object sender, EventArgs e)
        {
            TextBox2.Text = Calendar2.SelectedDate.ToString("yyyy-MM-dd HH:mm:ss");
            Calendar2.Visible = false;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
        }

        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar3.Visible)
            {
                Calendar3.Visible = false;
            }
            else
            {
                Calendar3.Visible = true;
            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar4.Visible)
            {
                Calendar4.Visible = false;
            }
            else
            {
                Calendar4.Visible = true;
            }
        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            TextBox3.Text = Calendar3.SelectedDate.ToString("yyyy-MM-dd HH:mm:ss");
            Calendar3.Visible = false;
        }

        protected void Calendar4_SelectionChanged1(object sender, EventArgs e)
        {
            TextBox4.Text = Calendar4.SelectedDate.ToString("yyyy-MM-dd HH:mm:ss");
            Calendar4.Visible = false;
        }

        protected void Calendar3_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
        }

        protected void Calendar4_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");
        }
    }
}