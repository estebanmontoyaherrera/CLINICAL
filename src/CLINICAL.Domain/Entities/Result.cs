using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Domain.Entities
{
    public class Result
    {
        public int ResultId { get; set; }
        public int TakeExamId { get; set; }
        public int State { get; set; }
        public DateTime AuditCreateDate { get; set; }
    }
}
