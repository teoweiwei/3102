using System;
using System.Collections.Generic;

namespace TrafficReport.Models
{
    public class LTADataMallModel
    {
        public class SpeedData
        {
            public string LinkID { get; set; }
            public string RoadName { get; set; }
            public string RoadCategory { get; set; }
            public int SpeedBand { get; set; }
            public string MinimumSpeed { get; set; }
            public string MaximumSpeed { get; set; }
            public string Location { get; set; }
        }

        public class AccidentData
        {
            public string Type { get; set; }
            public double Latitude { get; set; }
            public double Longitude { get; set; }
            public string Message { get; set; }
        }

        public class LTADataMallSpeedBandData
        {
            public List<SpeedData> value { get; set; }
        }

        public class LTADataMallAccidentData
        {
            public List<AccidentData> value { get; set; }
        }
    }
}