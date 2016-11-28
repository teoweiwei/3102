using System;
using System.Collections.Generic;
using System.Linq;
using TrafficReport.Models;

using System.Diagnostics;

namespace TrafficReport.DAL
{
    //This gateway perform database operation on tblRoadName table
    public class RoadNameGateway : DataGateway<tblRoadName>
    {
        Stopwatch saveRoadNameDuration;
        Stopwatch individualRecordDuration;
        Stopwatch checkRecordExistenceDuration;
        Stopwatch saveIntoDBDuration;
        Stopwatch getNearestLocationDuration;
        Stopwatch getRoadSpeedLimitDuration;

        //Save road name data into database
        public List<tblRoadName> SaveRoadNameData(List<LTADataMallModel.SpeedData> dataList)
        {
            Debug.WriteLine("=====Start Saving Road Name Process=====\nNumber of records received: \t" + dataList.Count());
            saveRoadNameDuration = Stopwatch.StartNew();

            //List of successfully saved records
            List<tblRoadName> savedRoadNameData = new List<tblRoadName>();

            //Loop to save each record
            for (int i = 0; i < dataList.Count(); i++)
            {
                individualRecordDuration = Stopwatch.StartNew();

                //Create model can assign value to respective fields
                tblRoadName roadName = new tblRoadName();
                roadName.rnID = Convert.ToInt32(dataList[i].LinkID);
                roadName.rnRoadName = dataList[i].RoadName;
                
                Debug.Write("Record " + i + " getting nearest weather station process duration(ms): \t");

                roadName.rnLocation = GetNearestLocation(dataList[i].Location);

                Debug.Write("Record " + i + " getting maximum road speed limit process duration(ms): \t");
                roadName.rnSpeedLimit = GetRoadSpeedLimit(dataList[i].RoadCategory);
                
                checkRecordExistenceDuration = Stopwatch.StartNew();
                
                //Check whether road name and ID exist in the database
                Boolean checkIDNotExist = SelectById(Convert.ToInt32(dataList[i].LinkID)) == null;
                Boolean checkRoadNameNotExist = data.Where(m => m.rnRoadName.ToLower().Equals(roadName.rnRoadName.ToLower())).ToList().Count() == 0;

                checkRecordExistenceDuration.Stop();
                Debug.WriteLine("Record " + i + " check record existence process duration(ms): \t" + checkRecordExistenceDuration.ElapsedMilliseconds);

                saveIntoDBDuration = Stopwatch.StartNew();

                //Save road name if no record exist in database
                if (checkIDNotExist /*&& checkRoadNameNotExist*/)
                {
                    Insert(roadName);
                    savedRoadNameData.Add(roadName);
                }

                saveIntoDBDuration.Stop();
                Debug.WriteLine("Record " + i + " saving record into DB process duration(ms): \t" + saveIntoDBDuration.ElapsedMilliseconds);


                individualRecordDuration.Stop();
                Debug.WriteLine("Record " + i + " individual total process duration(ms): \t" + individualRecordDuration.ElapsedMilliseconds);
            }

            saveRoadNameDuration.Stop();
            Debug.WriteLine("Total time duration taken to save all records: \t" + saveRoadNameDuration.Elapsed.ToString(@"hh\:mm\:ss"));

            //Return the list of saved records
            return savedRoadNameData;
        }

        //Return the ID of nearest location for the input road name coordinates
        private int GetNearestLocation(string coordinates)
        {
            getNearestLocationDuration = Stopwatch.StartNew();

            LocationNameGateway locationNameGateway = new LocationNameGateway();
            List<tblLocationName> locationName = locationNameGateway.SelectAll().ToList();

            string[] latLng = coordinates.Split(' ');
            int locationID = 0;
            double shortestDistance = 999999999;

            foreach (tblLocationName location in locationName)
            {
                double distance = CalculateDistance(Convert.ToDouble(latLng[0]), Convert.ToDouble(latLng[1]), Convert.ToDouble(location.lnLat), Convert.ToDouble(location.lnLng));

                if (distance < shortestDistance)
                {
                    shortestDistance = distance;
                    locationID = location.lnID;
                }

            }

            getNearestLocationDuration.Stop();
            Debug.WriteLine(getNearestLocationDuration.ElapsedMilliseconds);

            return locationID;
        }

        private double CalculateDistance(double lat1, double lon1, double lat2, double lon2)
        {
            double theta = lon1 - lon2;
            double dist = Math.Sin(deg2rad(lat1)) * Math.Sin(deg2rad(lat2)) + Math.Cos(deg2rad(lat1)) * Math.Cos(deg2rad(lat2)) * Math.Cos(deg2rad(theta));
            dist = Math.Acos(dist);
            dist = rad2deg(dist);
            dist = dist * 60 * 1.1515;

            return dist * 1.609344;
        }

        private double deg2rad(double deg)
        {
            return (deg * Math.PI / 180.0);
        }

        private double rad2deg(double rad)
        {
            return (rad / Math.PI * 180.0);
        }

        //Return speed limit for input road name category 
        private int GetRoadSpeedLimit(string roadCategory)
        {
            getRoadSpeedLimitDuration = Stopwatch.StartNew();

            if (roadCategory.Equals("A"))
            {
                getRoadSpeedLimitDuration.Stop();
                Debug.WriteLine(getRoadSpeedLimitDuration.ElapsedMilliseconds);
                return 90;
            }
            else if (roadCategory.Equals("B"))
            {
                getRoadSpeedLimitDuration.Stop();
                Debug.WriteLine(getRoadSpeedLimitDuration.ElapsedMilliseconds);
                return 70;
            }
            else
            {
                getRoadSpeedLimitDuration.Stop();
                Debug.WriteLine(getRoadSpeedLimitDuration.ElapsedMilliseconds);
                return 50;
            }
        }
    }
}