using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.Dtos.TakeExam.Response
{
    public class GetTakeExamByIdResponseDto
    {
        public int TakeExamId { get; set; }
        public int? PatientId { get; set; }
        public int? MedicId { get; set; }
        public IEnumerable<GetTakeExamDetailByTakeExamIdResponseDto>? TakeExamDetails { get; set; }

    }

    public class GetTakeExamDetailByTakeExamIdResponseDto 
    {
        public int TakeExamDetailId { get; set; }
        public int TakeExamId { get; set; }
        public int ExamId { get; set; }
        public int AnalysisId { get; set; }

    }
}
