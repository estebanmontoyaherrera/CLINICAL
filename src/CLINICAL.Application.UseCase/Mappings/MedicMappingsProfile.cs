using AutoMapper;
using CLINICAL.Application.Dtos.Medic.Response;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class MedicMappingsProfile : Profile
    {
        public MedicMappingsProfile()
        {
            CreateMap<Medic, GetMedicByIdResponseDto>()
            .ReverseMap();

            //CreateMap<CreatePatientCommand, Patient>();
            //CreateMap<UpdatePatientCommand, Patient>();
            //CreateMap<ChangeStatePatientCommand, Patient>();
        }
    }
}
