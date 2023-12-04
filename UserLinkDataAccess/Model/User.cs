using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserLinkDataAccess.Model
{
    [Table("Users")]
    public class User
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }

        public string Name { get; set; }
        public string TelePhoneNumber { get; set; }
        public DateTime DateOfBirth { get; set; }

        [EmailAddress]
        public string Email { get; set; }
    }
}
