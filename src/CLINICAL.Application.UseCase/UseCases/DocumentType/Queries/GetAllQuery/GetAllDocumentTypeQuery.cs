using CLINICAL.Application.Dtos.DocumentType.Response;
using CLINICAL.Application.UseCase.Commons.Bases;
using MediatR;

namespace CLINICAL.Application.UseCase.UseCases.DocumentType.Queries.GetAllQuery
{
    public class GetAllDocumentTypeQuery : IRequest<BasePaginationResponse<IEnumerable<GetAllDocumentTypeResponseDto>>>
    {
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 10;
    }
}
