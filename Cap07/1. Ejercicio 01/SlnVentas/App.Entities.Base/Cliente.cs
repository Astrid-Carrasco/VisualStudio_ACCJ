using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Entities.Base
{
    [Table("Cliente")]
    public class Cliente
    {
        public int ClienteID { get; set; }

        
        public string NombresApellidos { get; set; }
       
    }
}
