using CLINICAL.Application.Dtos.DocumentType.Response;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.Interface.Interfaces
{
    public interface IDocumentTypeRepository : IGenericRepository<DocumentType>
    {
        Task<IEnumerable<GetAllDocumentTypeResponseDto>> GetAllDocumentTypes(string storedProcedure, object parameter);
    }
}
