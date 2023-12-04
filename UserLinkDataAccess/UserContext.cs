using System.Data.Entity;
using UserLinkDataAccess.Model;

namespace UserLinkDataAccess
{
    public class UserContext : DbContext
    {
        public UserContext(string connectionString)
        {
            Database.Connection.ConnectionString = connectionString;
        }

        public DbSet<User> Users { get; set; }
    }
}
