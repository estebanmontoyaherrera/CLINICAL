using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Domain.Entities
{
    public class Gender
    {
        public int? GenderId { get; set; }        
        public string? NameGender { get; set; }
        public int? State { get; set; }
    }
}
