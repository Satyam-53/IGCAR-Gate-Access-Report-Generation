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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                Calendar3.Visible = false;
                Calendar4.Visible = false;
                Calendar5.Visible = false;
                Calendar6.Visible = false;
                GetChart1Data();
                GetChart2Data();
                GetChart3Data();
                GetChartTypes();
                
            }  
        }

        public void GetChart1Data()
        {
            string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select COUNT(TransactionNumber) AS TotTransactions, DoorName FROM Transactions WHERE DateTimeofEvt BETWEEN '" + TextBox1.Text +"' AND '" + TextBox2.Text +"' GROUP BY DoorName Order By DoorName ASC", con);
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
                SqlCommand cmd1 = new SqlCommand("Select COUNT(TransactionNumber) AS TotTransactions, DoorName FROM Transactions WHERE SuccessFailure = 'S'AND DateTimeofEvt BETWEEN '" + TextBox3.Text + "' AND '" + TextBox4.Text + "' GROUP BY DoorName, SuccessFailure ORDER BY DoorName ASC;", con2);
                Series series1 = Chart2.Series["Success"];
                con2.Open();
                SqlDataReader rdr1 = cmd1.ExecuteReader();
                while (rdr1.Read())
                {
                    series1.Points.AddXY(rdr1["DoorName"].ToString(), rdr1["TotTransactions"]);
                }
            }

            using (SqlConnection con3 = new SqlConnection(cs2))
            {
                SqlCommand cmd2 = new SqlCommand("Select COUNT(TransactionNumber) AS TotTransactions, DoorName FROM Transactions WHERE SuccessFailure = 'F'AND DateTimeofEvt BETWEEN '" + TextBox3.Text + "' AND '" + TextBox4.Text + "' GROUP BY DoorName, SuccessFailure ORDER BY DoorName ASC;", con3);
                Series series2 = Chart2.Series["Failure"];
                con3.Open();
                SqlDataReader rdr2 = cmd2.ExecuteReader();
                while (rdr2.Read())
                {
                    series2.Points.AddXY(rdr2["DoorName"].ToString(), rdr2["TotTransactions"]);
                }
            }

        }

        public void GetChart3Data()
        {
            string cs3 = ConfigurationManager.ConnectionStrings["CS3"].ConnectionString;
            using (SqlConnection con4 = new SqlConnection(cs3))
            {
                SqlCommand cmd3 = new SqlCommand("Select COUNT(TransactionNumber) AS TotTransactions, DoorName FROM Transactions WHERE SuccessFailure = 'F' AND ControllerRemarks = 'AccessNotTaken' AND DateTimeofEvt BETWEEN '" + TextBox5.Text + "' AND '" + TextBox6.Text + "' GROUP BY DoorName, SuccessFailure ORDER BY DoorName ASC;", con4);
                Series series3 = Chart3.Series["Validity Expired"];
                con4.Open();
                SqlDataReader rdr3 = cmd3.ExecuteReader();
                while (rdr3.Read())
                {
                    series3.Points.AddXY(rdr3["DoorName"].ToString(), rdr3["TotTransactions"]);
                }
            }

            using (SqlConnection con5 = new SqlConnection(cs3))
            {
                SqlCommand cmd4 = new SqlCommand("Select COUNT(TransactionNumber) AS TotTransactions, DoorName FROM Transactions WHERE SuccessFailure = 'F' AND ControllerRemarks = 'Validity Expired' AND DateTimeofEvt BETWEEN '" + TextBox5.Text + "' AND '" + TextBox6.Text + "' GROUP BY DoorName, SuccessFailure ORDER BY DoorName ASC;", con5);
                Series series4 = Chart3.Series["Access Not Taken"];
                con5.Open();
                SqlDataReader rdr4 = cmd4.ExecuteReader();
                while (rdr4.Read())
                {
                    series4.Points.AddXY(rdr4["DoorName"].ToString(), rdr4["TotTransactions"]);
                }
            }
        }

        private void GetChartTypes()
        {
            foreach(int chartType in Enum.GetValues(typeof(SeriesChartType)))
            {
                ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), chartType), chartType.ToString());
                DropDownList1.Items.Add(li);
                DropDownList2.Items.Add(li);
                DropDownList3.Items.Add(li);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChart1Data();
            Chart1.Series["Series1"].ChartType = (SeriesChartType) Enum.Parse(typeof(SeriesChartType), DropDownList1.SelectedValue);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChart2Data();
            Chart2.Series["Success"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList2.SelectedValue);
            Chart2.Series["Failure"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList2.SelectedValue);
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChart3Data();
            Chart3.Series["Validity Expired"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList3.SelectedValue);
            Chart3.Series["Access Not Taken"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList3.SelectedValue);
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

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar5.Visible)
            {
                Calendar5.Visible = false;
            }
            else
            {
                Calendar5.Visible = true;
            }
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar6.Visible)
            {
                Calendar6.Visible = false;
            }
            else
            {
                Calendar6.Visible = true;
            }
        }

        protected void Calendar5_SelectionChanged(object sender, EventArgs e)
        {
            TextBox5.Text = Calendar5.SelectedDate.ToString("yyyy-MM-dd HH:mm:ss");
            Calendar5.Visible = false;
        }

        protected void Calendar6_SelectionChanged1(object sender, EventArgs e)
        {
            TextBox6.Text = Calendar6.SelectedDate.ToString("yyyy-MM-dd HH:mm:ss");
            Calendar6.Visible = false;
        }

        protected void Calendar5_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
        }

        protected void Calendar6_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CompareReport.aspx");
        }
    }
}