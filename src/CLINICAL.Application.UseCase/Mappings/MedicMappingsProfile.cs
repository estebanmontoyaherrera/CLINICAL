using AutoMapper;
using CLINICAL.Application.Dtos.Medic.Response;
using CLINICAL.Application.UseCase.UseCases.Medic.Commands.CreateCommand;
using CLINICAL.Application.UseCase.UseCases.Medic.Commands.UpdateCommand;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class MedicMappingsProfile : Profile
    {
        public MedicMappingsProfile()
        {
            CreateMap<Medic, GetMedicByIdResponseDto>()
            .ReverseMap();

            CreateMap<CreateMedicCommand, Medic>();
            CreateMap<UpdateMedicCommand, Medic>();
            //CreateMap<ChangeStatePatientCommand, Patient>();
        }
    }
}
