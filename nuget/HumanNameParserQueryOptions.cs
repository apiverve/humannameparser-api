using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.HumanNameParser
{
    /// <summary>
    /// Query options for the Human Name Parser API
    /// </summary>
    public class HumanNameParserQueryOptions
    {
        /// <summary>
        /// The human name to parse
        /// </summary>
        [JsonProperty("name")]
        public string Name { get; set; }
    }
}
