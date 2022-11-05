using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http.Cors;
using Business;

namespace BackendGestionProductos.Class
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ApplicationAuthProvider : OAuthAuthorizationServerProvider
    {
        public BusinessClass Business = new BusinessClass(Properties.Settings.Default.Connection);
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            string Pass = AES.EncryptAES(context.Password);
            bool Valid = Business.GetToken(context.UserName, Pass);
            if (Valid)
            {
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim("Username", context.UserName));
                identity.AddClaim(new Claim("Password", context.Password));
                context.Validated(identity);
            }
            else
            {
                context.SetError("invalid_grant", "The user name or password is incorrect.");
                return;
            }
        }
    }
}