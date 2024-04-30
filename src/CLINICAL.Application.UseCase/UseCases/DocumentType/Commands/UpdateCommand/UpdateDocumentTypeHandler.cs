using AutoMapper;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Application.UseCase.Commons.Bases;
using CLINICAL.Utilities.Constants;
using CLINICAL.Utilities.HelperExtensions;
using MediatR;
using Entity = CLINICAL.Domain.Entities;
namespace CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.UpdateCommand
{
    public class UpdateDocumentTypeHandler : IRequestHandler<UpdateDocumentTypeCommand, BaseResponse<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        public UpdateDocumentTypeHandler(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        public async Task<BaseResponse<bool>> Handle(UpdateDocumentTypeCommand request, CancellationToken cancellationToken)
        {
            var response = new BaseResponse<bool>();

            try
            {
                var documentType = _mapper.Map<Entity.DocumentType>(request);
                var parameters = documentType.GetPropertiesWithValues();
                response.Data = await _unitOfWork.Exam.ExecAsync(SP.uspDocumentTypeEdit, parameters);
                if (response.Data)
                {
                    response.IsSuccess = true;
                    response.Message = GlobalMessage.MESSAGE_UPDATE;
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
