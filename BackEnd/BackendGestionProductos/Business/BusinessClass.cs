using Dal;
using Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class BusinessClass
    {
        public DalClass Dal;

        public BusinessClass(string Connection)
        {
            Dal = new DalClass(Connection);
        }

        public bool GetToken(string User, string Pass)
        {
            return Dal.GetToken(User, Pass);
        }

        public List<UserDto> GetUser(string User, string Pass)
        {
            return Dal.GetUser(User, Pass);
        }

        public List<categoria> GetCategorias()
        {
            return Dal.GetCategorias();
        }

        public List<UpdateProductDto> GetProductobyCategoria(int categoria)
        {
            return Dal.GetProductobyCategoria(categoria);
        }

        public bool InsertProducto(InsertProductDto Producto)
        {
            return Dal.InsertProducto(Producto);
        }

        public bool UpdateProducto(UpdateProductDto Producto)
        {
            return Dal.UpdateProducto(Producto);
        }

        public bool ChangestateProducto(ChangestateProduct Producto)
        {
            return Dal.ChangestateProducto(Producto);
        }

    }
}
