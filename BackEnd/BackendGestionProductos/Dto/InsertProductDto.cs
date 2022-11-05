using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto
{
    public class InsertProductDto
    {
        public string nombre { get; set; }
        public int idCategoriaProducto { get; set; }
        public string estado { get; set; }
    }
}
