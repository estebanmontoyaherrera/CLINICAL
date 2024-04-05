using AutoMapper;
using CLINICAL.Application.Interface.Interfaces;
using CLINICAL.Application.UseCase.Commons.Bases;
using CLINICAL.Utilities.Constants;
using CLINICAL.Utilities.HelperExtensions;
using Entity = CLINICAL.Domain.Entities;
using MediatR;

namespace CLINICAL.Application.UseCase.UseCases.Analysis.Commands.ChangeStateCommand;

public class ChangeStateAnalysisHandler : IRequestHandler<ChangeStateAnalysisCommand, BaseResponse<bool>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public ChangeStateAnalysisHandler(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task<BaseResponse<bool>> Handle(ChangeStateAnalysisCommand request, CancellationToken cancellationToken)
    {
        var response = new BaseResponse<bool>();
        try
        {
            var analysis = _mapper.Map<Entity.Analysis>(request);
            var parameters = analysis.GetPropertiesWithValues
                ();
            response.Data = await _unitOfWork.Analysis.ExecAsync(SP.uspAnalysisChangeState, parameters);

            if (response.Data)
            {
                response.IsSuccess = true;
                response.Message = "Se actualizó el estado correctamente";
            }
        }
        catch (Exception e)
        {
            response.Message = e.Message;
        }

        return response;
    }
}