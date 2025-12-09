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
        /// Example: MR. MARTINO PETROS DE FLORENCE (TINO) Jr.
        /// </summary>
        [JsonProperty("name")]
        public string Name { get; set; }
    }
}
