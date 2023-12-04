using System;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using UserLinkDataAccess;
using UserLinkDataAccess.Model;

namespace UserLink
{
    public partial class Users : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            using (var db = new UserContext(connectionstring))
            {
                var users = db.Users;
                UserGrid.DataSource = users.ToList();
                UserGrid.DataBind();
                 

            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            using (var db = new UserContext(connectionstring))
            {
                StringBuilder builder = new StringBuilder();


                builder.Append("ID,Name,DateOfBirth,TelePhoneNumber,Email").Append("\n");

                foreach (User user in db.Users)
                {
                    builder.Append($"{user.ID},{user.Name},{user.DateOfBirth.ToString("dd-MM-yyy")},{user.TelePhoneNumber},{user.Email}\n");
                }


                Response.Clear();
                Response.ContentType = "text/csv";
                Response.AddHeader("Content-Disposition", "attachment;filename=Users.csv");
                Response.Write(builder.ToString());
                Response.End();
            }
        }

        protected void UserGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UserGrid.PageIndex = e.NewPageIndex;
            LoadUsers();
        }
    }
}