using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Szkola.Models
{
    public class SchoolsData
    {
        public int ID { get; set; }
        [JsonProperty("name")]

        public string Name { get; set; }

        [JsonProperty("website")]

        public string Website { get; set; }

        [JsonProperty("format_description")]
        public string FormatDescription { get; set; }
        [JsonProperty("gender")]
        public string Gender { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }


        [JsonProperty("street")]
        public string Street { get; set; }

        [JsonProperty("city")]
        public string City { get; set; }

        [JsonProperty("state")]
        public string State { get; set; }

        [JsonProperty("zip")]
        public string Zip { get; set; }

        [JsonProperty("country")]
        public string Country { get; set; }

        [JsonProperty("contact_number")]
        public string ContactNumber { get; set; }

        [JsonProperty("contact_email")]
        public string ContactEmail { get; set; }
    }
}