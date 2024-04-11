using CLINICAL.Application.Dtos.Medic.Response;
using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;

namespace CLINICAL.Application.UseCase.UseCases.Medic.Queries.GetAllQuery
{
    public class GetAllMedicQuery : IRequest<BaseResponse<IEnumerable<GetAllMedicResponseDto>>>
    {
    }
}
