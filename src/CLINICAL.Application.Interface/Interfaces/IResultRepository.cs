using CLINICAL.Application.Dtos.Result.Response;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.Interface.Interfaces
{
    public interface IResultRepository: IGenericRepository<Result>
    {
        Task<IEnumerable<GetAllResultResponseDto>> GetAllResults(string storedProcedure, object parameter);
    }
}
