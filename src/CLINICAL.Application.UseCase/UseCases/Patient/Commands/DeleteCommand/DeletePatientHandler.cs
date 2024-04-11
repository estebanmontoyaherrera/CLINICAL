using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Application.UseCase.Commons.Bases;
using CLINICAL.Application.UseCase.UseCases.Exam.Commands.RemoveCommand;
using CLINICAL.Utilities.Constants;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLINICAL.Application.UseCase.UseCases.Patient.Commands.DeleteCommand
{
    public class DeletePatientHandler : IRequestHandler<DeletePatientCommand, BaseResponse<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        public DeletePatientHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public async Task<BaseResponse<bool>> Handle(DeletePatientCommand request, CancellationToken cancellationToken)
        {
            var response = new BaseResponse<bool>();
            try
            {
                response.Data = await _unitOfWork.Exam.ExecAsync(SP.uspPatientRemove, request);
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
