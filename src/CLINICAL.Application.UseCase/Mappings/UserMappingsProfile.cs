using AutoMapper;
using CLINICAL.Application.UseCase.UseCases.User.Commands.CreateCommand;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class UserMappingsProfile : Profile
    {
        public UserMappingsProfile()
        {
            CreateMap<CreateUserCommand, User>();
        }
    }
}
