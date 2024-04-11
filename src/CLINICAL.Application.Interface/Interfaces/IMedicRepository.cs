using CLINICAL.Application.Dtos.Medic.Response;
using CLINICAL.Domain.Entities;
namespace CLINICAL.Application.Interface.Interfaces
{
    public interface IMedicRepository : IGenericRepository<Medic>
    {
        Task<IEnumerable<GetAllMedicResponseDto>> GetAllMedics(string storedProcedure);
        
    }
}
