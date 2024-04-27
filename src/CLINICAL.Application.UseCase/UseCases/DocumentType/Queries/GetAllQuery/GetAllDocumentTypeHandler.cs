using CLINICAL.Application.Dtos.DocumentType.Response;
using CLINICAL.Application.Dtos.Exam.Response;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Application.UseCase.Commons.Bases;
using CLINICAL.Application.UseCase.UseCases.Exam.Queries.GetAllQuery;
using CLINICAL.Utilities.Constants;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static CLINICAL.Utilities.Constants.SP;

namespace CLINICAL.Application.UseCase.UseCases.DocumentType.Queries.GetAllQuery
{
    public class GetAllDocumentTypeHandler : IRequestHandler<GetAllDocumentTypeQuery, BasePaginationResponse<IEnumerable<GetAllDocumentTypeResponseDto>>>
    {
        private readonly IUnitOfWork _unitOfWork;
        public GetAllDocumentTypeHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public async Task<BasePaginationResponse<IEnumerable<GetAllDocumentTypeResponseDto>>> Handle(GetAllDocumentTypeQuery request, CancellationToken cancellationToken)
        {
            var response = new BasePaginationResponse<IEnumerable<GetAllDocumentTypeResponseDto>>();

            try
            {
                var count = await _unitOfWork.DocumentType.CountAsync(TB.DocumentTypes);
                var documenType = await _unitOfWork.DocumentType.GetAllDocumentTypes(SP.uspDocumentTypeList, request);

                if (documenType is not null)
                {
                    response.IsSuccess = true;
                    response.PageNumber = request.PageNumber;
                    response.TotalPages = (int)Math.Ceiling(count / (double)request.PageSize);
                    response.TotalCount = count;
                    response.Data = documenType;
                    response.Message = GlobalMessage.MESSAGE_QUERY;
                }
            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
            }

            return response;
        }
    }
}
