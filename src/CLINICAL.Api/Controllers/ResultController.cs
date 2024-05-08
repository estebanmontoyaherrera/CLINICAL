using CLINICAL.Application.UseCase.UseCases.Patient.Queries.GetAllQuery;
using CLINICAL.Application.UseCase.UseCases.Result.Queries.GetAllQuery;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CLINICAL.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ResultController : ControllerBase
    {
        private readonly IMediator _mediator;
        public ResultController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("ListResults")]
        public async Task<IActionResult> ListResults([FromQuery] GetAllResultQuery query)
        {
            var response = await _mediator.Send(query);
            return Ok(response);
        }
    }
}
