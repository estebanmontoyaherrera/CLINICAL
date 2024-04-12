using CLINICAL.Application.Dtos.Exam.Response;
using CLINICAL.Application.Dtos.TakeExam.Response;
using CLINICAL.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.Interface.Interfaces
{
    public interface ITakeExamRepository : IGenericRepository<TakeExam>
    {
        Task<IEnumerable<GetAllTakeExamResponseDto>> GetAllTakeExams(string storedProcedure, object parameter);
    }
}
