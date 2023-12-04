using System;
using System.Configuration;
using System.Linq;
using System.Web.UI.WebControls;
using UserLinkDataAccess;
using UserLinkDataAccess.Model;

namespace UserLink
{
    public partial class UserDetail : System.Web.UI.Page
    {
        private string  connectionstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dob.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
                using (var db = new UserContext(connectionstring))
                {
                    if(db.Users.Any())
                    {
                        userId.Text = (db.Users.OrderByDescending(c => c.ID).First().ID + 1).ToString();
                    }
                    else
                    {
                        userId.Text = "1";
                    }
                    

                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new UserContext(connectionstring))
                {
                    var users = db.Users.ToList();
                    User user = new User();
                    user.Name = name.Text;
                    user.DateOfBirth = Convert.ToDateTime(dob.Value.ToString());
                    user.TelePhoneNumber = telephonenumber.Text;
                    user.Email = email.Text;


                    db.Users.Add(user);
                    db.SaveChanges();
                }
                Response.Redirect("Users.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error submitting user data')</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["ViewState"] = null;
            Response.Redirect("UserDetail.aspx");
        }
    }
}