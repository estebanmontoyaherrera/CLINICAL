using AutoMapper;
using CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.CreateCommand;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class DocumentTypeMappingProfile:Profile
    {
        public DocumentTypeMappingProfile()
        {
            //CreateMap<Exam, GetExamByIdResponseDto>()
            //.ReverseMap();

            CreateMap<CreateDocumentTypeCommand, DocumentType>();
            //CreateMap<UpdateExamCommand, Exam>();
            //CreateMap<ChangeStateExamCommand, Exam>();
        }
    }
}
