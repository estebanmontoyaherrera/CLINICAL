using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Domain.Entities
{
    public class DocumentType
    {
        public int? DocumentTypeId { get; set; }
        public string? Document { get; set; }
        public int? State { get; set; }
    }
}
