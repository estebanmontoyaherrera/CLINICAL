using CLINICAL.Application.Dtos.Exam.Response;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Persistence.Context;
using Dapper;
using System.Data;

namespace CLINICAL.Persistence.Repositories
{
    public class ExamRepository : IExamRepository
    {
        private readonly ApplicationDbContext _context;
        public ExamRepository( ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<GetAllExamResponseDto>> GetAllExams(string storedProcedure)
        {
            using var connection = _context.CreateConnection;
            var exams=await connection.QueryAsync<GetAllExamResponseDto>(storedProcedure,commandType:CommandType.StoredProcedure);
            return exams;
        }
    }
}
