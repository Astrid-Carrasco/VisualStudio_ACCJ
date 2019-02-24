using App.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;

namespace App.UI.Web.MVC.Common
{
    public static class SecurityHelpers
    {
        public static List<Claim> CreateCleamsUsuario(Usuario usuario)
        {
            //Ingreso a la aplicacion
            var claims = new List<Claim>();

            //Creando pedazos de informacion(podemos crear diversos claims, incluso personalizado como el usuarioID)
            claims.Add(new Claim(ClaimTypes.Name, $"{usuario.Nombres} {usuario.Apellidos}"));
            claims.Add(new Claim(ClaimTypes.NameIdentifier, $"{usuario.Login}"));
            claims.Add(new Claim(ClaimTypes.Email, $"{usuario.Email}"));
            claims.Add(new Claim("UsuarioID", usuario.UsuarioID.ToString()));

            //Creando claims de roles para ser utilizados en conjunto con el atributo de autorize de mvc
            string[] roles = null;
            roles = usuario.Roles.Split(';');

            foreach (string rol in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, rol));
            }

            return claims;
        }

        public static IEnumerable<Claim> GetClaimsByType(string type)
        {
            //Toda la informacion del usuario que esta logueado esta en el objeto identity, 
            //del obj identity puyede leer los claims
            //var identity = HttpContext.Current.User.Identity;

            var identity = (ClaimsIdentity)HttpContext.Current.User.Identity;
            var claims = identity.Claims.Where(item => item.Type == type).ToList();
            return claims;
        }

        public  static string GetUserFullName()
        {
            //? elvisoperator si es nulo no devuelve ningun valor
            var claimValue = GetClaimsByType(ClaimTypes.Name).FirstOrDefault()?.Value;//obtiene solo el 1ero
            return claimValue;

        }

        public static int GetUsuarioID()
        {
            var claimValue = (GetClaimsByType("UsuarioID").FirstOrDefault() != null ? Convert.ToInt32(GetClaimsByType("UsuarioID").FirstOrDefault().Value) : 0);//obtiene solo el 1ero
            return claimValue;
        }

        public static bool IsLogged()
        {
            return HttpContext.Current.User.Identity.IsAuthenticated;//Verificar en asp identity si esta logueado isauthenticated
        }

        public static bool IsAdmin()
        {
            return HttpContext.Current.User.IsInRole("Admin");
        }

    }
}