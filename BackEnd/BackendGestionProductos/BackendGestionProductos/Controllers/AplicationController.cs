using BackendGestionProductos.Class;
using Business;
using Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BackendGestionProductos.Controllers
{
    public class AplicationController : ApiController
    {
        public BusinessClass Business = new BusinessClass(Properties.Settings.Default.Connection);

        [Authorize]
        [HttpGet, Route("GetUserData")]
        public List<UserDto> GetUser(string User, string Pass)
        {
            Pass = AES.EncryptAES(Pass);
            return Business.GetUser(User, Pass);
        }

        [Authorize]
        [HttpGet, Route("GetCategorias")]
        public List<categoria> GetCategorias()
        {
            return Business.GetCategorias();
        }

        [Authorize]
        [HttpGet, Route("GetProductobyCategoria")]
        public List<UpdateProductDto> GetProductobyCategoria(int categoria)
        {
            return Business.GetProductobyCategoria(categoria);
        }

        [Authorize]
        [HttpPut, Route("InsertProducto")]
        public bool InsertProducto(InsertProductDto Producto)
        {
            return Business.InsertProducto(Producto);
        }

        [Authorize]
        [HttpPost, Route("UpdateProducto")]
        public bool UpdateProducto(UpdateProductDto Producto)
        {
            return Business.UpdateProducto(Producto);
        }

        [Authorize]
        [HttpPost, Route("ChangestateProducto")]
        public bool ChangestateProducto(ChangestateProduct Producto)
        {
            return Business.ChangestateProducto(Producto);
        }


    }
}
