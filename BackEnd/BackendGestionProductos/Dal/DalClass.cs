using Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal
{
    public class DalClass : Dapper
    {
        public DalClass(string ConnectionString)
        {
            Conexion = ConnectionString;
        }
        /// <summary>
        /// verifica si exite usuario
        /// </summary>
        /// <param name="User"></param>
        /// <param name="Pass"></param>
        /// <returns></returns>
        public bool GetToken(string User, string Pass)
        {
            try
            {
                return SingleQuery<object, bool>("[Token].[GetToken]", new { User = User, Pass = Pass });
            }
            catch (Exception e)
            {
                return false;
            }
        }

        /// <summary>
        /// Obtiene datos del usuario
        /// </summary>
        /// <param name="User"></param>
        /// <param name="Pass"></param>
        /// <returns></returns>
        public List<UserDto> GetUser(string User, string Pass)
        {
            try
            {
                return ListQuery<object, UserDto>("[Admin].[GetUser]", new { User = User, Pass = Pass });
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public List<categoria> GetCategorias()
        {
            try
            {
                return ListQuery<categoria>("[Producto].[GetCategoria]");
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public List<UpdateProductDto> GetProductobyCategoria(int categoria)
        {
            try
            {
                return ListQuery<object, UpdateProductDto>("[Producto].[GetProductobyCategoria]", new { Categoria = categoria });
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public bool InsertProducto(InsertProductDto Producto)
        {
            try
            {
                return SingleQuery<InsertProductDto, bool>("[Producto].[INSERTProducto]", Producto);
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool UpdateProducto(UpdateProductDto Producto)
        {
            try
            {
                return SingleQuery<UpdateProductDto, bool>("[Producto].[UPDATEProducto]", Producto);
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool ChangestateProducto(ChangestateProduct Producto)
        {
            try
            {
                return SingleQuery<ChangestateProduct, bool>("[Producto].[ChangestateProducto]", Producto);
            }
            catch (Exception e)
            {
                return false;
            }
        }

    }
}
