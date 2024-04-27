using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Domain.Entities
{
    public class TypesAge
    {
       
        public int? TypeAgeId { get; set; }
        public string? TypeAge { get; set; }
        public int? State { get; set; }
    }
}
