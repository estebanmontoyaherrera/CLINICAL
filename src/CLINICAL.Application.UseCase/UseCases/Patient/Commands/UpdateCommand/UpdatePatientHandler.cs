using AutoMapper;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Application.UseCase.Commons.Bases;
using CLINICAL.Utilities.Constants;
using CLINICAL.Utilities.HelperExtensions;
using MediatR;
using Entity = CLINICAL.Domain.Entities;
namespace CLINICAL.Application.UseCase.UseCases.Patient.Commands.UpdateCommand
{
    public class UpdatePatientHandler : IRequestHandler<UpdatePatientCommand, BaseResponse<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public UpdatePatientHandler(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        public async Task<BaseResponse<bool>> Handle(UpdatePatientCommand request, CancellationToken cancellationToken)
        {
            var response = new BaseResponse<bool>();

            try
            {
                var patient = _mapper.Map<Entity.Patient>(request);
                var parameters = patient.GetPropertiesWithValues();
                response.Data = await _unitOfWork.Exam.ExecAsync(SP.uspPatientEdit, parameters);
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
