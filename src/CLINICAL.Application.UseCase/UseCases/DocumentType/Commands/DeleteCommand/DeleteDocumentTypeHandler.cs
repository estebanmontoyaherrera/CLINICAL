using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Application.UseCase.Commons.Bases;
using CLINICAL.Utilities.Constants;
using MediatR;

namespace CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.DeleteCommand
{
    public class DeleteDocumentTypeHandler : IRequestHandler<DeleteDocumentTypeCommand, BaseResponse<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        public DeleteDocumentTypeHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public async Task<BaseResponse<bool>> Handle(DeleteDocumentTypeCommand request, CancellationToken cancellationToken)
        {
            var response = new BaseResponse<bool>();
            try
            {
                response.Data = await _unitOfWork.DocumentType.ExecAsync(SP.uspDocumentTypeRemove, request);
                if (response.Data)
                {
                    response.IsSuccess = true;
                    response.Message = GlobalMessage.MESSAGE_DELETE;
                    return response;
                }
            }
            catch (Exception e)
            {
                response.Message = e.Message;
            }

            return response;
        }
    }
}
