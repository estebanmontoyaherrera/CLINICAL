using CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.CreateCommand;
using CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.DeleteCommand;
using CLINICAL.Application.UseCase.UseCases.DocumentType.Commands.UpdateCommand;
using CLINICAL.Application.UseCase.UseCases.DocumentType.Queries.GetAllQuery;
using CLINICAL.Application.UseCase.UseCases.Exam.Commands.CreateCommand;
using CLINICAL.Application.UseCase.UseCases.Exam.Commands.RemoveCommand;
using CLINICAL.Application.UseCase.UseCases.Exam.Commands.UpdateCommand;
using CLINICAL.Application.UseCase.UseCases.Exam.Queries.GetAllQuery;
using CLINICAL.Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CLINICAL.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DocumentTypeController : ControllerBase
    {
        private readonly IMediator _mediator;

        public DocumentTypeController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("ListDocumentTypes")]
        public async Task<IActionResult> ListDocumentTypes([FromQuery] GetAllDocumentTypeQuery query)
        {
            var response = await _mediator.Send(query);
            return Ok(response);
        }

        [HttpPost("Register")]
        public async Task<IActionResult> RegisterDocumentType([FromBody] CreateDocumentTypeCommand command)
        {
            var response = await _mediator.Send(command);
            return Ok(response);
        }

        [HttpPut("Edit")]
        public async Task<IActionResult> EditDocumentType([FromBody] UpdateDocumentTypeCommand command)
        {
            var response = await _mediator.Send(command);
            return Ok(response);
        }

        [HttpDelete("Remove/{documentTypeId:int}")]
        public async Task<IActionResult> RemoveExam(int documentTypeId)
        {
            var response = await _mediator.Send(new DeleteDocumentTypeCommand() { DocumentTypeId = documentTypeId });
            return Ok(response);
        }
    }
}
