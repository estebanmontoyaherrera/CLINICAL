﻿using AutoMapper;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Application.UseCase.Commons.Bases;
using CLINICAL.Utilities.Constants;
using MediatR;
using CLINICAL.Utilities.HelperExtensions;
using Entity = CLINICAL.Domain.Entities;
namespace CLINICAL.Application.UseCase.UseCases.Medic.Commands.ChangeStateCommand
{
    public class ChangeStateMedicHandler : IRequestHandler<ChangeStateMedicCommand, BaseResponse<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public ChangeStateMedicHandler(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        public async Task<BaseResponse<bool>> Handle(ChangeStateMedicCommand request, CancellationToken cancellationToken)
        {
            var response = new BaseResponse<bool>();
            try
            {
                var analysis = _mapper.Map<Entity.Medic>(request);
                var parameters = analysis.GetPropertiesWithValues();
                response.Data = await _unitOfWork.Medic.ExecAsync(SP.uspMedicChangeState, parameters);

                if (response.Data)
                {
                    response.IsSuccess = true;
                    response.Message = GlobalMessage.MESSAGE_UPDATE_STATE;
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
