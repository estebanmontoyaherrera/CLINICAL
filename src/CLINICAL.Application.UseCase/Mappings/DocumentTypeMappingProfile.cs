using AutoMapper;
using CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.CreateCommand;
using CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.UpdateCommand;
using CLINICAL.Domain.Entities;

namespace CLINICAL.Application.UseCase.Mappings
{
    public class DocumentTypeMappingProfile:Profile
    {
        public DocumentTypeMappingProfile()
        {
            
            CreateMap<CreateDocumentTypeCommand, DocumentType>();
            CreateMap<UpdateDocumentTypeCommand, DocumentType>();
            //CreateMap<ChangeStateExamCommand, Exam>();
        }
    }
}
