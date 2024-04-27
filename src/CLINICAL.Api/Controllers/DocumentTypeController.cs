using CLINICAL.Application.UseCase.UseCases.DocumentType.Queries.GetAllQuery;
using CLINICAL.Application.UseCase.UseCases.Exam.Queries.GetAllQuery;
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
    }
}
