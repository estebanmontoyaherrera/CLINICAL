using CLINICAL.Application.Dtos.DocumentType.Response;
using CLINICAL.Application.Dtos.Exam.Response;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Domain.Entities;
using CLINICAL.Persistence.Context;
using Dapper;
using System.Data;

namespace CLINICAL.Persistence.Repositories
{
    public class DocumentTypeRepository : GenericRepository<DocumentType>, IDocumentTypeRepository
    {
        private readonly ApplicationDbContext _context;
        public DocumentTypeRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }
        public async Task<IEnumerable<GetAllDocumentTypeResponseDto>> GetAllDocumentTypes(string storedProcedure, object parameter)
        {
            using var connection = _context.CreateConnection;
            var objectParam = new DynamicParameters(parameter);
            var documentTypes = await connection.QueryAsync<GetAllDocumentTypeResponseDto>(storedProcedure, param: objectParam, commandType: CommandType.StoredProcedure);
            return documentTypes;
        }
    }
}
