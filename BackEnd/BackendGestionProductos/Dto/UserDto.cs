using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto
{
    public class UserDto
    {
        public int Id { get; set; }
        public string userName { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string identificacion { get; set; }
        public DateTime fechaCreacion { get; set; }
    }
}
